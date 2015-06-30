//
//  SearchCaseController.m
//  邻医家
//
//  Created by Daniel on 15/6/30.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "MoreCaseController.h"
#import "SearchCaseParam.h"
#import "SearchCaseController.h"
#import "UIBarButtonItem+ENTER.h"
#import "Common.h"
#import "HotDepmentView.h"
#import "UILabel+LD.h"
#import "LDNotification.h"
@interface SearchCaseController ()<UISearchBarDelegate>
@property (nonatomic,weak) UISearchBar *searchBar;
@property (nonatomic,weak) UILabel *hotDepLabel;
@property (nonatomic,weak) HotDepmentView *hotView;
@end

@implementation SearchCaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.view.backgroundColor = BGCOLOR;
    self.title = @"搜索病例";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(search) title:@"搜索"];
    [DefaultCenter addObserver:self selector:@selector(departmentChoosed:) name:DEPARTMENTCHOOSEDNOTIFICATION object:nil];
    [self setupSearchBar];
    [self addCustomViews];
    [self layoutCustomView];
}
- (void)departmentChoosed:(NSNotification *)notification
{
    int count = (int)self.navigationController.viewControllers.count;
    MoreCaseController *moreVC = [self.navigationController.viewControllers objectAtIndex:(count - 2)];
    
    SearchCaseParam *param = [[SearchCaseParam alloc] init];
    param.lastId = 0;
    param.num = 10;
    param.departments = notification.userInfo[@"department"];
    
    moreVC.param = param;
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)addCustomViews
{
    UILabel *hotDepLabel = [UILabel labelWithTitle:@"热门科室" font:14 textColor:[UIColor blackColor]];
    hotDepLabel.textAlignment = NSTextAlignmentCenter;
    self.hotDepLabel = hotDepLabel;
    [self.view addSubview:hotDepLabel];
    
    HotDepmentView *hotView = [[HotDepmentView alloc] init];
    self.hotView = hotView;
    [self.view addSubview:hotView];
}
- (void)layoutCustomView
{
    CGFloat labelX = 0;
    CGFloat labelY = CGRectGetMaxY(self.searchBar.frame);
    CGFloat labelW = SCREENWIDTH;
    CGFloat labelH = 30;
    self.hotDepLabel.frame = CGRectMake(labelX, labelY, labelW, labelH);
    
    CGFloat hotX = labelX;
    CGFloat hotY = CGRectGetMaxY(self.hotDepLabel.frame);
    CGFloat hotW = SCREENWIDTH;
    CGFloat hotH = SCREENHEIGHT - hotY;
    self.hotView.frame = CGRectMake(hotX, hotY, hotW, hotH);
}
- (void)search
{
    [self searchBarSearchButtonClicked:self.searchBar];
}
- (void)setupSearchBar
{
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 74, self.view.frame.size.width, 30)];
    searchBar.delegate = self;
    searchBar.placeholder = @"科室/关键字";
    [self.view addSubview:searchBar];
    self.searchBar = searchBar;
}
#pragma mark - search delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    int count = (int)self.navigationController.viewControllers.count;
    MoreCaseController *moreVC = [self.navigationController.viewControllers objectAtIndex:(count - 2)];
    
    SearchCaseParam *param = [[SearchCaseParam alloc] init];
    param.lastId = 0;
    param.num = 10;
    param.keyWord = searchBar.text;
    
    moreVC.param = param;
    [self.navigationController popViewControllerAnimated:YES];   
}
@end
