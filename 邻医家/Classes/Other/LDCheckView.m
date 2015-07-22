//
//  LDCheckView.m
//  邻医家
//
//  Created by Daniel on 15/7/22.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDCheckBox.h"
#import "LDCheckView.h"
#import <stdio.h>
#import <stdlib.h>
@interface LDCheckView ()
{
    int _bitMsg;
}
@property (nonatomic,assign) int countOfBox;
@property (nonatomic,strong) NSMutableArray *checkBoxes;
@end
@implementation LDCheckView

- (NSMutableArray *)checkBoxes
{
    if (_checkBoxes == nil) {
        _checkBoxes = [NSMutableArray array];
    }
    return _checkBoxes;
}

//- (instancetype)init
//{
//    if (self = [super init]) {
//        self.countOfBox = 14;
//        [self addBoxes];
//    }
//    return self;
//}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _bitMsg = 0;
        self.countOfBox = 14;
        _checkMessage = [self print_int_bit:_bitMsg sizeToPrint:14];
        [self addBoxes];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        _bitMsg = 0;
        self.countOfBox = 14;
        [self addBoxes];
    }
    return self;
}
- (void)addBoxes
{
    for (int i = 0 ; i < self.countOfBox; i++ ) {
        LDCheckBox *box = [LDCheckBox checkBox];
        box.tag = i;
        [box addObserver:self forKeyPath:@"selected" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
        [self addSubview:box];
        [self.checkBoxes addObject:box];
    }
}
- (void)dealloc
{
    for (int i = 0; i < self.checkBoxes.count; i++) {
        LDCheckBox *box = self.checkBoxes[i];
        [box removeObserver:self forKeyPath:@"selected"];
    }
}
- (void)layoutSubviews
{
    static const int padding  = 20;
    [super layoutSubviews];
    CGFloat boxX = 0;
    CGFloat boxY = 0;
    CGFloat boxW = 30;
    CGFloat boxH = 30;
    for (int i = 0 ; i < self.subviews.count; i++) {
        LDCheckBox *box = self.subviews[i];
        
        boxY = padding + (boxH + padding) * i;
        
        box.frame = CGRectMake(boxX, boxY, boxW, boxH);
    }
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([object isKindOfClass:[LDCheckBox class]]) {
        LDCheckBox *box = (LDCheckBox *)object;
        [self changBit:[change[@"new"] intValue]atIndex:box.tag];
    }
}
//0,0,0,0,0,0,0,0,0,0,0,0,0,0;
//0,0,0,0,0,0,0,0,0,0,0,0,0,0;
//0,0,0,0,0,0,0,0,0,0,0,0,0,0;
//0,0,0,0,0,0,0,0,0,0,0,0,0,0;
//0,0,0,0,0,0,0,0,0,0,0,0,0,0;
//0,0,0,0,0,0,0,0,0,0,0,0,0,0
- (NSString *)print_int_bit:(int)num sizeToPrint:(int)size
{
    NSMutableString *string = [NSMutableString string];
    unsigned int length = 4 * sizeof(num);
    unsigned int index = (1 << (length - 1));
    if ( (length > size) && (size > 0) ) {
        index = (1 << (size - 1));
    }
    while ( index > 0 ) {
        [string appendString:[NSString stringWithFormat:@"%d,",(num & index) ? 1 : 0]];
        index >>= 1;
    }
    [string deleteCharactersInRange:NSMakeRange(string.length - 1, 1)];
    return string;
}
- (void)changBit:(int)new atIndex:(int)index
{
    if(new == 1)
    {//打开index位
        int tmp = 1;
        tmp = tmp << (13 -index);
        _bitMsg = _bitMsg | tmp;
    }else
    {//关闭index位
        int tmp = 16383;
        int mid = 1;
        mid = mid << (13 - index);
        tmp = tmp ^ mid;
        _bitMsg = _bitMsg & tmp;
    }
    self.checkMessage =  [[self print_int_bit:_bitMsg sizeToPrint:14] copy];
}
@end

