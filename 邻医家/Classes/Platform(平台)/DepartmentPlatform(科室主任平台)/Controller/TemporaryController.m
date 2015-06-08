//
//  TemporaryController.m
//  邻医家
//
//  Created by Daniel on 15/6/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "TemporaryController.h"
#import "Common.h"
#import "UIBarButtonItem+ENTER.h"
#import "HospitalEnterTextField.h"

@interface TemporaryController () <UITextFieldDelegate>
@property (nonatomic,strong) NSMutableArray *labels;
@property (nonatomic,strong) NSMutableArray *textfields;
@property (nonatomic,strong) NSMutableArray *lines;
@end

@implementation TemporaryController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (NSMutableArray *)lines
{
    if (_lines == nil) {
        _lines = [NSMutableArray array];
    }
    return _lines;
}
- (NSMutableArray *)labels
{
    if (_labels == nil) {
        _labels = [NSMutableArray array];
    }
    return _labels;
}
- (NSMutableArray *)textfields
{
    if (_textfields == nil) {
        _textfields = [NSMutableArray array];
    }
    return _textfields;
}

- (void)setup
{
    self.title = @"临时转诊";
    self.view.backgroundColor = IWColor(226, 226, 226);
    [self addCustomViews];
    [self layoutCustomViews];
    [self setNav];
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
    NSArray *labelArray = @[@"选择科室",@"临时坐诊时间",@"临时坐诊地址",@"详细地址",@"医院名称",@"拟邀医生职位",@"是否住院"];
    NSArray *placeholderArray = @[@"请点击选择",@"请点击选择",@"请点击选择",@"请输入详细地址",@"请输入医院名称",@"请点击选择",@"请点击选择"];
    const int count = (int)labelArray.count;
    for (int i = 0 ; i < count; i++) {
        UILabel *label = [[UILabel alloc] init];
        
        label.text = [labelArray objectAtIndex:i];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor blackColor];
        label.backgroundColor = [UIColor clearColor];
        
        [self.view addSubview:label];
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
        [self.view addSubview:textfield];
        [self.textfields addObject:textfield];
        
        [self.lines addObject:[self addLine]];
    }
}
- (void)layoutCustomViews
{
    CGFloat padding = 10;
    CGFloat labelX = padding;
    CGFloat labelY = 0;
    CGFloat labelW = 90;
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
        labelY = 84 + i * (labelH + padding)+ 1;
        label.frame = CGRectMake(labelX, labelY, labelW, labelH);
        
        UIView *line = [self.lines objectAtIndex:i];
        lineY = CGRectGetMaxY(label.frame) + padding/2;
        line.frame = CGRectMake(lineX, lineY, lineW, lineH);
        
        HospitalEnterTextField *textfield = [self.textfields objectAtIndex:i];
        textfX = CGRectGetMaxX(label.frame);
        textfY = labelY + 7;
        textfW = SCREENWIDTH - textfX - padding;
        textfield.frame = CGRectMake(textfX, textfY, textfW, textfH);
        
    }
}
- (UIView *)addLine
{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:line];
    return line;
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
