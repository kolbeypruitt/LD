//
//  EnterViewController.m
//  邻医家
//
//  Created by Daniel on 15/5/18.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "DepartmentDelegate.h"
#import "AccountTool.h"
#define SCREENWIDTH  ([UIScreen mainScreen].bounds.size.width)
#import "MJExtension.h"
#import "Department.h"
#import "UIImage+MJ.h"
#import "EnterViewController.h"
#import "AFNetworking.h"
#import "IWCommon.h"
#import "WelcomeDosController.h"
#import "WelcomeHosController.h"
#import "WelcomePatientController.h"
@interface EnterViewController () <UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
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
    imageView.image = [UIImage imageWithName:@"test_2"];
    [self.view addSubview:imageView];
    self.topImageView = imageView;
    
    //选项卡
    NSArray *items = @[@"医院入驻",@"医生入驻",@"病友入驻"];
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
    
    //医院入驻tableview
    UITableView *hospitalEnter = [[UITableView alloc] init];
    hospitalEnter.delegate = self;
    hospitalEnter.dataSource = self;
    self.hospitalEnter = hospitalEnter;
    [self.scrollView addSubview:hospitalEnter];
    
    //医生入驻tableview
    UITableView *doctorEnter = [[UITableView alloc] init];
    doctorEnter.dataSource = self;
    doctorEnter.delegate = self;
    [self.scrollView addSubview:doctorEnter];
    self.doctorEnter = doctorEnter;
    
    //病友入驻
    UITableView *patientEnter = [[UITableView alloc] init];
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
    CGFloat imageY = 0;
    CGFloat imageW = self.view.frame.size.width;
    CGFloat imageH = 200;
    self.topImageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    //选项卡
    CGFloat segmentX = imageX;
    CGFloat segmentY = CGRectGetMaxY(self.topImageView.frame);
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
    if ([tableView isEqual:self.hospitalEnter]) {
        
    }else if([tableView isEqual:self.doctorEnter])
    {
        
    }else if([tableView isEqual:self.patientEnter])
    {
        
    }
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:self.hospitalEnter]) {
        
    }else if([tableView isEqual:self.doctorEnter])
    {
        
    }else if([tableView isEqual:self.patientEnter])
    {
        
    }
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"欢迎入驻 - %d",(int)indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([tableView isEqual:self.hospitalEnter]) {
        WelcomeHosController *hos = [[WelcomeHosController alloc] init];
        [self.navigationController pushViewController:hos animated:YES];
    }else if([tableView isEqual:self.doctorEnter])
    {
        WelcomeDosController *doc = [[WelcomeDosController alloc] init];
        [self.navigationController pushViewController:doc animated:YES];
    }else if([tableView isEqual:self.patientEnter])
    {
        WelcomePatientController *patient = [[WelcomePatientController alloc] init];
        [self.navigationController pushViewController:patient animated:YES];
    }
}
@end












