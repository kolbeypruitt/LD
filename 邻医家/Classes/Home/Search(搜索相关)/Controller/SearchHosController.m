//
//  SearchHosController.m
//  邻医家
//
//  Created by Daniel on 15/6/29.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "ActionSheetCustomPicker+LD.h"
#import "ZonePickerDelegate.h"
#import "SearchHosController.h"
#import "LDNotification.h"
#import "SearchHosView.h"
#import "UIBarButtonItem+ENTER.h"
#import "Common.h"
#import "HotAreaView.h"
#import "HotHospitalView.h"
#import "HotDepmentView.h"
#import "SearchHosParam.h"
#import "MoreHosController.h"
#import "SearchHosResult.h"
#import "HotHosTool.h"
@interface SearchHosController ()<HotAreaViewDelegate,HotHospitalViewDelegate,UISearchBarDelegate>
@property (nonatomic,weak) SearchHosView *searchView;
@property (nonatomic,weak) UISearchBar *searchBar;
@end

@implementation SearchHosController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addCustomViews];
    [self setup];
    [self loadData];
}
- (void)loadData
{
    [HotHosTool hotHosSuccess:^(SearchHosResult *result) {
        if ([result.status isEqualToString:SUCCESSSTATUS]) {
            self.searchView.hotHosView.hospitals = result.hospitals;
        }
    } failure:^(NSError *error) {
        
    }];
}
- (void)setup
{
    self.title = @"搜索医院";
    self.view.backgroundColor = BGCOLOR;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(search) title:@"搜索"];
    [DefaultCenter addObserver:self selector:@selector(moreCityChoosed:) name:MORECITYCHOOSEDNOTIFICATION object:nil];
    [DefaultCenter addObserver:self selector:@selector(cityChoosed:) name:CITYCHOOSEDNOTIFICATION object:nil];
    [DefaultCenter addObserver:self selector:@selector(departmentChoosed:) name:DEPARTMENTCHOOSEDNOTIFICATION object:nil];
}
- (void)cityChoosed:(NSNotification *)notification
{
    [self sendParamWithCities:notification.userInfo[@"cities"]];
}
- (void)dealloc
{
    [DefaultCenter removeObserver:self];
}
- (void)search
{
    [self searchBarSearchButtonClicked:self.searchBar];
}
- (void)addCustomViews
{
    [self setupSearchBar];
    [self addSearchTypeView];
}
- (void)addSearchTypeView
{
    SearchHosView *view = [[SearchHosView alloc] init];
    view.hotAreaView.delegate = self;
    view.hotHosView.delegate = self;
    
    self.searchView = view;
    [self.view addSubview:view];
    
    CGFloat viewX = 0;
    CGFloat viewY = CGRectGetMaxY(self.searchBar.frame);
    CGFloat viewW = self.view.frame.size.width;
    CGFloat viewH = self.view.frame.size.height - viewY;
    self.searchView.frame = CGRectMake(viewX, viewY, viewW, viewH);
}
- (void)setupSearchBar
{
    UISearchBar *searchBar =  [[UISearchBar alloc] initWithFrame:CGRectMake(0, 74, self.view.frame.size.width, 30)];
    searchBar.delegate = self;
    searchBar.placeholder = @"请输入医院名字";
    self.searchBar = searchBar;
    [self.view addSubview:searchBar];
    
    
}
- (void)moreCityChoosed:(NSNotification *)notification
{
    [self sendParamWithCitiesId:notification.userInfo[@"cityId"] departmentsId:nil doctorId:nil];
}
- (void)sendParamWithCitiesId:(NSNumber *)cityId departmentsId:(NSNumber *)depId doctorId:(NSNumber *)docId
{
    int count = (int)self.navigationController.viewControllers.count;
    MoreHosController *moreVC = [self.navigationController.viewControllers objectAtIndex:(count - 2)];
    
    SearchHosParam *param = [[SearchHosParam alloc] init];
    param.lastId = 0;
    param.num = 10;
    if (cityId == nil) {
        param.cities = nil;
    }else
    {
        param.cities = [NSString stringWithFormat:@"%@",cityId];
    }
    if (depId == nil) {
        param.departments = nil;
    }else
    {
        param.departments = [NSString stringWithFormat:@"%@",depId];
    }
    param.doctor = docId;
    moreVC.param = param;
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)sendParamWithCities:(NSString *)cities
{
    int count = (int)self.navigationController.viewControllers.count;
    MoreHosController *moreVC = [self.navigationController.viewControllers objectAtIndex:(count - 2)];
    
    SearchHosParam *param = [[SearchHosParam alloc] init];
    param.lastId = 0;
    param.num = 10;
    param.cities = cities;
    moreVC.param = param;
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)sendParamWithDepartment:(NSString *)department
{
    int count = (int)self.navigationController.viewControllers.count;
    MoreHosController *moreVC = [self.navigationController.viewControllers objectAtIndex:(count - 2)];
    
    SearchHosParam *param = [[SearchHosParam alloc] init];
    param.lastId = 0;
    param.num = 10;
    param.departments = department;
    moreVC.param = param;
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)departmentChoosed:(NSNotification *)notificaiton
{
    [self sendParamWithDepartment:notificaiton.userInfo[@"department"]];
}
- (void)hotAreaView:(HotAreaView *)areaView moreBtnClicked:(UIButton *)button
{
    ActionSheetCustomPicker *customPicket = [ActionSheetCustomPicker customPickerWithTitle:@"选择城市"
                                                                                  delegate:[[ZonePickerDelegate alloc] init]
                                                                                    origin:button];
    [customPicket showActionSheetPicker];
}
#pragma mark - searchBar delegate method
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    int count = (int)self.navigationController.viewControllers.count;
    MoreHosController *moreVC = [self.navigationController.viewControllers objectAtIndex:(count - 2)];
    
    SearchHosParam *param = [[SearchHosParam alloc] init];
    param.lastId = 0;
    param.num = 10;
    param.keyWord = searchBar.text;
    
    moreVC.param = param;
    [self.navigationController popViewControllerAnimated:YES];   
}
#pragma mark - hothosview delegate
- (void)hotHospitalView:(HotHospitalView *)hospitalView clieckedBtn:(UIButton *)button
{
    int count = (int)self.navigationController.viewControllers.count;
    MoreHosController *moreVC = [self.navigationController.viewControllers objectAtIndex:(count - 2)];
    
    SearchHosParam *param = [[SearchHosParam alloc] init];
    param.lastId = 0;
    param.num = 10;
    param.hospital = [NSNumber numberWithInteger:button.tag];
    moreVC.param = param;
    [self.navigationController popViewControllerAnimated:YES];   
}
@end


