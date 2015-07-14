//
//  OneOfTwoDelegate.m
//  邻医家
//
//  Created by Daniel on 15/6/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "HospitalEnterTextField.h"
#import "OneOfTwoDelegate.h"
#import "LDEnterData.h"
#import "MBProgressHUD+MJ.h"
@interface OneOfTwoDelegate ()
@property (nonatomic,strong) Choice *selectedChoice;
@end
@implementation OneOfTwoDelegate
- (NSMutableArray *)choices
{
    if (_choices == nil) {
        _choices = [NSMutableArray array];
    }
    return _choices;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.choices.count;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 200.0f;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.choices[row] name];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.selectedChoice = self.choices[row];
}
- (void)actionSheetPickerDidSucceed:(AbstractActionSheetPicker *)actionSheetPicker origin:(id)origin
{
    if ([origin isKindOfClass:[HospitalEnterTextField class]]) {
        HospitalEnterTextField *textfield = (HospitalEnterTextField *)origin;
        textfield.text = self.selectedChoice.name;
        textfield.enterData.isvip = self.selectedChoice.type;
        textfield.enterData.ishospital = self.selectedChoice.type;
        textfield.enterData.gender = self.selectedChoice.type;
    }else if([origin isKindOfClass:[UITextField class]])
    {
        UITextField *textField = (UITextField *)origin;
        textField.text = self.selectedChoice.name;
        textField.tag = self.selectedChoice.type;
    }
}
@end
@implementation Choice
+ (instancetype)choiceWithName:(NSString *)name type:(int)type
{
    Choice *cho = [[Choice alloc] init];
    cho.name = name;
    cho.type = type;
    return cho;
}
@end