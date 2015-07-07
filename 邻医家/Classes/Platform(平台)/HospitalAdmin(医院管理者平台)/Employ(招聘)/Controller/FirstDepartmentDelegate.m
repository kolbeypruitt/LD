//
//  FirstDepartmentDelegate.m
//  邻医家
//
//  Created by Daniel on 15/7/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "HospitalEnterTextField.h"
#import "FirstDepartmentDelegate.h"
#import "LDEnterData.h"
#import "Department.h"
#import "MJExtension.h"
@interface FirstDepartmentDelegate ()
@property (nonatomic,strong) Department *selectedDepartment;
@end
@implementation FirstDepartmentDelegate
- (NSArray *)departments
{
    if (_departments == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"department.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        _departments =[Department objectArrayWithKeyValuesArray:dict[@"departments"]];
    }
    return _departments;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.departments.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.departments[row] name];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.selectedDepartment = self.departments[row];
}
- (void)actionSheetPickerDidSucceed:(AbstractActionSheetPicker *)actionSheetPicker origin:(id)origin
{
    if([origin isKindOfClass:[HospitalEnterTextField class]])
    {
        HospitalEnterTextField *textfield = (HospitalEnterTextField *)origin;
        textfield.text = [self.selectedDepartment name];
        textfield.enterData.department = [self.selectedDepartment id];
    }
}
@end
