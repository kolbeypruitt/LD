//
//  SearchResultController.m
//  邻医家
//
//  Created by Daniel on 15/5/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "HomeTool.h"
#import "SearchHosResultController.h"
#import "DocSearchParam.h"
#import "DocSearchResult.h"
@interface SearchHosResultController ()
@property (nonatomic,strong) NSMutableArray *doctors;
@end

@implementation SearchHosResultController
- (NSMutableArray *)doctors
{
    if (_doctors == nil) {
        _doctors = [NSMutableArray array];
    }
    return _doctors;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSearchResult];
    
}
- (void)loadSearchResult{
    DocSearchParam *param = [[DocSearchParam alloc] init];
    
    [HomeTool docSearchResultWithParam:param success:^(DocSearchResult *result) {
        [self.doctors addObjectsFromArray:result.doctors];
    } failure:^(NSError *error) {
        
    }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
@end
