//
//  LDMessageController.h
//  邻医家
//
//  Created by Daniel on 15/7/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDMessageController : UITableViewController
@property (nonatomic,strong) NSArray *messages;
@property (nonatomic,copy) NSString *clientToChat;
@property (nonatomic,assign) BOOL singleLine;
@end
