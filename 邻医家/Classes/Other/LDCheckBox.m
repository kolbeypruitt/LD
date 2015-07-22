//
//  LDCheckBox.m
//  CheckBox
//
//  Created by Daniel on 15/7/22.
//  Copyright (c) 2015年 ddd. All rights reserved.
//
#define GOLDSPLIT 0.618
#define BORDER 5
#define PADDING 5
#import "LDCheckBox.h"

@implementation LDCheckBox
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}
+ (instancetype)checkBox
{
    LDCheckBox *checkBox = [[LDCheckBox alloc] init];
    checkBox.bounds = CGRectMake(0, 0, 30, 30);
    return checkBox;
}
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //Set the background and border size attributes.
    [[UIColor lightGrayColor] setStroke];
    [[UIColor whiteColor] setFill];
    CGContextSetLineWidth(ctx, 2.0);
    
    //draw background
    CGContextFillRect(ctx, rect);
    
    //draw border
    CGContextStrokeRect(ctx, rect);
    
    //draw check
    
    if (self.isSelected) {
        CGContextMoveToPoint(ctx, BORDER,self.bounds.size.height * GOLDSPLIT);
        CGContextAddLineToPoint(ctx, self.bounds.size.width * (1 - GOLDSPLIT), self.bounds.size.height - PADDING);
        CGContextAddLineToPoint(ctx, self.bounds.size.width - BORDER, self.bounds.size.height * (1- GOLDSPLIT));
        
        CGContextSetLineWidth(ctx, 3.0);
        CGContextSetLineCap(ctx, kCGLineCapRound);
        CGContextSetLineJoin(ctx, kCGLineJoinRound);
        
        CGContextSetRGBStrokeColor(ctx, 88/255.0,  202/255.0,  203/255.0, 1.0);
        
        CGContextDrawPath(ctx, kCGPathStroke);
    }
    
}
- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.selected = !self.selected;
    [self setNeedsDisplay];
    return NO;
}
@end
