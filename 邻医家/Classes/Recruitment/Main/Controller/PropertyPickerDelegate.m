//
//  PropertyPickerDelegate.m
//  邻医家
//
//  Created by Daniel on 15/5/20.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "HospitalLevel.h"
#import "PropertyPickerDelegate.h"
#import "MJExtension.h"
#import "HospitalEnterTextField.h"
#import "LDEnterData.h"
@interface PropertyPickerDelegate ()
@property (nonatomic,strong) NSArray *properties;
@property (nonatomic,weak) NSString *seletedZone;
@property (nonatomic,assign) int choosedHospitalId;
@end
@implementation PropertyPickerDelegate
- (NSArray *)properties
{
    if (_properties == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"property.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        _properties = [HospitalLevel objectArrayWithKeyValuesArray:dict[@"levels"]];
    }
    return _properties;
}
#pragma mark - UIPickerViewDataSource Implementtation
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.properties.count;
}
- (CGFloat )pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
        return 160.0f;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.properties[row] name];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.seletedZone = [self.properties[row] name];
    self.choosedHospitalId = [self.properties[row] ID];
}

/////////////////////////////////////////////////////////////////////////
#pragma mark - ActionSheetCustomPickerDelegate Optional's 
/////////////////////////////////////////////////////////////////////////
- (void)configurePickerView:(UIPickerView *)pickerView
{
    // Override default and hide selection indicator
    pickerView.showsSelectionIndicator = NO;
}

- (void)actionSheetPickerDidSucceed:(AbstractActionSheetPicker *)actionSheetPicker origin:(id)origin
{
    if ([origin isKindOfClass:[UIButton class]]) {
        [origin setTitle:self.seletedZone forState:UIControlStateNormal];
    }else if([origin isKindOfClass:[HospitalEnterTextField class]])
    {
        if (self.seletedZone == nil) {
            UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"" message:@"请选择医院等级" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alerView show];
            return;
        }
        HospitalEnterTextField *textField = (HospitalEnterTextField *)origin;
        textField.text = self.seletedZone;
        textField.enterData.hospitalLevel = self.choosedHospitalId;
    }
}
@end
