//
//  CaseDetail.h
//  邻医家
//
//  Created by Daniel on 15/6/24.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CaseDetail : NSObject
@property (nonatomic,copy) NSString *gender;
@property (nonatomic,copy) NSString *age;
@property (nonatomic,copy) NSString *chiefComplaint;
@property (nonatomic,copy) NSString *illNow;
@property (nonatomic,copy) NSString *illBefore;
@property (nonatomic,copy) NSString *bodyCheck;
@property (nonatomic,copy) NSString *supportCheck;
@property (nonatomic,copy) NSString *diagnose;
@property (nonatomic,copy) NSString *treatmentProcess;
@end
