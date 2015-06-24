//
//  CaseDetailController.m
//  邻医家
//
//  Created by Daniel on 15/6/24.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Common.h"
#import "CaseDetailParam.h"
#import "CaseDetailResult.h"
#import "CaseDetailTool.h"
#import "Case.h"
#import "CaseDetailController.h"
#import "CaseDetail.h"
#import "CaseDetailView.h"
@interface CaseDetailController ()
@property (nonatomic,weak) CaseDetailView *caseView;
@property (nonatomic,strong) CaseDetail *Cs;
@end

@implementation CaseDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)setNorcase:(Case *)norcase
{
    _norcase = norcase;
    CaseDetailParam *param = [CaseDetailParam paramWithId:norcase.id];
    [CaseDetailTool caseDetailWithParam:param success:^(CaseDetailResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            self.Cs = result.Case;
        }
    } failure:^(NSError *error) {
        
    }];
}
- (void)setCs:(CaseDetail *)Cs
{
    _Cs = Cs;
    [self addCustomView];
    self.caseView.caseDetail = Cs;
}
- (void)addCustomView
{
    CaseDetailView *caseView = [[CaseDetailView alloc] init];
    caseView.frame = (CGRect){{0,64},{SCREENWIDTH,SCREENHEIGHT - 64}};
    [self.view addSubview:caseView];
    self.caseView = caseView;
}
@end
