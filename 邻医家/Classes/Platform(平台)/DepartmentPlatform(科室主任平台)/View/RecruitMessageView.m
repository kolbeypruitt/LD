//
//  RecruitMessageView.m
//  邻医家
//
//  Created by Daniel on 15/6/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#define TITLECOUTN 11
#import "RecruitMessage.h"
#import "RecruitMessageView.h"
#import "RecruitMessageCell.h"

@interface RecruitMessageView()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *messages;
@end
@implementation RecruitMessageView
- (NSMutableArray *)messages
{
    if (_messages == nil) {
        _messages = [NSMutableArray array];
        NSArray *titleArray = @[@"标题",@"职位性质",@"科室",@"岗位",@"地点",@"人数",@"学历",@"外语",@"年龄",@"专业",@"招聘条件"];
        NSArray *detailArray = @[@"安家费50万起",@"全职",@"内科－呼吸内科",@"普通外科学科带头人",@"上海",@"3",@"硕士",@"英语6级",@"28-40",@"普通外学科",@"1.。。。。。，2.。。。。3.。。。。。"];
        for (int i = 0 ; i < TITLECOUTN; i++) {
            RecruitMessage *message = [RecruitMessage messageWithTitle:[titleArray objectAtIndex:i]
                                                         detailMessage:[detailArray objectAtIndex:i]];
            [_messages addObject:message];
        }
    }
    return _messages;
}
- (void)setMessage:(ConsultDetailMessage *)message
{
    _message = message;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UITableView *tableView = [[UITableView alloc] init];
        [self addSubview:tableView];
        tableView.dataSource = self;
        self.tableView = tableView;
        
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.tableView.frame = self.bounds;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messages.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecruitMessageCell *cell = [RecruitMessageCell cellWithTableView:tableView];
    cell.message = self.messages[indexPath.row];
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self tableView:tableView didDeselectRowAtIndexPath:indexPath];
}

@end
