//
//  SearchHosController.m
//  邻医家
//
//  Created by myApple on 15/5/5.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#define ID @"cell"
#import "IWCommon.h"
#import "MoreDocController.h"
#import "MoreHosController.h"
#import "ActionSheetCustomPicker.h"
#import "MoreCell.h"
#import "MoreItem.h"
#import "City.h"
#import "Province.h"
#import "MJExtension.h"
#import "AFNetworking.h"
#import "SearchHosController.h"
#import "MoreGroup.h"
#import "MoreHeader.h"
#import "SearchHosResultController.h"
#import "SearchDoctorParam.h"
#import "SearchTypeView.h"
#import "HotAreaTool.h"
#import "HotAreaResult.h"
#import "HotAreaView.h"
@interface SearchHosController () <UISearchBarDelegate,HotAreaViewDelegate>
@property (nonatomic,weak) SearchTypeView *searchView;
@property (nonatomic,weak) UISearchBar *searchBar;
@property (nonatomic,strong) NSArray *locations;
@end

@implementation SearchHosController
- (NSArray *)locations
{
    if (_locations == nil) {
        _locations = [NSMutableArray array];
    }
    return _locations;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = IWColor(226, 226, 226);
    self.title = @"搜索医院";
    
    [self loadData];
    [self setKeyBoard];
}
- (void)loadData
{
    [HotAreaTool hotAreaSuccess:^(HotAreaResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            self.locations = result.locations;
            [self addCustomViews];
        }
    } failure:^(NSError *error) {
        
    }];
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
    view.locations = self.locations;
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
- (void)hotAreaView:(HotAreaView *)areaView sender:(UIButton *)button
{
     int count = (int)self.navigationController.viewControllers.count;
    MoreDocController *moreVC = [self.navigationController.viewControllers objectAtIndex:(count - 2)];
    
    SearchDoctorParam *param = [[SearchDoctorParam alloc] init];
    param.lastId = 0;
    param.num = 10;
    param.cities = [NSString stringWithFormat:@"%d",(int)button.tag];
    moreVC.param = param;
    [self.navigationController popViewControllerAnimated:YES];
}
@end







