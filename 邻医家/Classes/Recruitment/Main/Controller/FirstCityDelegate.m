//
//  FirstCityDelegate.m
//  邻医家
//
//  Created by Daniel on 15/7/29.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Province.h"
#import "MJExtension.h"
#import "City.h"
#import "MBProgressHUD+MJ.h"
#import "Common.h"
#import "LDNotification.h"
#import "FirstCityDelegate.h"
@interface FirstCityDelegate ()
@property (nonatomic,copy) NSString *selectedProvince;
@property (nonatomic,strong) Province *choosedProvince;
@property (nonatomic,strong) NSArray *provinces;
@end
@implementation FirstCityDelegate
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
#pragma mark - UIPickerViewDataSource Implementtation
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.provinces.count;
}
- (CGFloat )pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 160.0f;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return [self.provinces[row] name];
      
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    self.selectedProvince = [self.provinces[row] name];
    self.choosedProvince = self.provinces[row];
    
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
     if([origin isKindOfClass:[UITextField class]])
    {
        UITextField *textfield = (UITextField *)origin;
        textfield.text = [NSString stringWithFormat:@"%@",self.selectedProvince];
        textfield.tag = self.choosedProvince.id;
    }
}
@end
