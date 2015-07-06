//
//  PublicHomeController.m
//  邻医家
//
//  Created by Daniel on 15/5/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Account.h"
#import "LoginHosController.h"
#import "IWNavigationController.h"
#import "MBProgressHUD+MJ.h"
#import "AccountTool.h"
#import "LoginViewController.h"
#import "MultiJobController.h"
#import "CaseDetailController.h"
#import "PostDoctorController.h"
#import "RecruitMessageController.h"
#import "LDHomeFooterView.h"
#import "MoreDocController.h"
#import "MoreHosController.h"
#import "HosDetailController.h"
#import "DoctorDetailController.h"
#import "PublicHomeController.h"
#import "RecommendResult.h"
#import "HomeTool.h"
#import "Common.h"
#import "DoctorCell.h"
#import "Doctor.h"
#import "Hospital.h"
#import "HospitalCell.h"
#import "DiseaseCell.h"
#import "Case.h"
#import "LDHomeHeadView.h"
#import "UIBarButtonItem+MJ.h"
#import "UIBarButtonItem+ENTER.h"
#import "LoginDocDetailController.h"
#import "MoreCaseController.h"
@interface PublicHomeController () <UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,LDHomeFooterViewDelegate,LDHomeHeaderViewDelegate>
@property (nonatomic,weak) UIScrollView *scrollView;
@property (nonatomic,weak) UISegmentedControl *segmentControl;
@property (nonatomic,weak) UITableView *doctorView;
@property (nonatomic,weak) UITableView *hospitalView;
@property (nonatomic,weak) UITableView *diseaseView;
@property (nonatomic,strong) NSMutableArray *doctors;
@property (nonatomic,strong) NSMutableArray *hospitals;
@property (nonatomic,strong) NSMutableArray *diseases;
@property (nonatomic,weak) LDHomeFooterView *doctorFooter;
@property (nonatomic,weak) LDHomeFooterView *hospitalFooter;
@property (nonatomic,weak) LDHomeFooterView *diseaseFooter;
@property (nonatomic,weak) LDHomeHeadView *homeHeader;

@end
@implementation PublicHomeController
- (NSMutableArray *)doctors
{
    if (_doctors == nil) {
        _doctors = [[NSMutableArray alloc] init];
    }
    return _doctors;
}
- (NSMutableArray *)hospitals
{
    if (_hospitals == nil) {
        _hospitals = [[NSMutableArray alloc] init];
    }
    return _hospitals;
}
- (NSMutableArray *)diseases
{
    if (_diseases == nil) {
        _diseases = [[NSMutableArray alloc] init];
    }
    return _diseases;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = IWColor(226, 226, 226);
    [self loadData];
    [self addCustomSubview];
    [self layoutCustomSubview];
    [self setupTableView];
    [self setNav];
//    [self setNotification];
    UISegmentedControl *seg = [UISegmentedControl appearance];
    [seg setTintColor:[UIColor grayColor]];
}
#pragma mark - 配置导航栏
- (void)setNav
{
    self.title = @"首页";
    //登录按钮
//    Account *acc = [AccountTool account];
//    if (acc == nil) {
        self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemwithImage:@"login_img" title:nil target:self action:@selector(loginBtnClicked)];
//    }
}
- (void)loginBtnClicked
{
    LoginViewController *login = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:login animated:YES];
}

- (void)segmentControlPressed:(UISegmentedControl *)segmentControl
{
    int index = (int)segmentControl.selectedSegmentIndex;
    switch (index) {
        case 0:
            [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
            break;
        case 1:
            [self.scrollView setContentOffset:CGPointMake(self.view.frame.size.width, 0) animated:YES];
            break;
        case 2:
            [self.scrollView setContentOffset:CGPointMake(2 * self.view.frame.size.width, 0) animated:YES];
            break;
        default:
            break;
    }
}
- (void)setupTableView
{
    self.doctorView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.doctorView.backgroundColor = IWColor(226, 226, 226);
    
    self.hospitalView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.hospitalView.backgroundColor = self.doctorView.backgroundColor;
    
    self.diseaseView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.diseaseView.backgroundColor = self.doctorView.backgroundColor;
}
- (void)loadData
{
    [HomeTool getRecommendDataWithParam:nil success:^(RecommendResult *result) {
        [self.doctors addObjectsFromArray:result.doctors];
        [self.hospitals addObjectsFromArray:result.hospitals];
        [self.diseases addObjectsFromArray:result.cases];
        
        [self.doctorView reloadData];
        [self.hospitalView reloadData];
        [self.diseaseView reloadData];
    } failure:^(NSError *error) {
        
    }];
}
#pragma mark - 添加子控件
- (void)addCustomSubview
{
    //添加顶部视图
    LDHomeHeadView *headerView = [[LDHomeHeadView alloc] init];
    headerView.delegate = self;
    [self.view addSubview:headerView];
    self.homeHeader = headerView;
    
    //添加segmentControl
    NSArray *items = @[@"推荐医生",@"推荐医院",@"常见病例"];
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:items];
    [segmentControl addTarget:self
                       action:@selector(segmentControlPressed:)
             forControlEvents:UIControlEventValueChanged];
    segmentControl.selectedSegmentIndex = 0;
    [self.view addSubview:segmentControl];
    self.segmentControl = segmentControl;
    
    //添加scrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    //添加三个tableview
    UITableView *doctorView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    doctorView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
    doctorView.delegate = self;
    doctorView.dataSource = self;
    [self.scrollView addSubview:doctorView];
    self.doctorView = doctorView;
    
    UITableView *hospitalView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    hospitalView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
    hospitalView.delegate = self;
    hospitalView.dataSource = self;
    [self.scrollView addSubview:hospitalView];
    self.hospitalView = hospitalView;
    
    UITableView *diseaseView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    diseaseView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
    diseaseView.dataSource = self;
    diseaseView.delegate = self;
    [self.scrollView addSubview:diseaseView];
    self.diseaseView = diseaseView;
    
}
- (void)layoutCustomSubview
{
    //顶部的imageview
    CGFloat headerX = 0;
    CGFloat headerY = 0;
    CGFloat headerW = self.view.frame.size.width;
    CGFloat headerH = 200;
    self.homeHeader.frame = CGRectMake(headerX , headerY , headerW, headerH);
    //选项卡
    CGFloat segmentX = headerX;
    CGFloat segmentY = CGRectGetMaxY(self.homeHeader.frame) + 45;
    CGFloat segmentW = headerW;
    CGFloat segmentH = 30;
    self.segmentControl.frame = CGRectMake(segmentX, segmentY, segmentW, segmentH);
    //滚动视图
    CGFloat scrollX = segmentX;
    CGFloat scrollY = CGRectGetMaxY(self.segmentControl.frame);
    CGFloat scrollW = segmentW;
    CGFloat scrollH = self.view.frame.size.height - scrollY;
    if ([AccountTool isLogin]) {
        
        scrollH -= self.tabBarController.tabBar.frame.size.height;
    }
    self.scrollView.frame = CGRectMake(scrollX, scrollY, scrollW, scrollH);
    
    self.scrollView.contentSize = CGSizeMake(3 * SCREENWIDTH, 0);
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
//    self.scrollView.backgroundColor = IWColor(226, 226, 226);
    self.scrollView.backgroundColor = [UIColor redColor];
    self.scrollView.bounces = NO;
    
    //推荐医生
    CGFloat hosX = 0;
    CGFloat hosY = 0;
    CGFloat hosW = scrollW;
    CGFloat hosH = scrollH;
    self.doctorView.frame = CGRectMake(hosX, hosY, hosW, hosH);
    //推荐医院
    CGFloat doctorX = SCREENWIDTH;
    CGFloat doctorY = hosY;
    CGFloat doctorW = hosW;
    CGFloat doctorH = hosH;
    self.hospitalView.frame = CGRectMake(doctorX, doctorY, doctorW, doctorH);
    //常见病例
    CGFloat patientX = 2 * SCREENWIDTH;
    CGFloat patientY = hosY;
    CGFloat patientW = SCREENWIDTH;
    CGFloat patientH = hosH;
    self.diseaseView.frame = CGRectMake(patientX, patientY, patientW, patientH);
}
#pragma mark - tableview 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableView isEqual:self.doctorView])
    {
        return self.doctors.count;
    }else if([tableView isEqual:self.hospitalView])
    {
        return self.hospitals.count;
    }else
    {
        return self.diseases.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     if ([tableView isEqual:self.doctorView])
    {
        DoctorCell *cell = [DoctorCell cellWithTableView:tableView];
        cell.doctor = self.doctors[indexPath.row];
        return cell;
    }else if([tableView isEqual:self.hospitalView])
    {
        HospitalCell *cell = [HospitalCell cellWithTableView:tableView];
        cell.hospital = self.hospitals[indexPath.row];
        return cell;
    }else
    {
        DiseaseCell *cell = [DiseaseCell cellWithTableView:tableView];
        cell.commonCase = self.diseases[indexPath.row];
        return cell;
    }
}
#pragma mark - tableview 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 40;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if ([tableView isEqual:self.doctorView]) {
        LDHomeFooterView *view = [[LDHomeFooterView alloc] init];
        [view setFooterTitle:@"更多医生"];
        view.delegate = self;
        self.doctorFooter = view;
        return view;
    }else if ([tableView isEqual:self.hospitalView])
    {
        LDHomeFooterView *hosFooter = [[LDHomeFooterView alloc] init];
        [hosFooter setFooterTitle:@"更多医院"];
        hosFooter.delegate = self;
        self.hospitalFooter = hosFooter;
        return hosFooter;
    }else
    {
        LDHomeFooterView *disFooter = [[LDHomeFooterView alloc] init];
        [disFooter setFooterTitle:@"更多病例"];
        disFooter.delegate = self;
        self.diseaseFooter = disFooter;
        return disFooter;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BOOL islogin = [AccountTool isLogin];
    if ([tableView isEqual:self.doctorView]) {
        if (islogin) {
            
            LoginDocDetailController *docVC = [[LoginDocDetailController alloc] init];
            docVC.doctor = self.doctors[indexPath.row];
            [self.navigationController pushViewController:docVC animated:YES];
        }else
        {
            DoctorDetailController *docVC = [[DoctorDetailController alloc] init];
            docVC.doctor = self.doctors[indexPath.row];
            [self.navigationController pushViewController:docVC animated:YES];
        }
    }else if ([tableView isEqual:self.hospitalView])
    {
        if (islogin) {
            LoginHosController *hos = [[LoginHosController alloc] init];
            hos.hospital = self.hospitals[indexPath.row];
            [self.navigationController pushViewController:hos animated:YES];
        }else
        {
            HosDetailController *hos = [[HosDetailController alloc] init];
            hos.hospital = self.hospitals[indexPath.row];
            [self.navigationController pushViewController:hos animated:YES];
        }
    }else if ([tableView isEqual:self.diseaseView])
    {
        
        CaseDetailController *caseVC = [[CaseDetailController alloc] init];
        caseVC.norcase = self.diseases[indexPath.row];
        [self.navigationController pushViewController:caseVC animated:YES];
    }
}
#pragma mark - footer delegate method
- (void)footerView:(LDHomeFooterView *)footerView clickedBtn:(UIButton *)button
{
    if ([footerView isEqual:self.doctorFooter]) {
        MoreDocController *moreDoc = [[MoreDocController alloc] init];
        [self.navigationController pushViewController:moreDoc animated:YES];
    }else if([footerView isEqual:self.hospitalFooter])
    {
        MoreHosController *moreHos = [[MoreHosController alloc] init];
        [self.navigationController pushViewController:moreHos animated:YES];
    }else
    {
        MoreCaseController *moreCase = [[MoreCaseController alloc] init];
        [self.navigationController pushViewController:moreCase animated:YES];
    }
}
#pragma mark - scrollView delegate method
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    CGFloat scrollW = scrollView.frame.size.width;
//    int page = (scrollView.contentOffset.x + scrollW * 0.5) / scrollW;
//    if (scrollView.contentOffset.y == 0) {
//        return;
//    }
//    self.segmentControl.selectedSegmentIndex = page;
//}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:self.scrollView]) {
        CGFloat scrollW = self.scrollView.frame.size.width;
        CGFloat offsetX = scrollView.contentOffset.x;
        if ( offsetX == 0 ) {
            self.segmentControl.selectedSegmentIndex = 0;
        }else if(offsetX == scrollW)
        {
            self.segmentControl.selectedSegmentIndex = 1;
        }else if(offsetX == 2 * scrollW)
        {
            self.segmentControl.selectedSegmentIndex = 2;
        }
    }
 
}
#pragma mark - header delegate method
- (void)headerView:(LDHomeHeadView *)headerView didClickedBtn:(UIButton *)button
{
     switch (button.tag) {
        case 3:
            [self changeController:[MultiJobController class]];
            break;
        case 4:
            [self changeController:[PostDoctorController class]];
            break;
        case 5:
            [self changeController:[RecruitMessageController class]];
            break;
        default:
            break;
    }
}
- (void)changeController:(Class)destClass
{
    UIViewController *controller = [[destClass alloc] init];
    [self.navigationController pushViewController:controller animated:NO];
}
@end








