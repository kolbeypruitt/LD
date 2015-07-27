//
//  LoginHosController.m
//  邻医家
//
//  Created by Daniel on 15/6/26.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "DepartmentDetailController.h"
#import "CaseDetailController.h"
#import "LoginDocDetailController.h"
#import "LoginDepartmentCell.h"
#import "Doctor.h"
#import "DoctorCell.h"
#import "DiseaseCell.h"
#import "Disease.h"
#import "Hospital.h"
#import "LoginHosController.h"
#import "Common.h"
#import "HospitalDetailView.h"
#import "HospitalDetail.h"
#import "LoginHosResult.h"
#import "LoginHosTool.h"
#import "LDBaseParam.h"
@interface LoginHosController () <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
/**
 *  选项卡
 */
@property (nonatomic,weak) UISegmentedControl *segmentControl;
@property (nonatomic,weak) UIScrollView *scrollView;
/**
 *   介绍
 */
@property (nonatomic,weak) HospitalDetailView *introductionView;
/**
 *   科室
 */
@property (nonatomic,weak) UITableView *departmentView;
/**
 *  病例
 */
@property (nonatomic,weak) UITableView *caseView;
/**
 *  专家
 */
@property (nonatomic,weak) UITableView *doctorView;
@property (nonatomic,strong) HospitalDetail *hospitalDetail;
@property (nonatomic,strong) NSArray *doctors;
@property (nonatomic,strong) NSArray *departments;
@property (nonatomic,strong) NSArray *diseases;
@end

@implementation LoginHosController
- (NSArray *)doctors
{
    if (_doctors == nil) {
        _doctors = [NSArray array];
    }
    return _doctors;
}
- (NSArray *)departments
{
    if (_departments == nil) {
        _departments = [NSArray array];
    }
    return _departments;
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
- (void)setup
{
    self.view.backgroundColor = BGCOLOR;
    self.navigationItem.title = self.hospital.name;
    self.navigationItem.rightBarButtonItem = nil;
    [self addCustomeViews];
    [self layoutCustomeViews];
}
- (void)setHospital:(Hospital *)hospital
{
    _hospital = hospital;
}
- (void)setHospitalDetail:(HospitalDetail *)hospitalDetail
{
    _hospitalDetail = hospitalDetail;
    self.introductionView.hosdetail = hospitalDetail;
}
- (void)addCustomeViews
{
    //选项卡
    NSArray *items = @[@"介绍",@"科室",@"专家",@"病例"];
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
    HospitalDetailView *introductionView = [[HospitalDetailView alloc] init];
    self.introductionView = introductionView;
    [self.scrollView addSubview:introductionView];
    
    //科室
    UITableView *departmentView = [[UITableView alloc] init];
    departmentView.delegate = self;
    departmentView.dataSource = self;
    departmentView.backgroundColor = IWColor(226, 226, 226);
    self.departmentView = departmentView;
    [self.scrollView addSubview:departmentView];
    
    //病例
    UITableView *caseView = [[UITableView alloc] init];
    caseView.backgroundColor = IWColor(226, 226, 226);
    caseView.delegate = self;
    caseView.dataSource = self;
    self.caseView  = caseView;
    [self.scrollView addSubview:self.caseView];
    
    //专家
    UITableView *doctorView = [[UITableView alloc] init];
    doctorView.backgroundColor = IWColor(226, 226, 226);
    doctorView.delegate = self;
    doctorView.dataSource = self;
    self.doctorView = doctorView;
    [self.scrollView addSubview:self.doctorView];
}
- (void)loadData
{
    LDBaseParam *param = [LDBaseParam paramWithId:self.hospital.id];
    [LoginHosTool loginHosWithParam:param success:^(LoginHosResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            self.doctors = result.doctors;
            [self.doctorView reloadData];
            self.diseases = result.cases;
            [self.caseView reloadData];
            self.hospitalDetail = result.hospital;
            self.departments = result.departments;
            [self.departmentView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
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
    
    //科室
    CGFloat achieveX = SCREENWIDTH;
    CGFloat achieveY = introY;
    CGFloat achieveW = SCREENWIDTH;
    CGFloat achieveH = tableHeight;
    self.departmentView.frame = CGRectMake(achieveX, achieveY, achieveW, achieveH);
    
    //专家
    CGFloat caseX = 2 *SCREENWIDTH;
    CGFloat caseY = introY;
    CGFloat caseW = SCREENWIDTH;
    CGFloat caseH = tableHeight;
    self.doctorView.frame = CGRectMake(caseX, caseY, caseW, caseH);
    
    //病例
    CGFloat assignX = 3 *SCREENWIDTH;
    CGFloat assignY = introY;
    CGFloat assignW = SCREENWIDTH;
    CGFloat assignH = tableHeight;
    self.caseView.frame = CGRectMake(assignX, assignY, assignW, assignH);
}

#pragma mark - UITableView delegate and Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableView isEqual:self.departmentView]) {
        return self.departments.count;
    }else if([tableView isEqual:self.caseView])
    {
        return self.diseases.count;
    }else if([tableView isEqual:self.doctorView])
    {
        return self.doctors.count;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:self.departmentView]) {
        LoginDepartmentCell *cell = [LoginDepartmentCell cellWithTableView:tableView];
        cell.department = self.departments[indexPath.row];
        return cell;
    }else if([tableView isEqual:self.caseView])
    {
        DiseaseCell *cell = [DiseaseCell cellWithTableView:tableView];
        cell.commonCase = self.diseases[indexPath.row];
        return cell;
    }else if([tableView isEqual:self.doctorView])
    {
        DoctorCell *cell = [DoctorCell cellWithTableView:tableView];
        cell.doctor = self.doctors[indexPath.row];
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
    return 90;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([tableView isEqual:self.doctorView]) {
        LoginDocDetailController *VC = [[LoginDocDetailController alloc] init];
        VC.doctor = self.doctors[indexPath.row];
        [self.navigationController pushViewController:VC animated:YES];
    }else if ([tableView isEqual:self.caseView])
    {
        CaseDetailController *caseVC = [[CaseDetailController alloc] init];
        caseVC.norcase = self.diseases[indexPath.row];
        [self.navigationController pushViewController:caseVC animated:YES];
    }else if([tableView isEqual:self.departmentView])
    {
        DepartmentDetailController *detailVC = [[DepartmentDetailController alloc] init];
        [self.navigationController pushViewController:detailVC animated:YES];
    }
}




@end



















