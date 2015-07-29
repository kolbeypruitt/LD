//
//  DepartmentDelegate.m
//  邻医家
//
//  Created by Daniel on 15/5/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDNotification.h"
#import "HospitalEnterTextField.h"
#import "DepartmentDelegate.h"
#import "LDEnterData.h"
#import "SecondClass.h"
#import "Department.h"
#import "MBProgressHUD+MJ.h"
#import "MJExtension.h"

@interface DepartmentDelegate () 
@property (nonatomic,copy) NSString *firstContent;
@property (nonatomic,copy) NSString *secondContent;
@property (nonatomic,assign) int choosedId;
@end
@implementation DepartmentDelegate
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
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger firstColumnrow = [pickerView selectedRowInComponent:0];
    NSInteger secondeCount = [self.departments[firstColumnrow] secondClass].count;
    switch (component) {
        case 0:
            return self.departments.count;
            break;
        case 1:
            return secondeCount;
            break;
        default:
            break;
    }
    return 0;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    switch (component) {
        case 0 : return 160.0f;
        case 1 : return 260.0f;
        default:
            break;
    }
    return 0;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSInteger firstColumnrow = [pickerView selectedRowInComponent:0];
    NSArray *second =[self.departments[firstColumnrow] secondClass];
    switch (component) {
        case 0: return [self.departments[row] name];
        case 1: return [second[row] name];
        default: break;
    }
    return nil;
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSInteger firstColumnrow = [pickerView selectedRowInComponent:0];
    NSArray *second =[self.departments[firstColumnrow] secondClass];
    switch (component) {
        case 0:
            [pickerView reloadComponent:1];
           self.firstContent = [self.departments[row] name];
            break;
           case 1:
            self.secondContent = [second[row] name];
            self.choosedId = [second[row] Id];
        default:
            break;
    }
       
}
- (void)actionSheetPickerDidSucceed:(AbstractActionSheetPicker *)actionSheetPicker origin:(id)origin
{
    if ([origin isKindOfClass:[UITextField class]]) {
        
        if (![self cityChoosed]) {
            return;
        }
        
        UITextField *textfield = (UITextField *)origin;
        textfield.text = [NSString stringWithFormat:@"%@ %@",self.firstContent,self.secondContent];
        textfield.tag = self.choosedId;
    }else if([origin isKindOfClass:[HospitalEnterTextField class]])
    {
        HospitalEnterTextField *textfield = (HospitalEnterTextField *)origin;
        if (![self cityChoosed]) {
            return;
        }
        textfield.text = [NSString stringWithFormat:@"%@ %@",self.firstContent,self.secondContent];
        textfield.enterData.department = self.choosedId;
    }else if([origin isKindOfClass:[UIButton class]])
    {
        
        if (![self cityChoosed]) {
            return;
        }
        
        UIButton *button = (UIButton *)origin;
        button.tag = self.choosedId;
        NSDictionary *usrInfo = @{@"department" : [NSNumber numberWithInt:self.choosedId],@"depName" : self.secondContent};
        [[NSNotificationCenter defaultCenter] postNotificationName:DEPARTMENTCHOOSEDNOTIFICATION object:self userInfo:usrInfo];
    }
}
- (BOOL)cityChoosed
{
        if (self.firstContent.length == 0) {
            UIAlertView *alerview = [[UIAlertView alloc] initWithTitle:@"" message:@"请选择一级科室" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alerview show];
            return NO;
        }
        if (self.secondContent.length == 0) {
            UIAlertView *alerview = [[UIAlertView alloc] initWithTitle:@"" message:@"请选择二级科室" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alerview show];
            return NO;
        }
    return YES;
    
}
@end
