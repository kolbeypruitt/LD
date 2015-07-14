//
//  ZonePickerDelegate.m
//  邻医家
//
//  Created by Daniel on 15/5/20.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "ZonePickerDelegate.h"
#import "HospitalEnterTextField.h"
#import "LDEnterData.h"
#import "Province.h"
#import "MJExtension.h"
#import "City.h"
#import "MBProgressHUD+MJ.h"
#import "Common.h"
#import "LDNotification.h"
@interface ZonePickerDelegate ()
@property (nonatomic,copy) NSString *selectedProvince;
@property (nonatomic,copy) NSString *selectedCity;
@property (nonatomic,strong) City *choosedCity;
@property (nonatomic,strong) NSArray *provinces;
@end
@implementation ZonePickerDelegate
- (NSArray *)provinces
{
    if (_provinces == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"city.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        _provinces = [Province objectArrayWithKeyValuesArray:dict[@"provinces"]];
     
    }
    return _provinces;
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - UIPickerViewDataSource Implementtation
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger citiesCount = [self.provinces[[pickerView selectedRowInComponent:0]] cities].count;
    switch (component) {
        case 0:
            return self.provinces.count;
            break;
        case 1:
            return citiesCount;
        default:
            break;
    }
    return 0;
}
- (CGFloat )pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    switch (component) {
        case 0: return 160.0f;
        case 1: return 260.0f;
        default:break;
    }
    
    return 0;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray *cities = [self.provinces[[pickerView selectedRowInComponent:0]] cities];
    switch (component) {
        case 0: return [self.provinces[row] name];
        case 1: return [cities[row] name];
        default:break;
    }
    return nil;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSArray *cities = [self.provinces[[pickerView selectedRowInComponent:0]] cities];
    switch (component) {
        case 0:
            [pickerView reloadComponent:1];
            self.selectedProvince = [self.provinces[row] name];
            return;
            
        case 1:
            self.selectedCity = [cities[row] name];
            self.choosedCity = cities[row];
            return;
        default:break;
    }
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
        NSDictionary *userInfo = @{@"cityId" : [NSNumber numberWithInt:self.choosedCity.id]};
        [DefaultCenter postNotificationName:MORECITYCHOOSEDNOTIFICATION object:self userInfo:userInfo];
    }else if([origin isKindOfClass:[HospitalEnterTextField class]])
    {
        if (self.selectedProvince.length == 0) {
            UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"" message:@"请选择省份" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertview show];
            return;
        }
        if (self.selectedCity.length == 0 ) {
            
            UIAlertView *alertview2 = [[UIAlertView alloc] initWithTitle:@"" message:@"请选择城市" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertview2 show];
            return;
        }
        if (self.selectedProvince && self.selectedCity ) {
            HospitalEnterTextField *textfield = (HospitalEnterTextField *)origin;
            textfield.text = [NSString stringWithFormat:@"%@ %@",self.selectedProvince,self.selectedCity];
            textfield.placeholder = [NSString stringWithFormat:@"%d",self.choosedCity.id];
            textfield.enterData.hospitalLocation = self.choosedCity.id;
        }
    }else if([origin isKindOfClass:[UITextField class]])
    {
        UITextField *textfield = (UITextField *)origin;
        textfield.text = [NSString stringWithFormat:@"%@ %@",self.selectedProvince,self.selectedCity];
        textfield.tag = self.choosedCity.id;
    }
}
@end
