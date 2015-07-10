//
//  LoginDocDetailController.m
//  邻医家
//
//  Created by Daniel on 15/6/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDPaperDetailController.h"
#import "CaseDetailController.h"
#import "DiseaseCell.h"
#import "AchieveMentCell.h"
#import "Doctor.h"
#import "LDPaper.h"
#import "Case.h"
#import "LoginDocDetailController.h"
#import "Common.h"
#import "IWCommon.h"
#import "Doctor.h"
#import "DoctorView.h"
#import "LDBaseParam.h"
#import "LoginDocDetailResult.h"
#import "LoginDocDetailTool.h"
@interface LoginDocDetailController () <UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
/**
 *  选项卡
 */
@property (nonatomic,weak) UISegmentedControl *segmentControl;
@property (nonatomic,weak) UIScrollView *scrollView;
/**
 *   介绍
 */
@property (nonatomic,weak) DoctorView *introductionView;
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
@property (nonatomic,strong) Doctor *introduction;
@property (nonatomic,strong) NSArray *papers;
@property (nonatomic,strong) NSArray *diseases;
@end

@implementation LoginDocDetailController
- (NSArray *)papers
{
    if (_papers == nil) {
        _papers = [NSArray array];
    }
    return _papers;
}
- (NSArray *)diseases
{
    if (_diseases == nil) {
        _diseases = [NSArray array];
    }
    return _diseases;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setup];
}
- (void)loadData
{
    LDBaseParam *param = [LDBaseParam paramWithId:self.doctor.id];
    [LoginDocDetailTool loginDocdetailWithParam:param success:^(LoginDocDetailResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            self.introduction = result.intorduction;
            self.navigationItem.title = result.intorduction.name;
            self.diseases = result.cases;
            [self.caseView reloadData];
            
            self.papers = result.papers;
            [self.achievementView reloadData];
        }
    } failure:^(NSError *errror) {
        
    }];
}
- (void)setDoctor:(Doctor *)doctor
{
    _doctor = doctor;
}
- (void)setIntroduction:(Doctor *)introduction
{
    _introduction =  introduction;
    self.introductionView.doctor = self.introduction;
}
- (void)setup
{
    self.view.backgroundColor = IWColor(226, 226, 226);
    self.navigationItem.rightBarButtonItem = nil;
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
    DoctorView *introductionView = [[DoctorView alloc] init];
    self.introductionView = introductionView;
    [self.scrollView addSubview:introductionView];
    
    //成果
    UITableView *achievementView = [[UITableView alloc] init];
    achievementView.delegate = self;
    achievementView.dataSource = self;
    achievementView.backgroundColor = IWColor(226, 226, 226);
    self.achievementView = achievementView;
    [self.scrollView addSubview:achievementView];
    
    //病例
    UITableView *caseView = [[UITableView alloc] init];
    caseView.backgroundColor = IWColor(226, 226, 226);
    caseView.delegate = self;
    caseView.dataSource = self;
    self.caseView  = caseView;
    [self.scrollView addSubview:self.caseView];
    
    //安排
    UITableView *assignmentView = [[UITableView alloc] init];
    assignmentView.backgroundColor = IWColor(226, 226, 226);
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
    
    CGFloat tableHeight = scrollH;
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
    if ([tableView isEqual:self.achievementView]) {
        return self.papers.count;
    }else if([tableView isEqual:self.caseView])
    {
        return self.diseases.count;
    }else
    {
        return 0;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:self.achievementView]) {
        AchieveMentCell *cell = [AchieveMentCell cellWithTabelView:tableView];
        cell.paper = self.papers[indexPath.row];
        return cell;
    }else if([tableView isEqual:self.caseView])
    {
        DiseaseCell *cell = [DiseaseCell cellWithTableView:tableView];
        cell.commonCase = self.diseases[indexPath.row];
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"cell %d",(int)indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:self.achievementView]) {
        return 120;
    }else
    {
        return 90;
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:self.caseView]) {
        CaseDetailController *caseVC = [[CaseDetailController alloc] init];
        caseVC.norcase = self.diseases[indexPath.row];
        [self.navigationController pushViewController:caseVC animated:YES];
    }else if([tableView isEqual:self.achievementView])
    {
        LDPaperDetailController *ldVC = [[LDPaperDetailController alloc] init];
        ldVC.paper = self.papers[indexPath.row];
        [self.navigationController pushViewController:ldVC animated:YES];
    }
}

@end











