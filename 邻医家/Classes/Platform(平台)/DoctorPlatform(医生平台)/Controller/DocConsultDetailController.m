//
//  DocConsultDetailController.m
//  邻医家
//
//  Created by Daniel on 15/6/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "DocConsultDetailTool.h"
#import "DocConsultDetailParam.h"
#import "DocConsultDetailController.h"
#import "ConsultMessage.h"

@interface DocConsultDetailController ()

@end

@implementation DocConsultDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    DocConsultDetailParam *param = [DocConsultDetailParam paramWithId:self.message.id];
    [DocConsultDetailTool getDocConsultDetailWithParam:param success:^(id result) {
        
    } failure:^(NSError *error) {
        
    }];
}

@end
