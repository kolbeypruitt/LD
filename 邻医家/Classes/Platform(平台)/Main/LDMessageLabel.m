//
//  LDMessageLabel.m
//  DW_CircularSlider
//
//  Created by SXQ on 15/7/12.
//  Copyright (c) 2015年 SXQ. All rights reserved.
//

#import "LDMessageLabel.h"
@interface LDMessageLabel ()
@end
@implementation LDMessageLabel
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor grayColor];
        [self addTwoLabel];
        [self layoutTwoLabel];
    }
    return self;
}
- (void)addTwoLabel
{
    UILabel *firstLabel = [[UILabel alloc] init];
    firstLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:firstLabel];
    firstLabel.backgroundColor = [UIColor whiteColor];
    self.firstLabel = firstLabel;
    
    UILabel *secondLabel = [[UILabel alloc] init];
    secondLabel.numberOfLines = 0;
    secondLabel.translatesAutoresizingMaskIntoConstraints = NO;
    secondLabel.backgroundColor = [UIColor redColor];
    [self addSubview:secondLabel];
    self.secondLabel = secondLabel;
}
- (void)layoutTwoLabel
{
    NSDictionary *views = @{@"firstLabel" : self.firstLabel ,@"secondLabel" : self.secondLabel};
    
    NSArray *conts = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[firstLabel(120)]-10-[secondLabel]-10-|"
                                                             options:NSLayoutFormatAlignAllTop
                                                             metrics:nil
                                                               views:views];
    NSArray *conts2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[firstLabel(30)]"
                                                              options:0
                                                              metrics:nil
                                                                views:views];
    [self addConstraints:conts];
    [self addConstraints:conts2];
    CGSize parentSize = self.bounds.size;
    CGSize secondSize = self.secondLabel.bounds.size;
    NSLog(@"%@,%@",NSStringFromCGSize(parentSize),NSStringFromCGSize(secondSize));
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect frame = self.frame;
    CGSize parentSize = self.bounds.size;
    CGSize secondSize = self.secondLabel.bounds.size;
    parentSize.height = secondSize.height + 20;
    frame.size = parentSize;
    self.frame = frame;
}
@end
