//
//  SearchHosController.m
//  邻医家
//
//  Created by myApple on 15/5/5.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "CoreExpertResult.h"
#import "UIBarButtonItem+ENTER.h"
#import "Common.h"
#import "CoreExpertTool.h"
#define ID @"cell"
#import "IWCommon.h"
#import "HotDepmentView.h"
#import "MoreDocController.h"
#import "ActionSheetCustomPicker+LD.h"
#import "MoreHosController.h"
#import "ActionSheetCustomPicker.h"
#import "MoreCell.h"
#import "ZonePickerDelegate.h"
#import "MoreItem.h"
#import "City.h"
#import "Province.h"
#import "MJExtension.h"
#import "SearchDoctorController.h"
#import "MoreGroup.h"
#import "MoreHeader.h"
#import "SearchDoctorParam.h"
#import "SearchTypeView.h"
#import "LDNotification.h"
#import "HotAreaView.h"
#import "TopExpertView.h"
@interface SearchDoctorController () <UISearchBarDelegate,HotAreaViewDelegate,TopExpertViewDelegate>
@property (nonatomic,weak) SearchTypeView *searchView;
@property (nonatomic,weak) UISearchBar *searchBar;
@property (nonatomic,strong) NSArray *doctors;
@end

@implementation SearchDoctorController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setup];
    [self addCustomViews];
    [self setKeyBoard];
}
- (void)loadData
{
    [CoreExpertTool coreExpertSuccess:^(CoreExpertResult *result) {
       self.doctors = result.doctors;
    } failure:^(NSError *error) {
        
    }];
}
- (void)setup
{
    self.view.backgroundColor = BGCOLOR;
    self.title = @"搜索医生";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(search) title:@"搜索"];
    [DefaultCenter addObserver:self selector:@selector(moreCityChoosed:) name:MORECITYCHOOSEDNOTIFICATION object:nil];
    [DefaultCenter addObserver:self selector:@selector(cityChoosed:) name:CITYCHOOSEDNOTIFICATION object:nil];
    [DefaultCenter addObserver:self selector:@selector(departmentChoosed:) name:DEPARTMENTCHOOSEDNOTIFICATION object:nil];
}
- (void)search
{
    [self searchBarSearchButtonClicked:self.searchBar];
}
- (void)departmentChoosed:(NSNotification *)notificaiton
{
    [self sendParamWithDepartment:notificaiton.userInfo[@"department"]];
}
- (void)cityChoosed:(NSNotification *)notification
{
    [self sendParamWithCities:notification.userInfo[@"cities"]];
}
- (void)moreCityChoosed:(NSNotification *)notification
{
    [self sendParamWithCitiesId:notification.userInfo[@"cityId"] departmentsId:nil doctorId:nil];
}
- (void)dealloc
{
    [DefaultCenter removeObserver:self];
}
- (void)setDoctors:(NSArray *)doctors
{
    _doctors = doctors;
    self.searchView.topExpertView.doctors = doctors;
}

- (void)addCustomViews
{
    [self setupSearchBar];
    [self addSearchTypeView];
}
- (void)addSearchTypeView
{
    SearchTypeView *view = [[SearchTypeView alloc] init];
    view.hotAreaView.delegate = self;
    view.topExpertView.delegate = self;
    
    self.searchView = view;
    [self.view addSubview:view];
    
    CGFloat viewX = 0;
    CGFloat viewY = CGRectGetMaxY(self.searchBar.frame);
    CGFloat viewW = self.view.frame.size.width;
    CGFloat viewH = self.view.frame.size.height - viewY;
    self.searchView.frame = CGRectMake(viewX, viewY, viewW, viewH);
}
- (void)setKeyBoard
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}
- (void)keyboardWillChangeFrame:(NSNotification *)notification
{
}
- (void)setupSearchBar
{
    UISearchBar *searchBar =  [[UISearchBar alloc] initWithFrame:CGRectMake(0, 74, self.view.frame.size.width, 30)];
    searchBar.delegate = self;
    searchBar.placeholder = @"请输入医生名字";
    self.searchBar = searchBar;
    [self.view addSubview:searchBar];
    
    
}

#pragma mark searchBar Delegate Mehtod
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    int count = (int)self.navigationController.viewControllers.count;
    MoreDocController *moreVC = [self.navigationController.viewControllers objectAtIndex:(count - 2)];
    
    SearchDoctorParam *param = [[SearchDoctorParam alloc] init];
    param.lastId = 0;
    param.num = 10;
    param.keyWord = searchBar.text;
    
    moreVC.param = param;
    [searchBar resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
    
}
#pragma mark - hotareaDelegate 
- (void)hotAreaView:(HotAreaView *)areaView moreBtnClicked:(UIButton *)button
{
     ActionSheetCustomPicker *customPicket = [ActionSheetCustomPicker customPickerWithTitle:@"选择城市"
                                                                                  delegate:[[ZonePickerDelegate alloc] init]
                                                                                    origin:button];
    [customPicket showActionSheetPicker];
}
#pragma mark - topexpert delegate
- (void)topExpertView:(TopExpertView *)topView clickedBtn:(UIButton *)button
{
    int count = (int)self.navigationController.viewControllers.count;
    MoreDocController *moreVC = [self.navigationController.viewControllers objectAtIndex:(count - 2)];
    
    SearchDoctorParam *param = [[SearchDoctorParam alloc] init];
    param.doctor = [NSNumber numberWithInt:button.tag];
    param.lastId = 0;
    param.num = 10;
    moreVC.param = param;
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)sendParamWithCities:(NSString *)cities
{
    int count = (int)self.navigationController.viewControllers.count;
    MoreDocController *moreVC = [self.navigationController.viewControllers objectAtIndex:(count - 2)];
    
    SearchDoctorParam *param = [[SearchDoctorParam alloc] init];
    param.lastId = 0;
    param.num = 10;
    param.cities = cities;
    moreVC.param = param;
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)sendParamWithDepartment:(NSString *)department
{
    int count = (int)self.navigationController.viewControllers.count;
    MoreDocController *moreVC = [self.navigationController.viewControllers objectAtIndex:(count - 2)];
    
    SearchDoctorParam *param = [[SearchDoctorParam alloc] init];
    param.lastId = 0;
    param.num = 10;
    param.departments = department;
    moreVC.param = param;
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)sendParamWithCitiesId:(NSNumber *)cityId departmentsId:(NSNumber *)depId doctorId:(NSNumber *)docId
{
    int count = (int)self.navigationController.viewControllers.count;
    MoreDocController *moreVC = [self.navigationController.viewControllers objectAtIndex:(count - 2)];
    
    SearchDoctorParam *param = [[SearchDoctorParam alloc] init];
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
@end







