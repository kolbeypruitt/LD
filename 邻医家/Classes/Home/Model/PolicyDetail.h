//
//  PolicyDetail.h
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PolicyDetail : NSObject
@property (nonatomic,copy) NSString *detail;
@property (nonatomic,assign) int id;
@property (nonatomic,copy) NSString *name;
@end
//policy =     {
//    detail = "\U677e\U7ed1\U6ce8\U518c\U7ba1\U7406:\U533b\U5e08\U591a\U70b9\U6267\U4e1a\U5b9e\U884c\U6ce8\U518c\U7ba1\U7406,\U76f8\U5e94\U7b80\U5316\U6ce8\U518c\U7a0b\U5e8f,\U540c\U65f6\U63a2\U7d22\U5b9e\U884c\U5907\U6848\U7ba1\U7406\U7684\U53ef\U884c\U6027,\U6761\U4ef6\U6210\U719f\U7684\U5730\U65b9\U53ef\U4ee5\U63a2\U7d22\U5b9e\U884c\U533a\U57df\U6ce8\U518c";
//    id = 1;
//    name = "\U591a\U70b9\U6267\U4e1a\U653f\U7b56\U76f8\U5173\U4ecb\U7ecd\U4e00";
//};