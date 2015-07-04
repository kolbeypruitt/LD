//
//  UCSCommonClass.h
//  ucsapisdk
//
//  Created by tongkucky on 14-4-2.
//  Copyright (c) 2014年 yzx. All rights reserved.
//

#import <Foundation/Foundation.h>






typedef enum
{
    UCSCallType_VOIP       = 0, // 语音Voip电话
    UCSCallType_FlPhone    = 1, // 落地电话
    UCSCallType_VideoPhone = 2, // 视频电话
    UCSCallType_conference = 3, // 语音群聊
    
    
}UCSCallTypeEnum;


typedef enum
{
    UCSCli_ClientID = 0, // 号码为ClientID
    UCSCli_PHONE    = 1, // 号码为PHONE Number
 
}UCSClientType;


//摄像头位置
typedef enum
{
    CAMERA_REAR =0,    //后置摄像头
    CAMERA_FRONT = 1   //前置摄像头


}UCSSwitchCameraType;


typedef enum  {
    UNKNOWN,               /* 未知状态 */
    CALLING,               /* 正在呼叫对方 */
    RINGING,               /* 对方正在向铃 */
    JOINCHATROOM,          /* 对方加入群聊 */
    EXITCHATROOM,          /* 对方退出群聊 */
    
}ChatRoomState;


typedef enum {
    MessageTypeText = 1,
    MessageTypePhoto = 2,
    MessageTypeVoice = 3,
    MessageTypeVideo = 4,
}MessageType;



// IM Entity
@interface UCSMessage : NSObject

@property(nonatomic, retain)            NSString             *msgFromUid;     // 消息发送者UID
@property(nonatomic, retain)            NSString             *msgToUid;       // 消息接收者UID
@property(nonatomic, retain)            NSString             *msgContent;     // 消息内容（当为附件类型时，值为路径）
@property(nonatomic, assign)            int             msgContentType;       // 消息类型（1文本，2图片，3语音，4视频，10-29自定义）
@property(nonatomic, retain)            NSString             *msgRecordID;    // 消息唯一标识
@property(nonatomic, retain)            NSString             *msgCreTime;     // 消息创建时间
@property(nonatomic, retain)            NSString             *msgFileName;     // 附件原始名称
@property(nonatomic, retain)            NSString             *msgFileSize;     // 附件大小，单位为K


@end





//错误码
@interface UCSReason : NSObject<NSCopying>
@property (nonatomic,assign) NSInteger reason;
@property (nonatomic,retain) NSString *msg;
@end



//查询用户状态
@interface UCSUserState : NSObject
@property (nonatomic, assign) NSInteger retcode;    // 0（成功）1（不存在该用户）2（错误）
@property (nonatomic, retain) NSString  *uid;       // Client账号
@property (nonatomic, assign) NSInteger pv;         // 平台 PC：1、 iOS：2、 android：0
@property (nonatomic, assign) NSInteger state;      // 1:在线、2:不在线
@property (nonatomic, assign) NSInteger netmode;    // 网络 WIFI：1、 2G：2、 3G：4
@property (nonatomic, retain) NSString *phone;      // 与Client绑定的电话号码
@property (nonatomic, retain) NSString *version;    // 版本号
@property (nonatomic, retain) NSString *timestamp;  // 下线时间戳

@end


//语音群聊通知状态
@interface ChatRoomMemberState : NSObject
@property (nonatomic, assign) NSInteger call_state; // 0：UNKNOWN，1：CALLING，2：RINGING，3：JOINCHATROOM，4：EXITCHATROOM
@property (nonatomic, retain) NSString  *uid;       // Client账号
@property (nonatomic, retain) NSString *phone;      // 与Client绑定的电话号码


@end


@interface UCSCommonClass : NSObject


@end
