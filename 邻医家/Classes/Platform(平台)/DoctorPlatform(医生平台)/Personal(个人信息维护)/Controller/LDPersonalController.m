//
//  LDPersonalController.m
//  邻医家
//
//  Created by Daniel on 15/7/22.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDCheckView.h"
#import "UIBarButtonItem+ENTER.h"
#import "LDPersonalController.h"
#import "AssignmentTool.h"
#import "Arrangement.h"
@interface LDPersonalController ()
@property (nonatomic,strong) NSMutableString *totalString;
@end

@implementation LDPersonalController
- (NSMutableString *)totalString
{
    if (_totalString == nil) {
        _totalString = [NSMutableString string];
    }
    return _totalString;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(uploadArrangement) title:@"保存"];
    LDArrangement *arrangement = [AssignmentTool arrangement];
    [self loadMessage];
    self.arrangement = arrangement;
}
- (void)uploadArrangement
{
    if ([self messageComplete]) {
         
    }
}
- (void)loadMessage
{
    for (int i = 0; i < self.checkViews.count; i++) {
        LDCheckView *checkView = self.checkViews[i];
        [self.totalString appendString:[NSString stringWithFormat:@"%@;",checkView.checkMessage]];
    }
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([object isKindOfClass:[LDCheckView class]]) {
        LDCheckView *checkView = (LDCheckView *)object;
        [self updateTotalStingWithNewSting:checkView.checkMessage atIndex:checkView.tag];
    }
}
- (void)updateTotalStingWithNewSting:(NSString *)newString atIndex:(int)index
{
    
    NSRange range = NSMakeRange(index * (newString.length + 1),newString.length);
    [self.totalString replaceCharactersInRange:range withString:newString];
    NSLog(@"%@",self.totalString);
}

@end
