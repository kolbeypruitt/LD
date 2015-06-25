//
//  PostDocRecruitController.m
//  邻医家
//
//  Created by Daniel on 15/5/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "PostDocRecruitController.h"

@interface PostDocRecruitController () <UISearchBarDelegate>
@end

@implementation PostDocRecruitController

- (void)viewDidLoad {
    [self setupSearchBar];
}
- (void)setupSearchBar
{
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 30)];
    searchBar.delegate = self;
    searchBar.placeholder = @"请输入搜索关键词";
    self.tableView.tableHeaderView = searchBar;
    self.searchBar = searchBar;
}


@end
