//
//  LDPaperDetailController.m
//  邻医家
//
//  Created by Daniel on 15/6/26.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDPaperDetailController.h"
#import "UILabel+LD.h"
#import "LDPaper.h"
#import "Common.h"
@interface LDPaperDetailController ()
@property (nonatomic,weak) UILabel *introLabel;
@end

@implementation LDPaperDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setPaper:(LDPaper *)paper
{
    _paper = paper;
    [self addCustomViews];
    self.introLabel.text = paper.introduction;
}
- (void)setup
{
    self.navigationItem.rightBarButtonItem = nil;
    self.navigationItem.title = self.paper.title;
    self.view.backgroundColor = BGCOLOR;
}
- (void)addCustomViews
{
    UILabel *introLabel = [UILabel labelWithTitle:nil font:14 textColor:[UIColor blackColor]];
    introLabel.numberOfLines = 0;
    self.introLabel = introLabel;
    [self.view addSubview:introLabel];
    [self layoutCustomViews];
}
- (void)layoutCustomViews
{
    CGFloat padding = 10;
    CGFloat introX = padding;
    CGFloat introY = 64 + padding;
    CGFloat introW = SCREENWIDTH - 2 * padding;
    NSDictionary *attributes = @{NSFontAttributeName : self.introLabel.font};
    CGRect rect = [self.paper.introduction boundingRectWithSize:CGSizeMake(introW, MAXFLOAT)
                                                        options:NSStringDrawingUsesLineFragmentOrigin
                                                     attributes:attributes context:nil];
    CGSize size = rect.size;
    self.introLabel.frame = (CGRect){{introX,introY},size};
}

@end
