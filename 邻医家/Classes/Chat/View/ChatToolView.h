//
//  ChatToolView.h
//  邻医家
//
//  Created by SXQ on 15/7/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatToolView : UIView
@property (weak, nonatomic) IBOutlet UIButton *voiceBtn;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *faceBtn;
@property (weak, nonatomic) IBOutlet UITextField *inputView;
+ (instancetype)chatToolView;
@end
