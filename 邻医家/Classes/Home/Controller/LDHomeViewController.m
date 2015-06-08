//
//  LDHomeViewController.m
//  邻医家
//
//  Created by Daniel on 15/5/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "PublicHomeController.h"
#import "LDHomeHeadView.h"
#import "LDHomeViewController.h"
#import "RecommendDocController.h"
#import "RecommendHosController.h"
#import "CommonCaseController.h"
#import "MultiJobController.h"
#import "PostDoctorController.h"
#import "RecruitMessageController.h"
@interface LDHomeViewController () <LDHomeHeaderViewDelegate>

@property (nonatomic,weak) LDHomeHeadView *myHeaderView;
@end
@implementation LDHomeViewController
- (instancetype)init
{
    if (self = [super init]) {
        RecommendDocController *doc = [[RecommendDocController alloc] init];
        RecommendHosController *hos = [[RecommendHosController alloc] init];
        CommonCaseController *ca = [[CommonCaseController alloc] init];
        self = [self initWithControllers:doc,hos,ca, nil];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self setSegmentApperance];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.customHeaderView.frame = CGRectMake(0, 64, self.view.frame.size.width,200);
}
- (void)setSegmentApperance
{
    UISegmentedControl *segmentControl = [UISegmentedControl appearance];
    [segmentControl setTintColor:[UIColor blackColor]];
}
- (UIView<ARSegmentPageControllerHeaderProtocol> *)customHeaderView
{
    LDHomeHeadView *myHeaderView = [[LDHomeHeadView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 210)];
    myHeaderView.delegate = self;
    self.myHeaderView = myHeaderView;
    return myHeaderView;
}
- (void)headerView:(LDHomeHeadView *)headerView didClickedBtn:(UIButton *)button
{
    switch (button.tag) {
        case 3:
//            [self changeController:[MultiJobController class]];
            [self changeController:[PublicHomeController class]];
            break;
        case 4:
            [self changeController:[PostDoctorController class]];
            break;
        case 5:
            [self changeController:[RecruitMessageController class]];
            break;
        default:
            break;
    }
}
- (void)changeController:(Class)destClass
{
    UIViewController *controller = [[destClass alloc] init];
    [self.navigationController pushViewController:controller animated:NO];
}
@end

















