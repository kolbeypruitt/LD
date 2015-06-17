//
//  WelcomeDosController.m
//  邻医家
//
//  Created by Daniel on 15/5/20.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "DoctorTabbarController.h"
#import "LDFormData.h"
#import "BaseResult.h"
#import "ZonePickerDelegate.h"
#import "ReviewController.h"
#import "LDEnterData.h"
#import "DoctorEnterParam.h"
#import "DepartmentDelegate.h"
#import "PropertyPickerDelegate.h"
#import "WelcomeDosController.h"
#import "ActionSheetCustomPicker+LD.h"
#import "IWCommon.h"
#import "MBProgressHUD+MJ.h"
#import "Common.h"
#import "WelcomeDoctor.h"
#import "UIImage+MJ.h"
#import "SecondClass.h"
#import "MJExtension.h"
#import "LDTextView.h"
#import "Department.h"
#import "CareerDelegate.h"
#import "DoctorEnterTool.h"
#import "HospitalEnterTextField.h"
#define LABELCOUNT 12
@interface WelcomeDosController () <UITextFieldDelegate,UIScrollViewDelegate,UITextViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic,weak) UIScrollView *scrollView;
@property (nonatomic,strong) NSMutableArray *welcomedocs;
@property (nonatomic,strong) NSMutableArray *labels;
@property (nonatomic,strong) NSMutableArray *textFields;
@property (nonatomic,weak) UIButton *loadBtn;
@property (nonatomic,weak) LDTextView *profileView;
@property (nonatomic,strong) NSMutableArray *departmentsArray;
@end

@implementation WelcomeDosController
- (NSMutableArray *)departmentsArray{
    if (_departmentsArray == nil) {
        _departmentsArray = [NSMutableArray array];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"department.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray *departments =[Department objectArrayWithKeyValuesArray:dict[@"departments"]];
        NSMutableArray *parray = [NSMutableArray array];
        for (Department *department in departments) {
            NSMutableArray *tempArray = [NSMutableArray array];
            NSArray *modelArray = department.secondClass;
            for (SecondClass *second in modelArray) {
                NSString *name = second.name;
                [tempArray addObject:name];
            }
            NSDictionary *dict = @{department.name : tempArray};
            [parray addObject:dict];
        }
        [_departmentsArray addObjectsFromArray:parray];
    }
    return _departmentsArray;
}
- (NSMutableArray *)textFields
{
    if (_textFields == nil) {
        _textFields = [NSMutableArray array];
    }
    return _textFields;
}
- (NSMutableArray *)labels
{
    if (_labels == nil) {
        _labels = [[NSMutableArray alloc] init];
    }
    return _labels;
}
- (NSMutableArray *)welcomedocs
{
    if (_welcomedocs == nil) {
        _welcomedocs = [[NSMutableArray alloc] init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"doctorEnter.plist"  ofType:nil];
       NSArray *tempArray = [WelcomeDoctor objectArrayWithFile:path];
        [_welcomedocs addObjectsFromArray:tempArray];
    }
    return _welcomedocs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"欢迎医生入驻";
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = IWColor(226, 226, 226);
    scrollView.frame = (CGRect){CGPointMake(0, 64),self.view.bounds.size};
    scrollView.delegate = self;
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    self.scrollView.contentSize = CGSizeMake(0, SCREENHEIGHT * 1.3);
    [self setupSubViews];
}
- (void)setupSubViews
{
    //添加子控件
    for (int i = 0; i < LABELCOUNT; i++) {
        
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.text = [self.welcomedocs[i] nameLabel];
        [self.scrollView addSubview:label];
        [self.labels addObject:label];
        
        HospitalEnterTextField *textf = [[HospitalEnterTextField alloc] init];
        textf.placeholder = [self.welcomedocs[i] placeholder];
        textf.borderStyle = UITextBorderStyleRoundedRect;
        textf.font = [UIFont systemFontOfSize:14];
        textf.tag = i;
        [textf setTintColor:[UIColor blackColor]];
        [textf setValue:[UIFont systemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
        textf.clearButtonMode = UITextFieldViewModeWhileEditing;
        textf.textAlignment = NSTextAlignmentRight;
        textf.delegate = self;
        [self.scrollView addSubview:textf];
        [self.textFields addObject:textf];
    }
    //设置子控件的frame
    CGFloat padding = 18;
    CGFloat labelW = 60;
    CGFloat labelH = 20;
    CGFloat labelX = 10;
    CGFloat labely = 0;
    
    CGFloat textX = 0;
    CGFloat textY = 0;
    CGFloat textW = 0;
    CGFloat textH = 30;
    for (int j = 0; j < LABELCOUNT; j++) {
        UILabel *currentLabel = self.labels[j];
        labely = (j + 1)* padding + labelH * j;
        currentLabel.frame = CGRectMake(labelX, labely, labelW, labelH);
        
        HospitalEnterTextField *textf = self.textFields[j];
        textX = CGRectGetMaxX(currentLabel.frame);
        textY = labely - 5;
        textW = SCREENWIDTH - textX - 8;
        textf.frame = CGRectMake(textX, textY, textW, textH);
    }
    HospitalEnterTextField *lastField = [self.textFields lastObject];
    CGFloat textViewX = lastField.frame.origin.x;
    CGFloat textViewY = lastField.frame.origin.y + 5;
    CGFloat textViewW = lastField.frame.size.width;
    CGFloat textViewH = 180;
    LDTextView *profileView = [[LDTextView alloc] initWithFrame:CGRectMake(textViewX, textViewY, textViewW, textViewH)];
    [self.scrollView addSubview:profileView];
    profileView.delegate = self;
    profileView.backgroundColor = [UIColor whiteColor];
    profileView.layer.cornerRadius = 8;
    self.profileView = profileView;
    profileView.placeholder = @"请输入个人简历信息";
    [lastField removeFromSuperview];
    
    UILabel *uploadLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelX, CGRectGetMaxY(profileView.frame)+padding, labelW, labelH)];
    uploadLabel.font = [UIFont systemFontOfSize:14];
    uploadLabel.text = @"上传附件";
    [self.scrollView addSubview:uploadLabel];
    
    CGFloat btnW = 55;
    CGFloat btnH = 55;
    CGFloat btnX = SCREENWIDTH - padding - btnW;
    CGFloat btnY = uploadLabel.frame.origin.y;
    UIButton *uploadBtn = [[UIButton alloc] initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
    self.loadBtn = uploadBtn;
    [uploadBtn setImage:[UIImage imageWithName:@"compose_camerabutton_background"] forState:UIControlStateNormal];
    [uploadBtn setImage:[UIImage imageWithName:@"compose_camerabutton_background_highlighted"] forState:UIControlStateHighlighted];
    [uploadBtn addTarget:self action:@selector(upload) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:uploadBtn];
    
    UIButton *auditBtn = [[UIButton alloc] initWithFrame:CGRectMake(labelX, CGRectGetMaxY(uploadLabel.frame)+2 * padding, SCREENWIDTH - 2 *labelX, 35)];
    [auditBtn setBackgroundImage:[UIImage imageWithName:@"reg_btn_bg_blue_big"] forState:UIControlStateNormal];
    [auditBtn setTitle:@"审核" forState:UIControlStateNormal];
    [auditBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [auditBtn addTarget:self action:@selector(auditBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:auditBtn];
    
    
}
- (void)auditBtnClicked
{
    DoctorTabbarController *newroot = [[DoctorTabbarController alloc] init];
    self.view.window.rootViewController = newroot;
    if ([self checkChooseField]) {
        HospitalEnterTextField *doctornameField = [self.textFields objectAtIndex:0];
        HospitalEnterTextField *identityIdField = [self.textFields objectAtIndex:1];
        HospitalEnterTextField *hospitalNameField = [self.textFields objectAtIndex:2];
        HospitalEnterTextField *hospitalLocationField = [self.textFields objectAtIndex:3];
        HospitalEnterTextField *hospitalAddressField = [self.textFields objectAtIndex:4];
        HospitalEnterTextField *hospitalLevelField = [self.textFields objectAtIndex:5];
        HospitalEnterTextField *departmentField = [self.textFields objectAtIndex:6];
        HospitalEnterTextField *techtitleField = [self.textFields objectAtIndex:7];
        HospitalEnterTextField *faimilarIllnessField = [self.textFields objectAtIndex:8];
        HospitalEnterTextField *doctorNoField = [self.textFields objectAtIndex:9];
        NSData *data = UIImageJPEGRepresentation([self.loadBtn currentImage], 1.0);
        LDFormData *formData = [LDFormData formDataWithData:data name:@"file" filename:@"" mimiType:@"image/jpeg"];
        NSArray *formDataArray = @[formData];
        DoctorEnterParam *param = [DoctorEnterParam paramWithDocname:doctornameField.text
                                                            idcardNo:identityIdField.text
                                                        hospitalName:hospitalNameField.text
                                                           deparment:departmentField.enterData.department
                                                    hospitalLocation:hospitalLocationField.enterData.hospitalLocation
                                                     hospitalAddress:hospitalAddressField.text
                                                       hospitalLevel:hospitalLevelField.enterData.hospitalLevel
                                                           techtitle:techtitleField.enterData.techtile
                                                        introduction:self.profileView.text
                                                     familiarIllness:faimilarIllnessField.text
                                                            doctorNO:doctorNoField.text ];
        [DoctorEnterTool uploadDoctorDataWithParam:param formDataArray:formDataArray  success:^(BaseResult *result) {
            if ([result.status isEqualToString:@"S"]) {
                NSLog(@"You are amazing!!!");
            }
        } failure:^(NSError *error) {
            
        }];
    }
   
    
}
- (BOOL)checkChooseField
{
    NSArray *msg = @[@"请输入姓名",@"请输入身份证号",@"请输入医院名称",@"请选择医院地区",@"请输入医院地址",@"请选择医院等级",@"请选择科室",@"请选择临床职称",@"请输入擅长疾病",@"请输入职业号",@"请输入手机号"];
    for (int i = 0 ; i < self.textFields.count - 1; i++) {
        HospitalEnterTextField *textField = [self.textFields objectAtIndex:i];
        if (textField.text.length == 0) {
            [MBProgressHUD showError:[msg objectAtIndex:i]];
            return NO;
        }
    }
    NSLog(@"%@",self.profileView.text);
    if (self.profileView.text.length == 0) {
        [MBProgressHUD showError:@"请填写个人简介"];
        return NO;
    }
    return YES;
    
}
- (void)upload
{
    UIActionSheet *actionsheet = [[UIActionSheet alloc] initWithTitle:@""
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"从手机相册选一张",@"拍一张", nil];
    [actionsheet showFromTabBar:self.tabBarController.tabBar];
}
#pragma mark - actionsheet delegate method
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self openPhotoLibraray];
            break;
        case 1:
            [self openCamera];
            break;
        default:
            break;
    }
}
- (void)openCamera
{
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
}
- (void)openPhotoLibraray
{
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
}
#pragma mark - UIImagePickerController Delegate Method
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [self.loadBtn setImage:image forState:UIControlStateNormal];
}
#pragma mark - UITextField delegate method
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(HospitalEnterTextField *)textField
{
    if ([textField.placeholder isEqualToString:@"请点击选择"]) {
        switch (textField.tag) {
            case 3:
            {
                ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"选择地区"
                                                                                              delegate:[[ZonePickerDelegate alloc] init]
                                                                                                origin:textField];
                [customPicker showActionSheetPicker];
                break;
            }
            case 5:
            {
                ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"医院等级"
                                                                                              delegate:[[PropertyPickerDelegate alloc] init]
                                                                                                origin:textField];
                [customPicker showActionSheetPicker];
                break;
            }
            case 6:
            {
                ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"选择科室"
                                                                                              delegate:[[DepartmentDelegate alloc] init]
                                                                                                origin:textField];
                [customPicker showActionSheetPicker];
                break;
            }
            case 7:
            {
                ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"临床职称"
                                                                                              delegate:[[CareerDelegate alloc] init]
                                                                                                origin:textField];
                [customPicker showActionSheetPicker];
                break;
            }
            default:
                break;
        }
        return NO;
    }else
    {
        return YES;
    }
}
- (void)showPickerViewWithTitle:(NSString *)title delegate:(id<ActionSheetCustomPickerDelegate>)delegate sender:(id)sender
{
    [ActionSheetCustomPicker showPickerWithTitle:title delegate:delegate showCancelButton:YES origin:sender];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}
#pragma mark - textview delegate method
- (void)textViewDidBeginEditing:(LDTextView *)textView
{
    [textView showPlaceHolder:NO];
}
- (void)textViewDidChange:(LDTextView *)textView
{
    if (textView.text.length) {
        [textView showPlaceHolder:NO];
    }else
    {
        [textView showPlaceHolder:YES];
    }
}
- (void)textViewDidEndEditing:(LDTextView *)textView
{
    if (textView.text.length) {
        return;
    }
    [textView showPlaceHolder:YES];
}

@end













