//
//  RecruitHeader.m
//  邻医家
//
//  Created by Daniel on 15/4/30.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#define SEGMENTBORDER 70
#import "IWCommon.h"
#import "RecruitHeader.h"
#import "UIImage+MJ.h"
@interface RecruitHeader ()
@property (nonatomic,weak) UISearchBar *searchBar;
@property (nonatomic,weak) UISegmentedControl *segmentControl;
@end
@implementation RecruitHeader
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.backgroundColor = IWColor(226, 226, 226);
        //添加搜索框
        UISearchBar *searchBar = [[UISearchBar alloc] init];
        [self addSubview:searchBar];
        self.searchBar = searchBar;
        
        //添加分割栏
        UISegmentedControl *segmentControl = [[UISegmentedControl alloc] init];
        [segmentControl insertSegmentWithTitle:@"按地区" atIndex:0 animated:NO];
        [segmentControl insertSegmentWithTitle:@"按科室" atIndex:1 animated:NO];
        [segmentControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:segmentControl];
        self.segmentControl = segmentControl;
    }
    return self;
}
- (void)segmentAction:(UISegmentedControl *)seg
{
        if ([self.delegate respondsToSelector:@selector(header:didSelectedSegment:)]) {
            [self.delegate header:self didSelectedSegment:seg];
        }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat searcheBarX = 0;
    CGFloat searcheBarY = 5;
    CGFloat searcheBarWidth = self.frame.size.width;
    CGFloat searcheBarHeight = 30;
    self.searchBar.frame = CGRectMake(searcheBarX, searcheBarY, searcheBarWidth, searcheBarHeight);
    
    CGFloat segmentWidth = self.frame.size.width - 2 * SEGMENTBORDER;
    CGFloat segmentHeight = 30;
    CGFloat segmentX = SEGMENTBORDER;
    CGFloat segmentY = CGRectGetMaxY(self.searchBar.frame) + 10;
    self.segmentControl.frame = CGRectMake(segmentX, segmentY, segmentWidth, segmentHeight);

    CGRect frame = self.frame;
    frame.size.height = CGRectGetMaxY(self.segmentControl.frame) + 8;
    self.frame = frame;
}
@end











