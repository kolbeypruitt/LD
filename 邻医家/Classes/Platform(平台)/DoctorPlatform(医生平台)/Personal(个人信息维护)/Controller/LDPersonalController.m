//
//  LDPersonalController.m
//  邻医家
//
//  Created by Daniel on 15/7/22.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "AssignmentTool.h"
#import "LDNotification.h"
#import "LDArrangement.h"
#import "ChangeArrangeTool.h"
#import "MBProgressHUD+MJ.h"
#import "BaseResult.h"
#import "LDArrangementParam.h"
#import "LDCheckView.h"
#import "UIBarButtonItem+ENTER.h"
#import "LDPersonalController.h"
#import "AssignmentTool.h"
#import "Arrangement.h"
@interface LDPersonalController ()
@property (nonatomic,strong) NSMutableString *totalString;
@end

@implementation LDPersonalController
- (NSMutableString *)totalString
{
    if (_totalString == nil) {
        _totalString = [NSMutableString string];
    }
    return _totalString;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(uploadArrangement) title:@"保存"];
    LDArrangement *arrangement = [AssignmentTool arrangement];
    [self loadMessage];
    self.arrangement = arrangement;
}
- (void)uploadArrangement
{
    if ([self messageComplete]) {
        LDArrangementParam *param = [LDArrangementParam paramWithArrangements:[self setupTotalString] arrangeHospitals:self.hospitalString];
        [ChangeArrangeTool changeArrangeWithParam:param success:^(BaseResult *result) {
            if([result.status isEqualToString:@"S"])
            {
                LDArrangement *arrangement = [[LDArrangement alloc] init];
                arrangement.arrangements = param.arrangements;
                arrangement.arrangeHospitals = param.arrangeHospitals;
                
                [AssignmentTool saveAssignment:arrangement];
#warning save success,reload upper page 
                [[NSNotificationCenter defaultCenter] postNotificationName:REFRESHASSIGNMENTNOTIFICATION object:self];
                [self.navigationController popViewControllerAnimated:YES];
            }else
            {
                [MBProgressHUD showError:@"保存失败!"];
            }
        } failure:^(NSError *error) {
            [MBProgressHUD showError:@"请求网络失败!"];
        }];
    }
}
- (void)loadMessage
{
    for (int i = 0; i < self.checkViews.count; i++) {
        LDCheckView *checkView = self.checkViews[i];
        [self.totalString appendString:[NSString stringWithFormat:@"%@;",checkView.checkMessage]];
    }
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([object isKindOfClass:[LDCheckView class]]) {
        LDCheckView *checkView = (LDCheckView *)object;
        [self updateTotalStingWithNewSting:checkView.checkMessage atIndex:checkView.tag];
    }
}
- (void)updateTotalStingWithNewSting:(NSString *)newString atIndex:(int)index
{
    
    NSRange range = NSMakeRange(index * (newString.length + 1),newString.length);
    [self.totalString replaceCharactersInRange:range withString:newString];
}
- (NSMutableString *)setupTotalString
{
    NSMutableString *tmpString = [self.totalString mutableCopy];
    [tmpString deleteCharactersInRange:NSMakeRange(tmpString.length - 1, 1)];
    return tmpString;
}
@end
