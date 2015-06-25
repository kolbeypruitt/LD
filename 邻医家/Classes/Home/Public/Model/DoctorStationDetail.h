//
//  DoctorStationDetail.h
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DoctorStationDetail : NSObject
@property (nonatomic,copy) NSString *department;
@property (nonatomic,copy) NSString *hospital;
@property (nonatomic,copy) NSString *introduction;
@property (nonatomic,copy) NSString *name;
@end
//postdoctorStation =     {
//    department = "\U547c\U5438\U5185\U79d1";
//    hospital = "\U4e0a\U6d77\U4ea4\U901a\U5927\U5b66\U533b\U5b66\U9662\U9644\U5c5e\U65b0\U534e\U533b\U9662";
//    introduction = "\U672c\U7ad9\U70b9\U3002\U3002\Uff0c";
//    name = "xx\U535a\U58eb\U540e\U7ad9\U70b9";
//}