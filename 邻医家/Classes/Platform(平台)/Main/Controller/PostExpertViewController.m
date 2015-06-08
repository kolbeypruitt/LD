//
//  PostExpertViewController.m
//  邻医家
//
//  Created by Daniel on 15/6/5.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "PostExpertViewController.h"
#import "Common.h"
#import "UIBarButtonItem+ENTER.h"
@interface PostExpertViewController ()
@property (nonatomic,strong) NSMutableArray *labels;
@property (nonatomic,strong) NSMutableArray *underlines;
@property (nonatomic,strong) NSMutableArray *textFields;
@end

@implementation PostExpertViewController
- (NSMutableArray *)labels
{
    if (_labels == nil) {
        _labels = [NSMutableArray array];
    }
    return _labels;
}
- (NSMutableArray *)underlines
{
    if (_underlines == nil) {
        _underlines = [NSMutableArray array];
    }
    return _underlines;
}
- (NSMutableArray *)textFields
{
    if (_textFields == nil) {
        _textFields = [NSMutableArray array];
    }
    return _textFields;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"发布专家讲座时间表";
    [self addCustomViews];
    [self layoutCustomViews];
    [self setNav];
}
- (void)setNav
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(submit) title:@"提交"];
}
- (void)submit
{
    NSLog(@"You are amazing!!!");
}
- (void)addCustomViews
{
    const int count = 4;
    NSArray *titleArray = @[@"专家姓名",@"坐诊时间",@"选择科室",@"临床职称"];
    NSArray *placeholderArray = @[@"请输入专家姓名",@"如:(2015/06/06 08:30-10:30",@"请点击选择",@"请点击选择"];
    for (int i = 0 ; i < count; i++) {
        UILabel *label = [self labelWithTitle:[titleArray objectAtIndex:i]];
        [self.labels addObject:label];
        
        UITextField *textfield = [self addTextFieldWithPlaceholder:[placeholderArray objectAtIndex:i]];
        [self.textFields addObject:textfield];
        
        UIView *line = [self addLine];
        [self.underlines addObject:line];
    }
}
- (void)layoutCustomViews
{
    const int padding = 10;
    CGFloat labelX = 10;
    CGFloat labelY = 0;
    CGFloat labelW = 60;
    CGFloat labelH = 40;
    
    CGFloat textX = 0;
    CGFloat textY = 0;
    CGFloat textW = SCREENWIDTH - textX - 8;
    CGFloat textH = 30;
    
    CGFloat lineX = 10;
    CGFloat lineY = 0;
    CGFloat lineW = SCREENWIDTH - 2 * lineX;
    CGFloat lineH = 1;
    
    for (int i = 0; i < self.labels.count; i++) {
        UILabel *label = [self.labels objectAtIndex:i];
        labelY = 84 + i * (labelH + padding);
        label.frame = CGRectMake(labelX, labelY, labelW, labelH);
        
        UITextField *textfield = [self.textFields objectAtIndex:i];
        textX = CGRectGetMaxX(label.frame) + padding;
        textY = labelY + 6;
        textfield.frame = CGRectMake(textX, textY, textW, textH);
        
        UIView *line = [self.underlines objectAtIndex:i];
        lineY = CGRectGetMaxY(textfield.frame) + padding;
        line.frame = CGRectMake(lineX, lineY, lineW, lineH);
    }
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (UILabel *)labelWithTitle:(NSString *)title
{
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.textColor = [UIColor blackColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:label];
    return label;
}
- (UITextField *)addTextFieldWithPlaceholder:(NSString *)placeholder
{
    UITextField *textfield = [[UITextField alloc] init];
    textfield.borderStyle = UITextBorderStyleNone;
    textfield.placeholder = placeholder;
    [textfield setValue:[UIFont systemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:textfield];
    return textfield;
}
- (UIView *)addLine
{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:line];
    return line;
}
@end



























