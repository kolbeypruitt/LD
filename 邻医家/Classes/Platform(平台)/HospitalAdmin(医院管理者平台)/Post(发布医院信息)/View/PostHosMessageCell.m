//
//  PostHosMessageCell.m
//  邻医家
//
//  Created by SXQ on 15/7/27.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "PostHosMessageCell.h"
@interface PostHosMessageCell ()

@end
@implementation PostHosMessageCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"hosmessagecell";
    PostHosMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"PostHosMessageCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

@end
