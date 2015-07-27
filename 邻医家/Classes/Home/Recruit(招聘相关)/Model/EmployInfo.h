//
//  EmployInfo.h
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmployInfo : NSObject
@property (nonatomic,copy) NSString *city;
@property (nonatomic,assign) int id;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *startdate;
@property (nonatomic,assign) int succeed;
@end
//{
//    employInfos =     (
//                       {
//                           id = 2;
//                           name = "\U534e\U5c71\U533b\U9662\U62db\U8058\U76ae\U80a4\U79d1\U4e3b\U4efb\U533b\U5e08";
//                           startdate = "2015-05-04 ";
//                           techtitle = 1;
//                       },
//                       {
//                           id = 1;
//                           name = "\U534e\U5c71\U533b\U9662\U62db\U8058\U5916\U79d1\U533b\U5e08";
//                           startdate = "2015-04-01 ";
//                           techtitle = "\U2022\t\U804c\U79f0\U8981\U6c42\Uff1a \U9ad8\U7ea71";
//                       }
//                       );
//    status = S;
//}