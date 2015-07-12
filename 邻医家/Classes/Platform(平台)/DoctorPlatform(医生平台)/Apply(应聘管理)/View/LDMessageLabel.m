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

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.backgroundColor = [UIColor whiteColor];
        self.singleLine = YES;
        [self addTwoLabel];
        [self layoutTwoLabel];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addTwoLabel];
        [self layoutTwoLabel];
    }
    return self;
}
- (void)addTwoLabel
{
    UILabel *firstLabel = [[UILabel alloc] init];
    firstLabel.translatesAutoresizingMaskIntoConstraints = NO;
    firstLabel.numberOfLines = 1;
    [self addSubview:firstLabel];
    firstLabel.textAlignment = NSTextAlignmentRight;
    firstLabel.backgroundColor = [UIColor clearColor];
    firstLabel.textColor = [UIColor blueColor];
    firstLabel.font = [UIFont systemFontOfSize:15];
    self.firstLabel = firstLabel;
    
    UILabel *secondLabel = [[UILabel alloc] init];
    secondLabel.font = [UIFont systemFontOfSize:15];
    secondLabel.backgroundColor = [UIColor clearColor];
    secondLabel.textColor = [UIColor blackColor];
    secondLabel.numberOfLines = 1;
    secondLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:secondLabel];
    self.secondLabel = secondLabel;
}
- (void)layoutTwoLabel
{
    NSDictionary *views = @{@"firstLabel" : self.firstLabel ,@"secondLabel" : self.secondLabel};
    
    NSArray *conts = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[firstLabel(80)]-10-[secondLabel]-10-|"
                                                             options:0
                                                             metrics:nil
                                                               views:views];
    NSArray *conts2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[firstLabel]"
                                                              options:0
                                                              metrics:nil
                                                                views:views];
    NSArray *conts3  = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[secondLabel]" options:0 metrics:nil views:views];
    [self addConstraints:conts];
    [self addConstraints:conts2];
    [self addConstraints:conts3];
    CGSize parentSize = self.bounds.size;
    CGSize secondSize = self.secondLabel.bounds.size;
    NSLog(@"%@,%@",NSStringFromCGSize(parentSize),NSStringFromCGSize(secondSize));
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.isSingleLine) {
        return;
    }
    CGRect frame = self.frame;
    CGSize parentSize = self.bounds.size;
    CGSize secondSize = self.secondLabel.bounds.size;
    parentSize.height = secondSize.height + 20;
    frame.size = parentSize;
    self.frame = frame;
}
- (void)setSingleLine:(BOOL)singleLine
{
    _singleLine = singleLine;
    if (singleLine) {
        self.secondLabel.numberOfLines = 1;
        self.firstLabel.numberOfLines = 1;
    }else
    {
        self.secondLabel.numberOfLines = 0;
        self.firstLabel.numberOfLines = 0;
    }
}
@end











