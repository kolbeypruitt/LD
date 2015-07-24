//
//  UserTool.m
//  邻医家
//
//  Created by Daniel on 15/7/20.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDBaseParam.h"
#import "UserTool.h"
#import "Common.h"
#import "MJExtension.h"
#import "LDHttpTool.h"
#import "UserResult.h"
@implementation UserTool
+ (void)userWithParam:(LDBaseParam *)param success:(void (^)(UserResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:USEINFOURL params:param.keyValues success:^(id json) {
        if (success) {
            UserResult *result = [UserResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
//医院管理者
//{
//    account =     {
//        address = " \U4e0a\U6d77\U5e02\U6768\U6d66\U533a\U63a7\U6c5f\U8def1665\U53f7";
//        contact = "021-25078975";
//        founddate = "1958-05-06";
//        introduction = "\U6765\U54af\U54c4\U54c4";
//        level = "\U516c\U7acb\U4e09\U7532";
//        name = "\U4e0a\U6d77\U4ea4\U901a\U5927\U5b66\U533b\U5b66\U9662\U9644\U5c5e\U65b0\U534e\U533b\U9662";
//        realname = "\U5f90\U536b\U56fd";
//        telnum = 18811111111;
//        website = "\U660e\U654f\U9b54\U653b";
//    };
//    status = S;
//}
//医生
//{
//    account =     {
//        age = 45;
//        department = "\U795e\U7ecf\U5916\U79d1";
//        gender = "\U7537";
//        hospital = "\U4e0a\U6d77\U4ea4\U901a\U5927\U5b66\U533b\U5b66\U9662\U9644\U5c5e\U65b0\U534e\U533b\U9662";
//        idcardNo = 111;
//        introduction = "\U90d1\U5b66\U80dc\U526f\U4e3b\U4efb\U533b\U5e08\U65e9\U5e74\U7559\U5b66\U7f8e\U56fd\U54c8\U4f5b\U5927\U5b66\U9644\U5c5e\U9ebb\U7701\U603b\U533b\U9662\Uff0c\U901a\U8fc7\U6d77\U5916\U4eba\U624d\U5f15\U8fdb\U6765\U5230\U4e0a\U6d77\U4ea4\U901a\U5927\U5b66\U9644\U5c5e\U65b0\U534e\U533b\U9662\U795e\U7ecf\U5916\U79d1\U5de5\U4f5c\Uff0c\U7531\U4e8e\U5728\U795e\U7ecf\U5916\U79d1\U5fae\U521b\U624b\U672f\U65b9\U9762\U7684\U6280\U672f\U521b\U65b0\Uff0c\U56db\U6b21\U8363\U83b7\U7701\U90e8\U7ea7\U79d1\U6280\U8fdb\U6b65\U5956\U3002\U5e76\U88ab\U6388\U4e88\U4e0a\U6d77\U5e02\U6d66\U6c5f\U4eba\U624d\U3001\U4e0a\U6d77\U4ea4\U901a\U5927\U5b66\U201c\U65b0\U767e\U4eba\U8ba1\U5212\U201d\U3001\U533b\U5b66\U9662\U201c\U751f\U547d\U4e4b\U5149\U9752\U5e74\U5341\U6770\U201d\U3001\U65b0\U534e\U533b\U9662\U201c\U6770\U51fa\U9752\U5e74\U201d\U7b49\U8363\U8a89\U79f0\U53f7\U3002 \U6bcf\U5e74\U5b8c\U6210\U8fd1400\U53f0\U624b\U672f\Uff0c\U5177\U6709\U4e30\U5bcc\U7684\U624b\U672f\U7ecf\U9a8c\U3002\U7b2c\U4e09\U65b9\U60a3\U8005\U6ee1\U610f\U5ea6\U8c03\U67e5\Uff1a\U7597\U6548100%\U6ee1\U610f\U3001\U6001\U5ea6100%\U6ee1\U610f\U3002";
//        location = "\U95f8\U5317\U533a";
//        name = "\U90d1\U5b66\U80dc";
//        telnum = 18811111112;
//    };
//    status = S;
//}
//医友
//Printing description of json:
//{
//    account =     {
//        age = 56;
//        gender = "\U7537";
//        idcardNo = 1;
//        illness = 1;
//        location = "\U5f20\U5bb6\U53e3";
//        name = "\U674e\U5927\U58ee";
//        telnum = 18811111113;
//    };
//    status = S;
//}
//科室主任
//Printing description of json:
//{
//    account =     {
//        department = "\U5916\U79d1";
//        hospital = "\U4e0a\U6d77\U4ea4\U901a\U5927\U5b66\U533b\U5b66\U9662\U9644\U5c5e\U65b0\U534e\U533b\U9662";
//        introduction = 1;
//        mailbox = 1;
//        name = "\U6731\U8fdb";
//        phone = 1;
//        telnum = 18811111114;
//    };
//    status = S;
//}
//普通用户
//{
//    account =     {
//        telnum = 18811111115;
//    };
//    status = S;
//}