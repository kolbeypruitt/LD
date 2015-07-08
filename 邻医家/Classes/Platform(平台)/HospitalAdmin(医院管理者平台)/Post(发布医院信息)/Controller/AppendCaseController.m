//
//  AppendCaseController.m
//  邻医家
//
//  Created by Daniel on 15/7/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "AppendCaseController.h"
#import "HospitalEnterTextField.h"
#import "UITextField+LD.h"
#import "UILabel+LD.h"
#import "Common.h"
#import "UIBarButtonItem+ENTER.h"
#import "LDTextView.h"
@interface AppendCaseController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic,strong) NSMutableArray *labels;
@property (nonatomic,strong) NSMutableArray *lines;
@property (nonatomic,strong) NSMutableArray *textfields;
@property (nonatomic,strong) NSMutableArray *textViews;
@end


@implementation AppendCaseController
- (NSMutableArray *)labels
{
    if (_labels == nil) {
        _labels = [NSMutableArray array];
    }
    return _labels;
}
- (NSMutableArray *)lines
{
    if (_lines == nil) {
        _lines = [NSMutableArray array];
    }
    return _lines;
}
- (NSMutableArray *)textfields
{
    if (_textfields == nil) {
        _textfields = [NSMutableArray array];
    }
    return _textfields;
}
- (NSMutableArray *)textViews
{
    if (_textViews == nil) {
        _textViews = [NSMutableArray array];
    }
    return _textViews;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self addCustomViews];
    [self layoutCustomViews];
}
- (void)setup
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(commit) title:@"提交"];
    self.title = @"发布病例";
    self.scrollView.contentSize = CGSizeMake(0, self.scrollView.frame.size.height * 1.5);
    self.scrollView.backgroundColor = BGCOLOR;
}
- (void)commit
{
    
}
- (void)addCustomViews
{
    NSArray *titleLabels = @[@"性别",@"真实姓名",@"年龄",@"科室",@"主诉",@"现病史",@"既往病史",@"查体",@"辅助检查",@"诊断",@"治疗过程"];
    NSArray *placeholder = @[@"请点击选择",@"请输入真实姓名",@"请输入年龄",@"请点击选择"];
    
    //添加标签
    for (int i = 0; i < titleLabels.count; i++) {
        UILabel *titleLabel = [UILabel labelWithTitle:[titleLabels objectAtIndex:i]
                                                 font:15
                                            textColor:[UIColor blackColor]];
        [self.scrollView addSubview:titleLabel];
        [self.labels addObject:titleLabel];
    }
    
    //添加textfield
    for (int i = 0; i < placeholder.count; i++) {
        HospitalEnterTextField *textfield = [[HospitalEnterTextField alloc] init];
        textfield.textAlignment = NSTextAlignmentRight;
        textfield.placeholder = [placeholder objectAtIndex:i];
        textfield.tag = i;
        textfield.delegate = self;
        textfield.font = [UIFont systemFontOfSize:15];
        [textfield setValue:textfield.font forKeyPath:@"_placeholderLabel.font"];
        [self.scrollView addSubview:textfield];
        [self.textfields addObject:textfield];
    }
    
    //添加textview
    for (int i = 0; i < titleLabels.count - placeholder.count; i++) {
        LDTextView *textView = [[LDTextView alloc] init];
        [self.scrollView addSubview:textView];
    }
}
- (void)layoutCustomViews
{
    
}
@end



















