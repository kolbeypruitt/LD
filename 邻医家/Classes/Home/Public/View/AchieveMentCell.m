//
//  AchieveMentCell.m
//  邻医家
//
//  Created by Daniel on 15/6/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "AchieveMentCell.h"

@implementation AchieveMentCell
+ (instancetype)cellWithTabelView:(UITableView *)tableView
{
    static NSString *ID = @"achievement";
    AchieveMentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"AchieveMentCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

@end
