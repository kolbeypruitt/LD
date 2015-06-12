//
//  MessageTypeController.m
//  邻医家
//
//  Created by Daniel on 15/6/5.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "MessageTypeController.h"
#import "LDMessageButton.h"
#import "PostCaseViewController.h"
#import "PostHospitalController.h"
#import "PostLectureController.h"
#import "PostExpertViewController.h"
#import "Common.h"
#import "IWCommon.h"
#import "UIImage+MJ.h"
@interface MessageTypeController ()
@property (nonatomic,strong) NSMutableArray *btns;
@property (nonatomic,strong) NSMutableArray *underlines;
@end

@implementation MessageTypeController
- (NSMutableArray *)btns
{
    if (_btns == nil) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}
- (NSMutableArray *)underlines
{
    if (_underlines == nil) {
        _underlines = [NSMutableArray array];
    }
    return _underlines;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.view.backgroundColor = IWColor(226, 226, 226);
    self.title = @"选择发布类型";
    [self addCustomViews];
    [self layoutCustomViews];
}
- (void)addCustomViews
{
    const int count = 4;
    NSArray *titleArray = @[@"发布医院简介",@"发布病例",@"发布专家坐诊时间表",@"发布讲座等信息"];
    for (int i = 0; i<count; i++) {
        LDMessageButton *button = [self createBtnWithTitle:[titleArray objectAtIndex:i]];
        button.tag = i;
        [self.btns addObject:button];
        
        UIView *line = [self createLine];
        [self.underlines addObject:line];
    }
}
- (void)layoutCustomViews
{
    int padding = 10;
    CGFloat btnX = 10;
    CGFloat btnY = 0;
    CGFloat btnW = 200;
    CGFloat btnH = 40;
    
    CGFloat lineX = 10;
    CGFloat lineY = 0;
    CGFloat lineW = SCREENWIDTH - 2 * lineX;
    CGFloat lineH = 1;
    for (int i = 0 ; i < self.btns.count; i++) {
        //设置按钮的frame
        LDMessageButton *button = [self.btns objectAtIndex:i];
        btnY = 84 + i * (btnH + padding + lineH);
        button.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        // 设置分割线的frame
        UIView *line = [self.underlines objectAtIndex:i];
        lineY = CGRectGetMaxY(button.frame);
        line.frame = CGRectMake(lineX, lineY, lineW, lineH);
    }
}
- (UIView *)createLine
{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:line];
    return line;
}
- (LDMessageButton *)createBtnWithTitle:(NSString *)title
{
    LDMessageButton *btn = [[LDMessageButton alloc] init];
    [btn setImage:[UIImage imageWithName:@"light_blue_point"] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    return btn;
}
- (void)buttonClicked:(LDMessageButton *)button
{
    switch (button.tag) {
        case 0:
        {
            PostHospitalController *hos = [[PostHospitalController alloc] init];
            [self.navigationController pushViewController:hos animated:YES];
            break;
        }
        case 1:
        {
            PostCaseViewController *cas = [[PostCaseViewController alloc] init];
            [self.navigationController pushViewController:cas animated:YES];
            break;
        }
        case 2:
        {
            PostExpertViewController *expert = [[PostExpertViewController alloc] init];
            [self.navigationController pushViewController:expert animated:YES];
            break;
        }
        case 3:
        {
            PostLectureController *lec = [[PostLectureController alloc] init];
            [self.navigationController pushViewController:lec animated:YES];
            break;
        }
        default:
            break;
    }
}
@end
