//
//  HomeGroup.h
//  邻医家
//
//  Created by Daniel on 15/5/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
typedef enum {
    DoctorDataType,
    HospitalDataType,
    DiseaseDataType,
} CellDataType;
#import <Foundation/Foundation.h>

@interface HomeGroup : NSObject
@property (nonatomic,copy) NSString *header;
@property (nonatomic,copy) NSString *footer;
@property (nonatomic,strong) NSArray *datas;
@property (nonatomic,assign) CellDataType type;
+ (HomeGroup *)group;
+ (HomeGroup *)groupWithHeader:(NSString *)header footer:(NSString *)footer datas:(NSArray *)datas dataType:(CellDataType)type;
@end
