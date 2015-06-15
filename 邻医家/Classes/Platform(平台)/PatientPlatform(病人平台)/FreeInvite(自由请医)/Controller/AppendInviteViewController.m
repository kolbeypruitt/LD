//
//  AppendInviteViewController.m
//  邻医家
//
//  Created by Daniel on 15/6/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//


#define COUNT 12
#import "AppendInviteViewController.h"
#import "Common.h"
#import "UILabel+LD.h"
#import "UIBarButtonItem+ENTER.h"
#import "UIButton+LD.h"
#import "UITextField+LD.h"
@interface AppendInviteViewController () <UIScrollViewDelegate,UITextFieldDelegate>
@property (nonatomic,weak) UIScrollView *scrollView;
@property (nonatomic,weak) UIButton *commitBtn;
@property (nonatomic,strong) NSMutableArray *textFields;
@property (nonatomic,strong) NSMutableArray *lines;
@property (nonatomic,strong) NSMutableArray *labels;
@end
@implementation AppendInviteViewController
- (NSMutableArray *)labels
{
    if (_labels == nil) {
        _labels = [NSMutableArray array];
    }
    return _labels;
}
- (NSMutableArray *)textFields
{
    if (_textFields == nil) {
        _textFields = [NSMutableArray array];
    }
    return _textFields;
}
- (NSMutableArray *)lines
{
    if (_lines == nil) {
        _lines = [NSMutableArray array];
    }
    return _lines;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"增加自由请医";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = nil;
    [self addCustomViews];
    [self layoutCustomViews];
}

- (void)addCustomViews
{
    NSArray *labelArray = @[@"姓名",@"身份证号",@"性别",@"最后一次就医医院",@"最后一次就医科室",@"最后一次诊断",@"邀请医生的地址",@"邀请医生的专业",@"邀请医生的职位",@"请医目的",@"VIP",@"备注"];
    NSArray *placeholderArray = @[@"请输入姓名",@"请输入身份证号",@"选择性别",@"请输入",@"请输入",@"请输入",@"请输入请医地址",@"请输入医生专业",@"请输入医生职位",@"请输入请医目的",@"是否需要VIP",@"请输入备注"];
    const int count = (int)labelArray.count;
    //1.scrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = IWColor(226, 226,226);
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(0, 1.1 * self.view.frame.size.height);
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    //2.labels
    for (int i = 0 ; i < count; i++) {
        UILabel *label = [[UILabel alloc] init];
        
        label.text = [labelArray objectAtIndex:i];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor blackColor];
        label.backgroundColor = [UIColor clearColor];
        
        [self.scrollView addSubview:label];
        [self.labels addObject:label];
        
        UITextField *textfield = [[UITextField alloc] init];
        textfield.placeholder = [placeholderArray objectAtIndex:i];
        textfield.borderStyle = UITextBorderStyleNone;
        textfield.tag = i;
        textfield.font = [UIFont systemFontOfSize:14];
        textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        textfield.textAlignment = NSTextAlignmentRight;
        textfield.textColor = [UIColor blackColor];
        textfield.delegate = self;
        [textfield setValue:[UIFont systemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
        [self.scrollView addSubview:textfield];
        [self.textFields addObject:textfield];
        
        [self.lines addObject:[self addLine]];
        
        UIButton *commitBtn = [[UIButton alloc] init];;
        [commitBtn setTitle:@"提交" forState:UIControlStateNormal];
        commitBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        commitBtn.titleLabel.backgroundColor = [UIColor clearColor];
        [commitBtn addTarget:self action:@selector(commitBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        self.commitBtn = commitBtn;
        [self.scrollView addSubview:commitBtn];
    }
}
- (void)commitBtnClicked
{
    
}
- (UIView *)addLine
{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.scrollView addSubview:line];
    return line;
}
- (void)layoutCustomViews
{
    self.scrollView.frame = (CGRect){CGPointZero,self.view.bounds.size};
    CGFloat padding = 10;
    CGFloat labelX = padding;
    CGFloat labelY = 0;
    CGFloat labelW = 120;
    CGFloat labelH = 40;
    
    CGFloat lineX = padding;
    CGFloat lineY = 0;
    CGFloat lineW = SCREENWIDTH - 2 * padding;
    CGFloat lineH = 1;
    
    CGFloat textfX = 0;
    CGFloat textfY = 0;
    CGFloat textfW = 0;
    CGFloat textfH = 30;
    
    for (int i = 0 ; i < self.lines.count; i++ ) {
        UILabel *label = [self.labels objectAtIndex:i];
        labelY = 10 + i * (labelH + padding)+ 1;
        label.frame = CGRectMake(labelX, labelY, labelW, labelH);
        
        UIView *line = [self.lines objectAtIndex:i];
        lineY = CGRectGetMaxY(label.frame) + padding/2;
        line.frame = CGRectMake(lineX, lineY, lineW, lineH);
        
        UITextField *textfield = [self.textFields objectAtIndex:i];
        textfX = CGRectGetMaxX(label.frame);
        textfY = labelY + 7;
        textfW = SCREENWIDTH - textfX - padding;
        textfield.frame = CGRectMake(textfX, textfY, textfW, textfH);
        
    }
    
    UIView *lastline = [self.lines lastObject];
    [self.commitBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.commitBtn.frame = CGRectMake(padding, CGRectGetMaxY(lastline.frame) + padding/2, SCREENWIDTH - 2 * padding, 35);
}


@end
