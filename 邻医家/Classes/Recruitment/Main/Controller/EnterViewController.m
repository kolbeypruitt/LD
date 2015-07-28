//
//  EnterViewController.m
//  邻医家
//
//  Created by Daniel on 15/5/18.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "DepartmentDelegate.h"
#import "AccountTool.h"
#import "MJExtension.h"
#import "Department.h"
#import "UIImage+MJ.h"
#import "EnterViewController.h"
#import "AFNetworking.h"
#import "Common.h"
#import "LDEnterCell.h"
#import "WelcomeDosController.h"
#import "WelcomeHosController.h"
#import "WelcomePatientController.h"
@interface EnterViewController () <UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak) UIButton *hosBtn;
@property (nonatomic,weak) UIButton *docBtn;
@property (nonatomic,weak) UIButton *patientBtn;
/**
 *  顶部图片
 */
@property (nonatomic,weak) UIImageView *topImageView;
/**
 *  底部滚动视图
 */
@property (nonatomic,weak) UIScrollView *scrollView;
/**
 *  中间选项卡
 */
@property (nonatomic,weak) UISegmentedControl *segmentControl;
/**
 *  医院入驻
 */
@property (nonatomic,weak) UITableView *hospitalEnter;
/**
 *   医生入驻
 */
@property (nonatomic,weak) UITableView *doctorEnter;
/**
 *  病友入驻
 */
@property (nonatomic,weak) UITableView *patientEnter;

@end

@implementation EnterViewController
- (NSMutableArray *)doctors
{
    if (_doctors == nil ) {
        _doctors = [NSMutableArray array];
    }
    return _doctors;
}
- (NSMutableArray *)hospitals
{
    if (_hospitals == nil) {
        _hospitals = [NSMutableArray array];
    }
    return _hospitals;
}
- (NSMutableArray *)patients
{
    if (_patients == nil) {
        _patients = [NSMutableArray array];
    }
    return _patients;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = IWColor(226, 226, 226);
    self.title = @"入驻";
    [self setupSubview];
}
/**
 *  配置子控件
 */
- (void)setupSubview
{
    [self addCustomSubView];
    [self layoutCustomSubView];
}
/**
 *  添加子控价
 */
- (void)addCustomSubView
{
    //顶部的imageview
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = [UIImage imageWithName:@"banner2"];
    [self.view addSubview:imageView];
    self.topImageView = imageView;
    
    //选项卡
    NSArray *items = @[@"医院入驻",@"医生入驻",@"医友入驻"];
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:items];
    [segmentControl addTarget:self action:@selector(segmentControlPressed:) forControlEvents:UIControlEventValueChanged];
    segmentControl.selectedSegmentIndex = 0;
    [self.view addSubview:segmentControl];
    self.segmentControl = segmentControl;
    
    //滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.delegate = self;
    scrollView.backgroundColor = IWColor(226, 226, 226);
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, 40);
    //医院入驻tableview
    UITableView *hospitalEnter = [[UITableView alloc] init];
    
    UIButton *hosBtn = [[UIButton alloc] initWithFrame:rect];
    [self setupBtn:hosBtn title:@"欢迎医院管理者入驻" target:self action:@selector(buttonClicked:)];
    hospitalEnter.tableHeaderView = hosBtn;
    self.hosBtn = hosBtn;
    
    hospitalEnter.delegate = self;
    hospitalEnter.dataSource = self;
    hospitalEnter.contentInset = UIEdgeInsetsMake(0, 0, 30, 0);
    hospitalEnter.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.hospitalEnter = hospitalEnter;
    [self.scrollView addSubview:hospitalEnter];
    
    //医生入驻tableview
    UITableView *doctorEnter = [[UITableView alloc] init];
    
    UIButton *docBtn = [[UIButton alloc] initWithFrame:rect];
    [self setupBtn:docBtn title:@"欢迎医生入驻" target:self action:@selector(buttonClicked:)];
    doctorEnter.tableHeaderView = docBtn;
    self.docBtn = docBtn;
    
    doctorEnter.dataSource = self;
    doctorEnter.delegate = self;
    doctorEnter.contentInset = UIEdgeInsetsMake(0, 0, 30, 0);
    doctorEnter.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.scrollView addSubview:doctorEnter];
    self.doctorEnter = doctorEnter;
    
    //病友入驻
    UITableView *patientEnter = [[UITableView alloc] init];
    
    UIButton *patientBtn = [[UIButton alloc] initWithFrame:rect];
    [self setupBtn:patientBtn title:@"欢迎医友入驻" target:self action:@selector(buttonClicked:)];
    patientEnter.tableHeaderView = patientBtn;
    self.patientBtn = patientBtn;
    patientEnter.contentInset = UIEdgeInsetsMake(0, 0, 30, 0);
    patientEnter.separatorStyle = UITableViewCellSeparatorStyleNone;
    patientEnter.delegate = self;
    patientEnter.dataSource =self;
    
    [self.scrollView addSubview:patientEnter];
    self.patientEnter = patientEnter;
}

/**
 *  调整子控件的frame
 */
- (void)layoutCustomSubView
{
    
    //顶部的imageview
    CGFloat imageX = 0;
    CGFloat imageY = 44;
    CGFloat imageW = self.view.frame.size.width;
    CGFloat imageH = 200;
    self.topImageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    //选项卡
    CGFloat segmentX = imageX;
    CGFloat segmentY = CGRectGetMaxY(self.topImageView.frame) - 13;
    CGFloat segmentW = imageW;
    CGFloat segmentH = 30;
    self.segmentControl.frame = CGRectMake(segmentX, segmentY, segmentW, segmentH);
    //滚动视图
    CGFloat scrollX = segmentX;
    CGFloat scrollY = CGRectGetMaxY(self.segmentControl.frame);
    CGFloat scrollW = segmentW;
    CGFloat scrollH = self.view.frame.size.height - scrollY;
    self.scrollView.frame = CGRectMake(scrollX, scrollY, scrollW, scrollH);
    
    self.scrollView.contentSize = CGSizeMake(3 * SCREENWIDTH, 0);
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.backgroundColor = IWColor(226, 226, 226);
    self.scrollView.bounces = NO;
    
    //医院入驻tableview
    CGFloat hosX = 0;
    CGFloat hosY = 0;
    CGFloat hosW = scrollW;
    CGFloat hosH = scrollH;
    self.hospitalEnter.frame = CGRectMake(hosX, hosY, hosW, hosH);
    //医生入驻
    CGFloat doctorX = SCREENWIDTH;
    CGFloat doctorY = hosY;
    CGFloat doctorW = hosW;
    CGFloat doctorH = hosH;
    self.doctorEnter.frame = CGRectMake(doctorX, doctorY, doctorW, doctorH);
    //病友入驻
    CGFloat patientX = 2 * SCREENWIDTH;
    CGFloat patientY = hosY;
    CGFloat patientW = SCREENWIDTH;
    CGFloat patientH = hosH;
    self.patientEnter.frame = CGRectMake(patientX, patientY, patientW, patientH);
}
#pragma mark - segmentcontrol 点击处理
- (void)segmentControlPressed:(UISegmentedControl *)seg
{
    switch (seg.selectedSegmentIndex) {
        case 0:
            [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
            break;
        case 1:
            [self.scrollView setContentOffset:CGPointMake(SCREENWIDTH, 0) animated:YES];
            break;
        case 2:
            [self.scrollView setContentOffset:CGPointMake(2 * SCREENWIDTH, 0) animated:YES];
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
        }
    }
}
#pragma mark - tableview delegate and datasource method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LDEnterCell *cell = [LDEnterCell cellWithTabelView:tableView];
    
    if ([tableView isEqual:self.hospitalEnter]) {
            cell.imageName = @"hospital_enter";
    }else if([tableView isEqual:self.doctorEnter])
    {
            cell.imageName = @"doctor_enter";
        
    }else
    {
            cell.imageName = @"patient_enter";
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:self.hospitalEnter]) {
        return 790;
    }else if([tableView isEqual:self.doctorEnter])
    {
        return 850;
    }else
    {
        return 460;
    }
}
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}
- (void)setupBtn:(UIButton *)button title:(NSString *)title target:(id)target action:(SEL)action
{
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:IWColor(88, 202, 203)];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    button.titleLabel.backgroundColor = [UIColor clearColor];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}
- (void)buttonClicked:(UIButton *)button
{
    if ([button isEqual:self.hosBtn]) {
        
        WelcomeHosController *hos = [[WelcomeHosController alloc] init];
        [self.navigationController pushViewController:hos animated:YES];
        
    }else if([button isEqual:self.docBtn])
    {
        
        WelcomeDosController *doc = [[WelcomeDosController alloc] init];
        [self.navigationController pushViewController:doc animated:YES];
        
    }else
    {
        
        WelcomePatientController *patient = [[WelcomePatientController alloc] init];
        [self.navigationController pushViewController:patient animated:YES];
        
    }
}
@end















