//
//  CareerDelegate.m
//  邻医家
//
//  Created by Daniel on 15/5/28.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "CareerDelegate.h"
#import "HospitalEnterTextField.h"
#import "LDEnterData.h"
@interface CareerDelegate ()
@property (nonatomic,copy) NSString *resultString;
@property (nonatomic,strong) NSMutableArray *professions;
@property (nonatomic,assign) int choosedID;
@end
@implementation CareerDelegate
- (NSMutableArray *)professions
{
    if (_professions == nil) {
         _professions = [NSMutableArray array];
        NSArray *tectitle =  @[@"医师",@"主管医师",@"副主任医师",@"主任医师",];
    for (int i = 0 ; i < tectitle.count; i++ ) {
            Career *career = [[Career alloc] init];
            career.Id = i + 1;
            career.techtitle = [tectitle objectAtIndex:i];
            [_professions addObject:career];
        }
    }
    return _professions;
    
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.professions.count;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 200;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.professions[row] techtitle];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.resultString = [self.professions[row] techtitle];
    self.choosedID = [self.professions[row] Id];
}
- (void)actionSheetPickerDidSucceed:(AbstractActionSheetPicker *)actionSheetPicker origin:(id)origin
{
    if ([origin isKindOfClass:[HospitalEnterTextField  class]]) {
        HospitalEnterTextField *textfield = (HospitalEnterTextField *)origin;
        if (self.resultString == nil) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"请选择临床职称" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
            return;
        }
        textfield.enterData.techtile = self.choosedID;
        textfield.text = self.resultString;
    }else if ([origin isKindOfClass:[UITextField class]])
    {
        UITextField *textfield = (UITextField *)origin;
        if (self.resultString == nil) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"请选择临床职称" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
            return;
        }
        textfield.tag = self.choosedID;
        textfield.text = self.resultString;
    }
}
@end
@implementation Career

@end