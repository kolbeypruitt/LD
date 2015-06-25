//
//  MultijobDetailController.m
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Policy.h"
#import "PolicyDetail.h"
#import "MultijobDetailController.h"
#import "Common.h"
#import "CaseDetailParam.h"
#import "PolicyDetailTool.h"
#import "PolicyDetailResult.h"
#import "MultiJobDetailView.h"
@interface MultijobDetailController ()
@property (nonatomic,strong) PolicyDetail *policyDetail;
@property (nonatomic,weak) MultiJobDetailView *detailView;
@end

@implementation MultijobDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self addCustomView];
    [self loadData];
}
- (void)setup
{
    self.navigationItem.rightBarButtonItem =  nil;
    self.navigationItem.title = @"多点执业政策";
    self.view.backgroundColor = IWColor(226, 226, 226);
}
- (void)addCustomView
{
    MultiJobDetailView *detailView = [[MultiJobDetailView alloc] init];
    detailView.frame = CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT - 64);
    [self.view addSubview:detailView];
    self.detailView = detailView;
}
- (void)loadData
{
    CaseDetailParam *param = [CaseDetailParam paramWithId:self.policy.id];
    [PolicyDetailTool policyDetailWithParam:param success:^(PolicyDetailResult *result) {
        self.policyDetail = result.policy;
    } failure:^(NSError *error) {
        
    }];
  
}
- (void)setPolicyDetail:(PolicyDetail *)policyDetail
{
    _policyDetail = policyDetail;
    self.detailView.policyDetail = policyDetail;
}
@end
