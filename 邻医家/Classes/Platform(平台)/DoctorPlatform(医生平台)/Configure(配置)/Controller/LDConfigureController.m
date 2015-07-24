//
//  LDConfigureController.m
//  邻医家
//
//  Created by Daniel on 15/7/24.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.

//
#import "BaseResult.h"
#import "MBProgressHUD+MJ.h"
#import "LDConfigureParam.h"
#import "LDCheckBox.h"
#import "UIBarButtonItem+ENTER.h"
#import "LDConfigureMessageView.h"
#import "LDConfigureController.h"
#import "LDBaseParam.h"
#import "LDConfigureResult.h"
#import "LDConfigureTool.h"
//typedef struct ConfigureFlag
//{
//    unsigned int Flag1 : 1;
//    unsigned int Flag2 : 1;
//    unsigned int Flag3 : 1;
//    unsigned int Flag4 : 1;
//    unsigned int Flag5 : 1;
//    unsigned int Flag6 : 1;
//    unsigned int Flag7 : 1;
//    unsigned int Flag8 : 1;
//}ConfigureFlag;
@interface LDConfigureController ()
@property (nonatomic,strong) NSMutableArray *configureViews;
//@property (nonatomic,assign) ConfigureFlag configureF;
@property (nonatomic,copy) NSString *settings;
@property (nonatomic,copy) NSMutableString *flagString;
@end


@implementation LDConfigureController
- (NSMutableString *)flagString
{
    if (_flagString == nil) {
        _flagString = [@"00000000" mutableCopy];
    }
    return _flagString;
}
- (NSMutableArray *)configureViews
{
    if (_configureViews == nil) {
        _configureViews = [NSMutableArray array];
    }
    return _configureViews;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(saveConfigure) title:@"保存"];
    [self addCustomViews];
    [self loadData];
}
- (void)addCustomViews
{
    const int count = 8;
    NSArray *configureArray = @[@"医友请医信息",@"外出会诊(开刀)信息",@"自由转诊信息",@"兼职(多点执业)招聘",@"住院/专科医生规培或实习",@"进修",@"博士后进站招聘",@"全职招聘"];
    for (int i = 0; i < count; i++) {
        LDConfigureMessageView *configureView = [[LDConfigureMessageView alloc] init];
        configureView.tag = i;
        configureView.configureLabel.text = configureArray[i];
        [configureView addObserver:self forKeyPath:@"checkBox.selected" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
        
        [self.view addSubview:configureView];
        [self.configureViews addObject:configureView];
    }
    
    [self layoutCustomViews];
}
- (void)dealloc
{
    for (int i = 0; i < self.configureViews.count; i++) {
        LDConfigureMessageView *configureView = self.configureViews[i];
        [configureView removeObserver:self forKeyPath:@"checkBox.selected"];
    }
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([object isKindOfClass:[LDConfigureMessageView class]]) {
        LDConfigureMessageView *messageView = (LDConfigureMessageView *)object;
        NSNumber *a = (NSNumber *)change[@"new"];
        [self changeFlagWithValue:a atIndex:messageView.tag];
    }
}
- (void)changeFlagWithValue:(NSNumber*)flag atIndex:(int)index
{
    NSString *valueToChange = [NSString stringWithFormat:@"%@",flag];
    [self.flagString replaceCharactersInRange:NSMakeRange(index, 1) withString:valueToChange];
    NSLog(@"%@",self.flagString);
}
- (void)layoutCustomViews
{
    CGFloat configureX = 0;
    CGFloat configureY = 0;
    CGFloat configureW = self.view.frame.size.width;
    CGFloat configureH = 44;
    
    for ( int i = 0; i < self.configureViews.count; i++) {
        LDConfigureMessageView *messageView = self.configureViews[i];
        configureY = 64 + (configureH + 10) * i;
        messageView.frame = CGRectMake(configureX, configureY, configureW, configureH);
    }
}

- (void)loadData
{
    LDBaseParam *param = [LDBaseParam param];
    [LDConfigureTool getConfigureWithParam:param success:^(LDConfigureResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            self.settings = result.settings;
        }
    } failure:^(NSError *error) {
        
    }];
}
- (void)setSettings:(NSString *)settings
{
    _settings = settings;
    NSArray *setArray = [settings componentsSeparatedByString:@","];
    for (int i = 0; i < setArray.count; i++) {
        LDConfigureMessageView *messageView = self.configureViews[i];
        NSString *flag = setArray[i];
        
        if ([flag isEqualToString:@"1"]) {
            messageView.checkBox.selected = YES;
        }else if([flag isEqualToString:@"0"])
        {
            messageView.checkBox.selected = NO;
        }else
        {
            
        }
    }
}
- (void)saveConfigure
{
    NSMutableString *commitStr = [[NSMutableString alloc] init];
    for (int i = 0; i < self.flagString.length; i++) {
        unichar c = [self.flagString characterAtIndex:i];
        [commitStr appendString:[NSString stringWithFormat:@"%c,",c]];
    }
    [commitStr deleteCharactersInRange:NSMakeRange(commitStr.length - 1, 1)];
    LDConfigureParam *param = [[LDConfigureParam alloc] init];
    param.settings = [commitStr copy];
    [LDConfigureTool changeConfigureWithParam:param success:^(BaseResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            [MBProgressHUD showError:@"保存失败!"];
        }
    } failure:^(NSError *error) {
        [MBProgressHUD showError:@"请求网络失败!"];
    }];
}


@end
