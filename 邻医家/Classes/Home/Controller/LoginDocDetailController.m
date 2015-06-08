//
//  LoginDocDetailController.m
//  邻医家
//
//  Created by Daniel on 15/6/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LoginDocDetailController.h"
#import "Common.h"
#import "IWCommon.h"
@interface LoginDocDetailController () <UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
/**
 *  选项卡
 */
@property (nonatomic,weak) UISegmentedControl *segmentControl;
@property (nonatomic,weak) UIScrollView *scrollView;
/**
 *   介绍
 */
@property (nonatomic,weak) UIView *introductionView;
/**
 *   成果
 */
@property (nonatomic,weak) UITableView *achievementView;
/**
 *  病例
 */
@property (nonatomic,weak) UITableView *caseView;
/**
 *  安排
 */
@property (nonatomic,weak) UITableView *assignmentView;
@end

@implementation LoginDocDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.view.backgroundColor = IWColor(226, 226, 226);
    [self addCustomeViews];
    [self layoutCustomeViews];
}
- (void)addCustomeViews
{
    //选项卡
    NSArray *items = @[@"介绍",@"成果",@"病例",@"安排"];
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:items];
    [segmentControl addTarget:self action:@selector(segmentControlPressed:) forControlEvents:UIControlEventValueChanged];
    segmentControl.selectedSegmentIndex = 0;
    [self.view addSubview:segmentControl];
    self.segmentControl = segmentControl;
    
    //滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    
    //介绍
    UIView *introductionView = [[UIView alloc] init];
    self.introductionView = introductionView;
    [self.scrollView addSubview:introductionView];
    
    //成果
    UITableView *achievementView = [[UITableView alloc] init];
    achievementView.delegate = self;
    achievementView.dataSource = self;
    self.achievementView = achievementView;
    [self.scrollView addSubview:achievementView];
    
    //病例
    UITableView *caseView = [[UITableView alloc] init];
    caseView.delegate = self;
    caseView.dataSource = self;
    self.caseView  = caseView;
    [self.scrollView addSubview:self.caseView];
    
    //安排
    UITableView *assignmentView = [[UITableView alloc] init];
    assignmentView.delegate = self;
    assignmentView.dataSource = self;
    self.assignmentView = assignmentView;
    [self.scrollView addSubview:self.assignmentView];
}
#pragma mark - segmentcontrol 点击切换视图
- (void)segmentControlPressed:(UISegmentedControl *)segmentControl
{
    switch (segmentControl.selectedSegmentIndex) {
        case 0:
            [self.scrollView setContentOffset:CGPointMake(0, 0)];
            break;
        case 1:
            [self.scrollView setContentOffset:CGPointMake(SCREENWIDTH, 0)];
            break;
        case 2:
            [self.scrollView setContentOffset:CGPointMake(2 * SCREENWIDTH, 0)];
            break;
        case 3:
            [self.scrollView setContentOffset:CGPointMake(3 * SCREENWIDTH, 0)];
            break;
            
        default:
            break;
    }
}
#pragma mark - scrollView delegate method
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ([scrollView  isEqual:self.scrollView]) {
        CGFloat offsetX = scrollView.contentOffset.x;
        if (offsetX == 0) {
            self.segmentControl.selectedSegmentIndex = 0;
        }else if(offsetX == SCREENWIDTH)
        {
            self.segmentControl.selectedSegmentIndex = 1;
        }else if(offsetX == 2 * SCREENWIDTH)
        {
            self.segmentControl.selectedSegmentIndex = 2;
        }else if(offsetX == 3 * SCREENWIDTH)
        {
            self.segmentControl.selectedSegmentIndex = 3;
        }
        
    }
}
- (void)layoutCustomeViews
{
    //选项卡
    CGFloat segX = 0;
    CGFloat segY = 64;
    CGFloat segW = SCREENWIDTH;
    CGFloat segH = 30;
    self.segmentControl.frame = CGRectMake(segX, segY, segW, segH);
    
    //滚动视图
    CGFloat scrollX = segX;
    CGFloat scrollY = CGRectGetMaxY(self.segmentControl.frame);
    CGFloat scrollW = SCREENWIDTH;
    CGFloat scrollH = SCREENHEIGHT - scrollY;
    self.scrollView.frame = CGRectMake(scrollX, scrollY, scrollW, scrollH);
    
    self.scrollView.contentSize = CGSizeMake(4 * SCREENWIDTH, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.backgroundColor = IWColor(226, 226, 226);
    self.scrollView.bounces = NO;
    self.scrollView.delegate = self;
    
    CGFloat tableHeight = scrollH - 45;
    //介绍
    CGFloat introX = 0;
    CGFloat introY = 0;
    CGFloat introW = SCREENWIDTH;
    CGFloat introH = tableHeight;
    self.introductionView.frame = CGRectMake(introX, introY, introW, introH);
    
    //成果
    CGFloat achieveX = SCREENWIDTH;
    CGFloat achieveY = introY;
    CGFloat achieveW = SCREENWIDTH;
    CGFloat achieveH = tableHeight;
    self.achievementView.frame = CGRectMake(achieveX, achieveY, achieveW, achieveH);
    
    //病例
    CGFloat caseX = 2 *SCREENWIDTH;
    CGFloat caseY = introY;
    CGFloat caseW = SCREENWIDTH;
    CGFloat caseH = tableHeight;
    self.caseView.frame = CGRectMake(caseX, caseY, caseW, caseH);
    
    //安排
    CGFloat assignX = 3 *SCREENWIDTH;
    CGFloat assignY = introY;
    CGFloat assignW = SCREENWIDTH;
    CGFloat assignH = tableHeight;
    self.assignmentView.frame = CGRectMake(assignX, assignY, assignW, assignH);
}

#pragma mark - UITableView delegate and Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"cell %d",(int)indexPath.row];
    return cell;
}


@end











