//
//  StationListResult.h
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StationListResult : NSObject
@property (nonatomic,strong) NSArray *postdoctorStations;
@property (nonatomic,copy) NSString *status;
@end
//postdoctorStations =     (
//                          {
//                              id = 1;
//                              name = "xx\U535a\U58eb\U540e\U7ad9\U70b9";
//                          },
//                          {
//                              id = 2;
//                              name = "xxx\U7ad9\U70b9";
//                          }
//                          );
//status = S;