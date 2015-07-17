//
//  CaseDetailController.m
//  邻医家
//
//  Created by Daniel on 15/6/24.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Common.h"
#import "CaseDetailParam.h"
#import "LDMessage.h"
#import "CaseDetailResult.h"
#import "CaseDetailTool.h"
#import "Case.h"
#import "CaseDetailController.h"
#import "CaseDetail.h"
@interface CaseDetailController ()
@property (nonatomic,strong) CaseDetail *Cs;
@end

@implementation CaseDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setup];
}
- (void)loadData
{
    CaseDetailParam *param = [CaseDetailParam paramWithId:self.norcase.id];
    [CaseDetailTool caseDetailWithParam:param success:^(CaseDetailResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            self.Cs = result.Case;
        }
    } failure:^(NSError *error) {
        
    }]; 
}
- (void)setCs:(CaseDetail *)Cs
{
    _Cs = Cs;
    self.singleLine = YES;
    LDMessage *message0 = [LDMessage messageWithFirstTitle:@"性别" secondTitle:Cs.gender];
    LDMessage *message1 = [LDMessage messageWithFirstTitle:@"年龄" secondTitle:[NSString stringWithFormat:@"%d",Cs.age]];
    LDMessage *message2 = [LDMessage messageWithFirstTitle:@"主诉" secondTitle:Cs.chiefComplaint];
    LDMessage *message3 = [LDMessage messageWithFirstTitle:@"现病史" secondTitle:Cs.illNow];
    LDMessage *message4 = [LDMessage messageWithFirstTitle:@"既往病史" secondTitle:Cs.illBefore];
    LDMessage *message5 = [LDMessage messageWithFirstTitle:@"查体" secondTitle:Cs.bodyCheck];
    LDMessage *message6 = [LDMessage messageWithFirstTitle:@"辅助查体" secondTitle:Cs.supportCheck];
    LDMessage *message7 = [LDMessage messageWithFirstTitle:@"诊断" secondTitle:Cs.diagnose];
    LDMessage *message8 = [LDMessage messageWithFirstTitle:@"治疗过程" secondTitle:Cs.treatmentProcess];
    self.messages = @[message0,message1,message2,message3,message4,message5,message6,message7,message8];
}
- (void)setNorcase:(Case *)norcase
{
    _norcase = norcase;
}
- (void)setup
{
    self.title = self.norcase.name;
    self.tableView.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0);
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return  nil;
}
@end
