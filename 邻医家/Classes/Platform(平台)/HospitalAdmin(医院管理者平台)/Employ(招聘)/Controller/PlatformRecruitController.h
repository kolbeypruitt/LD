//
//  PlatformRecruitController.h
//  邻医家
//
//  Created by Daniel on 15/6/1.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlatformRecruitController : UIViewController
- (void)appendRecruit;
@property (nonatomic,strong) NSArray *fulltimeDatas;
@property (nonatomic,strong) NSArray *parttimeDatas;
@property (nonatomic,strong) NSArray *practiceDatas;
@property (nonatomic,strong) NSArray *studyDatas;
@property (nonatomic,strong) NSArray *doctorDatas;
- (void)setup;
@end
