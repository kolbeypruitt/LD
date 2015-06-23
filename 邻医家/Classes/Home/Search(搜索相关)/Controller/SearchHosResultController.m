//
//  SearchResultController.m
//  邻医家
//
//  Created by Daniel on 15/5/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "SearchDoctorTool.h"
#import "SearchHosResultController.h"
#import "SearchDoctorParam.h"
#import "SearchDoctorResult.h"
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
    [SearchDoctorTool searchDoctorWithParam:self.param success:^(SearchDoctorResult *result) {
        
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
