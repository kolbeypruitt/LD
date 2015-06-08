//
//  FreeForwardController.m
//  邻医家
//
//  Created by Daniel on 15/6/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "FreeForwardController.h"
#import "UIBarButtonItem+ENTER.h"
#import "IWCommon.h"
#import "Common.h"
#import "LDTextView.h"
#import "HospitalEnterTextField.h"
@interface FreeForwardController () <UITextFieldDelegate,UIScrollViewDelegate,UITextViewDelegate>
@property (nonatomic,strong) NSMutableArray *labels;
@property (nonatomic,strong) NSMutableArray *textFields;
@property (nonatomic,strong) NSMutableArray *lines;
@property (nonatomic,weak) UIScrollView *scrollView;
@property (nonatomic,weak) LDTextView *detailView;
@end

@implementation FreeForwardController
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
    self.title = @"自由转诊";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNav];
    [self addCustomViews];
    [self layoutCustomViews];
}
- (void)setNav
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(post) title:@"发布"];
}
- (void)post
{
    
}
- (void)addCustomViews
{
    NSArray *labelArray = @[@"选择科室",@"病人姓名",@"身份证号",@"最后一次就医医院",@"最后一次医院诊断",@"拟转诊就医地址",@"详细地址",@"接诊医师专业",@"接诊医师职务",@"是否住院",@"转诊目的",@"是否需要VIP",@"是否需要抢救"];
    NSArray *placeholderArray = @[@"请点击选择",@"请输入真实姓名",@"请输入身份证号",@"请输入医院名称",@"请输入诊断详情",@"请点击选择",@"请输入详细地址",@"请点击选择",@"请点击选择",@"请点击选择",@"请点击选择",@"请点击选择",@"请点击选择"];
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
        
        HospitalEnterTextField *textfield = [[HospitalEnterTextField alloc] init];
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
    }
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
        
        HospitalEnterTextField *textfield = [self.textFields objectAtIndex:i];
        textfX = CGRectGetMaxX(label.frame);
        textfY = labelY + 7;
        textfW = SCREENWIDTH - textfX - padding;
        textfield.frame = CGRectMake(textfX, textfY, textfW, textfH);
        
    }
}



@end
