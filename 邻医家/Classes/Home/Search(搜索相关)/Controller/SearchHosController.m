//
//  SearchHosController.m
//  邻医家
//
//  Created by Daniel on 15/6/29.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "SearchHosController.h"
#import "SearchHosView.h"
#import "UIBarButtonItem+ENTER.h"
#import "Common.h"
#import "HotAreaView.h"
#import "HotHospitalView.h"
#import "HotDepmentView.h"
@interface SearchHosController ()<HotAreaViewDelegate,HotDepmentViewDelegate,HotHospitalViewDelegate,UISearchBarDelegate>
@property (nonatomic,weak) SearchHosView *searchView;
@property (nonatomic,weak) UISearchBar *searchBar;
@end

@implementation SearchHosController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addCustomViews];
    [self setup];
}
- (void)setup
{
    self.title = @"搜索医院";
    self.view.backgroundColor = BGCOLOR;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(search) title:@"搜索"];
}
- (void)search
{
    
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
    view.hotdepView.delegate = self;
    
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
    searchBar.placeholder = @"请输入医生名字";
    self.searchBar = searchBar;
    [self.view addSubview:searchBar];
    
    
}

@end
