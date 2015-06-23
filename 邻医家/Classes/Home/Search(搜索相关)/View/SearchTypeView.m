//
//  SearchTypeView.m
//  邻医家
//
//  Created by Daniel on 15/6/23.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "SearchTypeView.h"
#import "HotDepmentView.h"
#import "Common.h"
#import "HotAreaView.h"
#import "TopExpertView.h"
@interface SearchTypeView ()<UIScrollViewDelegate>
/**
 *  选项卡
 */
@property (nonatomic,weak) UISegmentedControl *segmentControl;

@end
@implementation SearchTypeView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        [self addCustomViews];
    }
    return self;
}
- (void)setLocations:(NSArray *)locations
{
    _locations = locations;
    self.hotAreaView.locations = locations;
    
}
- (void)addCustomViews
{
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"热门地区",@"热门科室",@"重要专家"]];
    segmentControl.selectedSegmentIndex = 0;
    [segmentControl addTarget:self action:@selector(segmentControlPressed:) forControlEvents:UIControlEventValueChanged];
    self.segmentControl = segmentControl;
    [self addSubview:segmentControl];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.delegate = self;
    self.scrollView = scrollView;
    [self addSubview:scrollView];
    
    HotAreaView *hotAreaView = [[HotAreaView alloc] init];
    self.hotAreaView  = hotAreaView;
    [self.scrollView addSubview:hotAreaView];
    
    HotDepmentView *hotDepView = [[HotDepmentView alloc] init];
    self.hotDepView = hotDepView;
    [self.scrollView addSubview:hotDepView];
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
        default:
            break;
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
 
    //选项卡
    CGFloat segX = 0;
    CGFloat segY = 0;
    CGFloat segW = SCREENWIDTH;
    CGFloat segH = 30;
    self.segmentControl.frame = CGRectMake(segX, segY, segW, segH);
    
    //滚动视图
    CGFloat scrollX = segX;
    CGFloat scrollY = CGRectGetMaxY(self.segmentControl.frame);
    CGFloat scrollW = SCREENWIDTH;
    CGFloat scrollH = self.frame.size.height - scrollY;
    self.scrollView.frame = CGRectMake(scrollX, scrollY, scrollW, scrollH);
    
    self.scrollView.contentSize = CGSizeMake(3 * SCREENWIDTH, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.backgroundColor = IWColor(226, 226, 226);
    self.scrollView.bounces = NO;
    
    //热门地区
    CGFloat hotAreaX = 0;
    CGFloat hotAreaY = 0;
    CGFloat hotAreaW = SCREENWIDTH;
    CGFloat hotAreaH = scrollH;
    self.hotAreaView.frame = CGRectMake(hotAreaX, hotAreaY, hotAreaW, hotAreaH);
    
    //热门科室
    CGFloat hotdepX = SCREENWIDTH;
    CGFloat hotdepY = hotAreaY;
    CGFloat hotdepW = SCREENWIDTH;
    CGFloat hotdepH = hotAreaH;
    self.hotDepView.frame = CGRectMake(hotdepX, hotdepY, hotdepW, hotdepH);
    
    //病例
    CGFloat topX = 2 *SCREENWIDTH;
    CGFloat topY = hotdepY;
    CGFloat topW = SCREENWIDTH;
    CGFloat topH = hotdepH;
    self.topExpertView.frame = CGRectMake(topX, topY, topW, topH);
    
}
@end



















