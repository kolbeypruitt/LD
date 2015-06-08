//
//  LDTextView.h
//  邻医家
//
//  Created by Daniel on 15/5/22.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDTextView : UITextView
@property (nonatomic,copy) NSString *placeholder;
- (void)showPlaceHolder:(BOOL)show;
@end
