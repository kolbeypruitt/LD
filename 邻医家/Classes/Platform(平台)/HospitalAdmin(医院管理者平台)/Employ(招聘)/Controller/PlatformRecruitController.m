//
//  PlatformRecruitController.m
//  邻医家
//
//  Created by Daniel on 15/6/1.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "RecruitDetailController.h"
#import "EmployeeCell.h"
#import "PlatformRecruitController.h"
#import "UIBarButtonItem+ENTER.h"
#import "Common.h"
#import "Employee.h"
@interface PlatformRecruitController () <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
/**
 *  选项卡
 */
@property (nonatomic,weak) UISegmentedControl *segmentControl;
@property (nonatomic,weak) UIScrollView *scrollView;
/**
 *   全职
 */
@property (nonatomic,weak) UITableView *fullTimeView;
/**
 *   兼职
 */
@property (nonatomic,weak) UITableView *partTimeView;
/**
 *  实习
 */
@property (nonatomic,weak) UITableView *praticeView;
/**
 *  进修
 */
@property (nonatomic,weak) UITableView *studyView;
/**
 *   博士
 */
@property (nonatomic,weak) UITableView *doctorView;
@end

@implementation PlatformRecruitController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setFulltimeDatas:(NSArray *)fulltimeDatas
{
    _fulltimeDatas = fulltimeDatas;
    [self.fullTimeView reloadData];
}
- (void)setParttimeDatas:(NSArray *)parttimeDatas
{
    _parttimeDatas = parttimeDatas;
    [self.partTimeView reloadData];
}
- (void)setStudyDatas:(NSArray *)studyDatas
{
    _studyDatas = studyDatas;
    [self.studyView reloadData];
}
- (void)setDoctorDatas:(NSArray *)doctorDatas
{
    _doctorDatas = doctorDatas;
    [self.doctorView reloadData];
}
- (void)setPracticeDatas:(NSArray *)practiceDatas
{
    _practiceDatas = practiceDatas;
    [self.praticeView reloadData];
}
- (void)setup
{
    self.title = @"招聘信息发布";
    self.view.backgroundColor = BGCOLOR;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(appendRecruit) title:@"添加"];
    [self addCustomeViews];
    [self layoutCustomeViews];
}
- (void)addCustomeViews
{
    //选项卡
    NSArray *items = @[@"全职",@"兼职",@"实习",@"进修",@"博士"];
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:items];
    [segmentControl addTarget:self action:@selector(segmentControlPressed:) forControlEvents:UIControlEventValueChanged];
    segmentControl.selectedSegmentIndex = 0;
    [self.view addSubview:segmentControl];
    self.segmentControl = segmentControl;
    
    //滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    
    //全职
    UITableView *fullTimeView = [[UITableView alloc] init];
    fullTimeView.delegate = self;
    fullTimeView.dataSource = self;
    fullTimeView.backgroundColor = BGCOLOR;
    self.fullTimeView = fullTimeView;
    [self.scrollView addSubview:fullTimeView];
    
    //兼职
    UITableView *partTimeView = [[UITableView alloc] init];
    partTimeView.delegate = self;
    partTimeView.dataSource = self;
    partTimeView.backgroundColor = IWColor(226, 226, 226);
    self.partTimeView = partTimeView;
    [self.scrollView addSubview:partTimeView];
    
    //实习
    UITableView *practiceView = [[UITableView alloc] init];
    practiceView.backgroundColor = IWColor(226, 226, 226);
    practiceView.delegate = self;
    practiceView.dataSource = self;
    self.praticeView  = practiceView;
    [self.scrollView addSubview:practiceView];
    
    //进修
    UITableView *studyView = [[UITableView alloc] init];
    studyView.backgroundColor = IWColor(226, 226, 226);
    studyView.delegate = self;
    studyView.dataSource = self;
    self.studyView = studyView;
    [self.scrollView addSubview:studyView];
    
    //博士
    UITableView *doctorView = [[UITableView alloc] init];
    doctorView.backgroundColor = IWColor(226, 226, 226);
    doctorView.delegate = self;
    doctorView.dataSource = self;
    self.doctorView = doctorView;
    [self.scrollView addSubview:doctorView];
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
        case 4:
            [self.scrollView setContentOffset:CGPointMake(4 * SCREENWIDTH, 0)];
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
        }else if(offsetX == 4 * SCREENWIDTH )
        {
            self.segmentControl.selectedSegmentIndex = 4;
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
    
    self.scrollView.contentSize = CGSizeMake(5 * SCREENWIDTH, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.backgroundColor = IWColor(226, 226, 226);
    self.scrollView.bounces = NO;
    self.scrollView.delegate = self;
    
    CGFloat tableHeight = scrollH;
    CGFloat tableW = SCREENWIDTH;
    CGFloat tableY = 0;
    //全职
    CGFloat introX = 0;
    CGFloat introY = 0;
    CGFloat introW = tableW;
    CGFloat introH = tableHeight;
    self.fullTimeView.frame = CGRectMake(introX, introY, introW, introH);
    
    //兼职
    CGFloat achieveX = CGRectGetMaxX(self.fullTimeView.frame);
    CGFloat achieveY = tableY;
    CGFloat achieveW = tableW;
    CGFloat achieveH = tableHeight;
    self.partTimeView.frame = CGRectMake(achieveX, achieveY, achieveW, achieveH);
    
    //实习
    CGFloat caseX = CGRectGetMaxX(self.partTimeView.frame);
    CGFloat caseY = introY;
    CGFloat caseW = SCREENWIDTH;
    CGFloat caseH = tableHeight;
    self.praticeView.frame = CGRectMake(caseX, caseY, caseW, caseH);
    
    //进修
    CGFloat studyX = CGRectGetMaxX(self.praticeView.frame);
    CGFloat studyY = tableY;
    CGFloat studyW = tableW;
    CGFloat studyH = tableHeight;
    self.studyView.frame = CGRectMake(studyX, studyY, studyW, studyH);
    
     // 博士
    CGFloat docX = CGRectGetMaxX(self.studyView.frame);
    CGFloat docY = introY;
    CGFloat docW = SCREENWIDTH;
    CGFloat docH = tableHeight;
    self.doctorView.frame = CGRectMake(docX, docY, docW, docH);
}

#pragma mark - UITableView delegate and Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableView isEqual:self.fullTimeView]) {
        return self.fulltimeDatas.count;
    }else if([tableView isEqual:self.partTimeView])
    {
        return self.parttimeDatas.count;
    }else if([tableView isEqual:self.praticeView])
    {
        return self.practiceDatas.count;
    }else if([tableView isEqual:self.studyView])
    {
        return self.studyDatas.count;
    }else
    {
        return self.doctorDatas.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EmployeeCell *cell = [EmployeeCell cellWithTableView:tableView];
    Employee  *em = nil;
    if ([tableView isEqual:self.fullTimeView]) {
        em = self.fulltimeDatas[indexPath.row];
    }else if([tableView isEqual:self.partTimeView])
    {
        em = self.parttimeDatas[indexPath.row];
    }else if([tableView isEqual:self.praticeView])
    {
        em = self.practiceDatas[indexPath.row];
    }else if([tableView isEqual:self.studyView])
    {
        em = self.studyDatas[indexPath.row];
    }else if([tableView isEqual:self.doctorView])
    {
        em = self.doctorDatas[indexPath.row];
    }
    
    cell.emp = em;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Employee  *em = nil;
    if ([tableView isEqual:self.fullTimeView]) {
        em = self.fulltimeDatas[indexPath.row];
    }else if([tableView isEqual:self.partTimeView])
    {
        em = self.parttimeDatas[indexPath.row];
    }else if([tableView isEqual:self.praticeView])
    {
        em = self.practiceDatas[indexPath.row];
    }else if([tableView isEqual:self.studyView])
    {
        em = self.studyDatas[indexPath.row];
    }else if([tableView isEqual:self.doctorView])
    {
        em = self.doctorDatas[indexPath.row];
    }
    
    RecruitDetailController *detatiController = [[RecruitDetailController alloc] init];
    detatiController.empl = em;
    [self.navigationController pushViewController:detatiController animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 64;
    
}

#pragma mark - 添加招聘信息
- (void)appendRecruit
{
    
}

@end
