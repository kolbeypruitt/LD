//
//  HotDepmentView.m
//  邻医家
//
//  Created by Daniel on 15/6/23.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Common.h"
#import "LDNotification.h"
#import "UIImage+MJ.h"
#import "Department.h"
#import "HotDepmentView.h"
@interface HotDepmentView ()
@property (nonatomic,strong) NSArray *departments;
@property (nonatomic,strong) NSMutableArray *departmentBtns;
@end
@implementation HotDepmentView
- (NSArray *)departments
{
    if (_departments == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"hotdepartment" ofType:@"plist"];
        _departments = [NSMutableArray arrayWithContentsOfFile:path];
    }
    return _departments;
}
- (NSMutableArray *)departmentBtns
{
    if (_departmentBtns == nil) {
        _departmentBtns = [NSMutableArray array];
    }
    return _departmentBtns;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        [self addDepartments];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.userInteractionEnabled = YES;
        [self addDepartments];
    }
    return self;
}
- (void)addDepartments
{
    for (int i = 0 ; i < self.departments.count; i++) {
        NSDictionary *dict = self.departments[i];
        UIButton *button = [self setupButtonWithTitle:dict[@"depName"]];
        button.tag = i;
        [button addTarget:self action:@selector(clickedBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.departmentBtns addObject:button];
    }
}
- (UIButton *)setupButtonWithTitle:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage resizedImageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.titleLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:button];
    return button;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    const int columns = 3;
    const int padding = 10;
    CGFloat buttonW = (SCREENWIDTH - 4 * padding)/columns;
    CGFloat buttonH = 30;
    for ( int i = 0 ; i < self.departmentBtns.count; i++) {
        int currentColumn = i % columns;
        int currentRow = i / columns;
        CGFloat buttonX = currentColumn * (padding + buttonW) + padding;
        CGFloat buttonY = currentRow *(padding + buttonH) + padding;
        UIButton *button = [self.departmentBtns objectAtIndex:i];
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
}
- (void)clickedBtn:(UIButton *)button
{
    NSDictionary *dict = [self.departments objectAtIndex:button.tag];
    NSDictionary *usrInfo = @{@"department" : dict[@"department"]};
    [DefaultCenter postNotificationName:DEPARTMENTCHOOSEDNOTIFICATION object:self userInfo:usrInfo];
}
@end
