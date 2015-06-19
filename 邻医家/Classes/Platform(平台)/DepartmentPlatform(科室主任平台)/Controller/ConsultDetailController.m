//
//  ConsultDetailController.m
//  邻医家
//
//  Created by Daniel on 15/6/19.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "UIBarButtonItem+ENTER.h"
#import "ConsultDetailController.h"
#import "ConsultMessage.h"
#import "ConsultDetailTool.h"
#import "ConsultDetailParam.h"
#import "ConsutlDetailResult.h"
#import "MJExtension.h"
#import "SurgeryModel.h"
#import "Common.h"
#import "StubbornModel.h"
#import "TemporaryModel.h"
#import "ForwardModel.h"
#import "SurgeryView.h"
#import "StubbornView.h"
#import "ForwardView.h"
#import "TemporaryView.h"
@interface ConsultDetailController ()
@property (nonatomic,strong) SurgeryModel *surgeryModel;
@property (nonatomic,strong) StubbornModel *stubbornModel;
@property (nonatomic,strong) TemporaryModel *temModel;
@property (nonatomic,strong) ForwardModel *forModel;
@property (nonatomic,strong) ConsutlDetailResult *result;

@property (nonatomic,weak) SurgeryView *surView;
@property (nonatomic,weak) StubbornView *stubbView;
@property (nonatomic,weak) TemporaryView *tempView;
@property (nonatomic,weak) ForwardView *forView;
@end

@implementation ConsultDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self addCustomViews];
    [self loadData];
}
- (void)setup
{
    self.navigationItem.title = @"招聘详情";
    self.view.backgroundColor = IWColor(226, 226, 226);
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:nil title:@"撤销"];
}
- (void)addCustomViews
{
    SurgeryView *surView = [[SurgeryView alloc] initWithFrame:self.view.bounds];
    surView.hidden = YES;
    self.surView = surView;
    [self.view addSubview:surView];
    
    StubbornView *stubbView = [[StubbornView alloc] initWithFrame:self.view.bounds];
    stubbView.hidden = YES;
    self.stubbView = stubbView;
    [self.view addSubview:stubbView];
    
    TemporaryView *temView = [[TemporaryView alloc] initWithFrame:self.view.bounds];
    temView.hidden = YES;
    self.tempView = temView;
    [self.view addSubview:temView];
    
    ForwardView *forView = [[ForwardView alloc] initWithFrame:self.view.bounds];
    forView.hidden = YES;
    self.forView = forView;
    [self.view addSubview:forView];
}
- (void)loadData
{
    ConsultDetailParam *param = [ConsultDetailParam paramWithId:self.message.id];
    [ConsultDetailTool consultDetailWithParam:param success:^(ConsutlDetailResult *result) {
        self.result = result;
    } failure:^(NSError *error) {
        
    }];
}
- (void)setResult:(ConsutlDetailResult *)result
{
    _result = result;
    if (result.type == 1)
    {//开刀
        self.surgeryModel = (SurgeryModel *)result;
        self.surView.model = self.surgeryModel;
        self.surView.hidden = NO;
    }else if(result.type == 2)
    {//疑难杂症
        self.stubbornModel = (StubbornModel *)result;
        self.stubbView.hidden = NO;
        self.stubbView.model = self.stubbornModel;
    }else if(result.type == 3)
    {//临时会诊
        self.temModel = (TemporaryModel *)result;
        self.tempView.hidden = NO;
        self.tempView.model = self.temModel;
    }else if(result.type == 4)
    {//转诊
        self.forModel = (ForwardModel *)result;
        self.forView.hidden = NO;
        self.forView.model = self.forModel;
    }
}

@end
