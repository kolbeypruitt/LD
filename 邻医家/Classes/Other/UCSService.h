//
//  UCSCallService.h
//  yzxapisdk
//
//  Created by tongkucky on 14-4-2.
//  Copyright (c) 2014年 yzx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UCSCommonClass.h"
#import "UCSEvent.h"
@interface UCSService : NSObject
 

#pragma mark - 初始化函数
//初始化实例
- (UCSService *)initWithDelegate:(id<UCSEventDelegate>)delegate;
//设置代理方法
-(void)setDelegate:(id< UCSEventDelegate>)delegate;

//连接服务器（明文）
-(NSInteger)connect:(NSString *)accountSid withAccountToken:(NSString *)accountToken withClientNumber:(NSString *)clientNumber withClientPwd:(NSString *)clientPwd;

//连接服务器（密文）
-(NSInteger)connect:(NSString *)token;

//连接服务器（明文,指定IP，Port）
-(NSInteger)connect:(NSString*)host_addr withPort:(NSString*)host_port withwithAccountSid:(NSString *)accountSid withAccountToken:(NSString *)accountToken withClientNumber:(NSString *)clientNumber withClientPwd:(NSString *)clientPwd;

//连接服务器（密文,指定IP，Port）
-(NSInteger)connect:(NSString*)host_addr withPort:(NSString*)host_port withToken:(NSString *)token;

 


//查询帐号与服务器连接状态
- (BOOL)isConnected;

//断开云平台连接
- (void)uninit;

#pragma mark - 呼叫控制函数
/**
 * 拨打电话
 * @param callType 电话类型 0:语音Voip电话 1:落地电话 4:智能呼叫
 * @param called 电话号(加国际码)或者VoIP号码
 * @return
 */
- (void)dial:(NSInteger)callType andCalled:(NSString *)calledNumber andUserdata:(NSString *)callerData;

/**
 * 发起语音群聊
 * @param callType 电话类型 0:语音Voip电话 1:落地电话  4:智能呼叫
 * @param calledUids 与会人员对象（ChatRoomMemberState类对象）
 * @return
 */
- (void)startChatRoom:(NSInteger)callType andUids:(NSMutableArray *)calledUids;



//
///**
// * 停止语音群聊
// *
// *
// */

- (void) stopChatRoom;


//
///**
// * 挂断电话
// * @param callid 电话id
// *
// */

- (void) hangUp: (NSString*)callid;
//
///**
// * 接听电话
// * @param callid 电话id
// * 
// */
- (void) answer: (NSString*)callid;

/**
 * 拒绝呼叫(挂断一样,当被呼叫的时候被呼叫方的挂断状态)
 * @param callid 电话id
 * 
 */
- (void)reject: (NSString*)callid;


/**
 * 回拨电话
 *
 * @param phoneNumber 被叫的电话（若呼叫国外需加国际码）
 *
 *
 */
- (void)callBack:(NSString *)phoneNumber;

/**
 * 回拨电话
 *
 * @param phoneNumber 被叫的电话（若呼叫国外需加国际码）
 * @param fromNum     显示主叫号码（此为可选参数）
 * @param toNum       显示被叫号码 （此为可选参数）
 *
 *
 */
- (void)callBack:(NSString *)phoneNumber showFromNum:(NSString*)fromNum showToNum:(NSString*)toNum;

 


#pragma mark - DTMF函数
/**
 * 发送DTMF
 * @param callid 电话id
 * @param dtmf 键值
 */
- (BOOL)sendDTMF: (char)dtmf;

#pragma mark - 本地功能函数

/**
 * 免提设置
 * @param enable NO:关闭 YES:打开
 */
- (void) setSpeakerphone:(BOOL)enable;


/**
 * 获取当前免提状态
 * @return NO:关闭 YES:打开
 */
- (BOOL) isSpeakerphoneOn;


/**
 * 静音设置
 * @param on NO:正常 YES:静音
 */
- (void)setMicMute:(BOOL)on;

/**
 * 获取当前静音状态
 * @return NO:正常 YES:静音
 */
- (BOOL)isMicMute;



 

#pragma mark IM能力函数
//--------------------------------------------IM能力分割线-------------------------------------------------------//
/**
 * 发送IM消息
 *
 */

- (NSString*) sendUcsMessage:(NSString*) receiver andText:(NSString*) text   andFilePath:(NSString*) filePath andExpandData:(NSInteger)msgType;
/**
 * 开始录制音频
 *
 */
- (NSString*) startVoiceRecord:(NSString*)filePath;
/**
 * 停止录制语音
 *
 */
-(void) stopVoiceRecord;
/**
 * 播放语音
 *
 */
-(void) playVoice :(NSString*) filePath;
/**
 * 停止播放语音
 *
 */
-(void) stopVoice;
/**
 * 获取语音时长
 *
 */
-(long) getVoiceDuration:(NSString*) filePath;
/**
 * 下载附件API
 *
 */
- (void) downloadAttached:(NSString*) fileUrl andFilePath:(NSString*) filePath andMsgID:(NSString*)MsgID;//gengxin need


//--------------------------------------------辅助能力分割线-------------------------------------------------------//

/**
 * 获取SDK版本信息
 *
 */
- (NSString*) getUCSSDKVersion;

/**
 * 获取流量分类统计信息
 *
 */
-(NSDictionary*) getNetWorkFlow;

/**
 * 获取clientNumber和phoneNumber（绑定的手机号）
 *
 */
-(NSDictionary*) getUserInfo;

 /**
 * 获取当前应用下的路径
 *
 */
- (NSString *) getIMMediaDir:(NSString *) strPhoneNumber;

 




/**
 * 查询多个client/phone的状态
 *
 */

- (void) queryUserState:(UCSClientType)numType withClients:(NSMutableArray*)clients;

/**
 * 查询单个client/phone的状态
 *
 */
- (void) queryUserState:(UCSClientType)numType withClient:(NSString*)client;



/**
 * 获取云验证码
 */

-(void)getVerificationCode:(NSString *)sid withAppid:(NSString *)appid withAppName:(NSString *)appName withCodetype:(int)codetype withPhone:(NSString *)phone withSeconds:(int)seconds withBusiness:(int)business;

/**
  * 验证码验证
 */
-(void)doVerificationCode:(NSString *)sid withAppid:(NSString *)appid withPhone:(NSString *)phone withVerifycode:(NSString *)verifycode;

/**
 * 离线来电推送
 *
 */

- (void) callIncomingPushRsp:(NSString*)callid  withVps:(NSInteger)vpsid withReason:(UCSReason*)reason;


@end
