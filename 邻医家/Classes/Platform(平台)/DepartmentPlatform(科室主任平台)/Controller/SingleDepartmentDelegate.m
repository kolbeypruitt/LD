//
//  SingleDepartmentDelegate.m
//  邻医家
//
//  Created by Daniel on 15/6/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "SingleDepartmentDelegate.h"
#import "HospitalEnterTextField.h"
#import "LDEnterData.h"
#import "SecondClass.h"
#import "Department.h"
#import "MBProgressHUD+MJ.h"
#import "MJExtension.h"
#import "Department.h"
#import "Account.h"
#import "AccountTool.h"
@interface SingleDepartmentDelegate ()
@property (nonatomic,strong) NSArray *secondDepartments;
@property (nonatomic,copy) NSString *secondDepartment;
@property (nonatomic,assign) int firstDepartment;
@property (nonatomic,assign) int secondDepartmentId;
@end
@implementation SingleDepartmentDelegate
- (int)firstDepartment
{
        Account *acco =  [AccountTool account];
        int department = [[acco department] intValue];
        _firstDepartment = department;
    return _firstDepartment;
}
- (NSArray *)secondDepartments
{
    if (_secondDepartments == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"department.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray *departments =[Department objectArrayWithKeyValuesArray:dict[@"departments"]];
        for (Department *dep in departments) {
            if (dep.Id == self.firstDepartment) {
                _secondDepartments = [dep secondClass];
            }
        }
        
    }
    return _secondDepartments;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.secondDepartments.count;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 200;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.secondDepartments[row] name];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.secondDepartment = [self.secondDepartments[row] name];
    self.secondDepartmentId = [self.secondDepartments[row] Id];
}
- (void)actionSheetPickerDidSucceed:(AbstractActionSheetPicker *)actionSheetPicker origin:(id)origin
{
    if ([origin isKindOfClass:[UIButton class]]) {
        if (self.secondDepartment.length) {
            UIButton *button = (UIButton *)origin;
            [button setTitle:self.secondDepartment forState:UIControlStateNormal];
        }
    }else if([origin isKindOfClass:[HospitalEnterTextField class]])
    {
        HospitalEnterTextField *textfield = (HospitalEnterTextField *)origin;
        if (self.secondDepartment.length == 0) {
            UIAlertView *alerview = [[UIAlertView alloc] initWithTitle:@"" message:@"请选择二级科室" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alerview show];
            return;
        }
        textfield.text = [NSString stringWithFormat:@"%@",self.secondDepartment];
        textfield.enterData.department = self.secondDepartmentId;
    }
}
@end
