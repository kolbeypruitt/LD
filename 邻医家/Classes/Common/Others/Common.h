//
//  Common.h
//  邻医家
//
//  Created by Daniel on 15/5/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#ifndef ____Common_h
#define ____Common_h
#import "IWCommon.h"
//116.228.153.157:8888 116.228.153.157:8888
#define HOSID @"hospital"
#define DOCID @"doctor"
#define DISID @"disease"
#define CELLBORDER 10
//说明：type   招聘类型 1-多点执业邀请2-专家邀请3- 实习 4-进修 5-博士后
#define BGCOLOR IWColor(226, 226, 226)
#define CHANGEARRANGEMENTURL @"http://116.228.153.157:8888/assfinance/doctor/changeMyArrangement"
#define DEPMENTALLURL @"http://116.228.153.157:8888/assfinance/hospital/getAllByGCId"
#define DEPMENTACCEPTURL @"http://116.228.153.157:8888/assfinance/hospital/getAcceptedByGCId"
#define DISMISSMANAGERURL @"http://116.228.153.157:8888/assfinance/hospital/deleteDepartment"
#define APPENDRECRUITURL @"http://116.228.153.157:8888/assfinance/hospital/releaseEmployInfo"
#define DEPARTMENTLISTURL @"http://116.228.153.157:8888/assfinance/hospital/getPersonInCharge"
#define MANAGERDETAILURL @"http://116.228.153.157:8888/assfinance/hospital/getMyDepartmentInfoById"
#define HOTHOSURL @"http://116.228.153.157:8888/assfinance/public/hotHospitals"
#define SEARCHCASEURL @"http://116.228.153.157:8888/assfinance/public/searchCases"
#define COREEXPERTURL @"http://116.228.153.157:8888/assfinance/public/getImpartantDoctors"
#define SEARCHHOSURL @"http://116.228.153.157:8888/assfinance/public/searchHospitals"
#define HOTDEPARTMENTURL @"http://116.228.153.157:8888/assfinance/public/hotDepartments/"
#define TOKENHOSINFOURL @"http://116.228.153.157:8888/assfinance/hospital/getHospitalInfoById"
#define TOKENDOCTORINFOURL @"http://116.228.153.157:8888/assfinance/doctor/getMyDoctorInfo"
#define RECRUITURL @"http://116.228.153.157:8888/assfinance/public/getEmployInfoList"
#define SEARCHDOCTORSTATIONURL @"http://116.228.153.157:8888/assfinance/public/searchPostdoctorStation"
#define RECRUITDETAILURL @"http://116.228.153.157:8888/assfinance/public/getEmployInfoById"
#define IMAGEPREF @"http://116.228.153.157:8888/assfinance/welcome/image"
#define DOCTORSTATIONURL @"http://116.228.153.157:8888/assfinance/public/getPostdoctorStationList"
#define DOCTORSTATIONDETAILURL @"http://116.228.153.157:8888/assfinance/public/getPostdoctorStationInfoById"
#define CASEDETAILURL @"http://116.228.153.157:8888/assfinance/public/getCaseInfoById"
#define HOSPITALDETAILURL @"http://116.228.153.157:8888/assfinance/public/getHospitalInfoById"
#define HOTAREAURL @"http://116.228.153.157:8888/assfinance/public/hotLocations"
#define DOCTORDETAILURL @"http://116.228.153.157:8888/assfinance/public/getDoctorInfoById"

#define GETRECOMMENDURL @"http://116.228.153.157:8888/assfinance/public/getRecommanded"
#define RECOMMENDDOCURL @"http://116.228.153.157:8888/assfinance/public/recommandedDoctors"
#define RECOMMENDHOSURL @"http://116.228.153.157:8888/assfinance/public/recommandedHospitals"
#define COMMONDISURL @"http://116.228.153.157:8888/assfinance/welcome/image"
#define MULTIJOBURL @"http://116.228.153.157:8888/assfinance/public/getPolicyList"
#define MULTIJOBDETAILURL @"http://116.228.153.157:8888/assfinance/public/getPolicyInfoById"
#define COREEXPERTURL @"http://116.228.153.157:8888/assfinance/public/getImpartantDoctors"
#define DOCSEARCHURL @"http://116.228.153.157:8888/assfinance/public/searchDoctors"
#define HOSRANKURL @"http://116.228.153.157:8888/assfinance/public/getHospitalLevel"
#define POSTDOCSTATIONURL @"http://116.228.153.157:8888/assfinance/public/getPostdoctorStationList"
#define HOSPITALLEVELURL @"http://116.228.153.157:8888/assfinance/public/getHospitalLevel"
#define HOSPITALENTERURL @"http://116.228.153.157:8888/assfinance/hospital/hospitalSignIn"
#define SIGNUPURL @"http://116.228.153.157:8888/assfinance/user/toRegister"
#define GETCHECKINURL @"http://116.228.153.157:8888/assfinance/public/sendSecurityCode"
#define LOGINURL @"http://116.228.153.157:8888/assfinance/user/login"
#define DOCTORENTERURL @"http://116.228.153.157:8888/assfinance/doctor/doctorSignIn"
#define PATIENTENTERURL @"http://116.228.153.157:8888/assfinance/patient/patientSignIn"
#define POSTCONSULTURL @"http://116.228.153.157:8888/assfinance/hospital/releaseGroupConsultation"
#define QUERYCONSULTURL @"http://116.228.153.157:8888/assfinance/hospital/getMyGroupConsultation"
#define CONSULTDETAILURL @"http://116.228.153.157:8888/assfinance/hospital/getMyGroupConsultationById"
#define GETEMPLOYURL @"http://116.228.153.157:8888/assfinance/hospital/getMyEmployInfo"
#define GETSUCCESSEDEMPLOYURL @"http://116.228.153.157:8888/assfinance/hospital/getMySucceedEmployInfo"

#define DEPARTMENTINVITEDOCTOR @"http://116.228.153.157:8888/assfinance/hospital/acceptDoctor"

#define GETEMPLOYDETAILURL @"http://116.228.153.157:8888/assfinance/hospital/getMyEmployInfoById"
#define GETACCEPTEDURL @"http://116.228.153.157:8888/assfinance/hospital/getAcceptedResumeById"
#define GETALLRESUMEURL @"http://116.228.153.157:8888/assfinance/hospital/getAllResumeById"
#define GETDOCTORRESUMEURL @"http://116.228.153.157:8888/assfinance/hospital/getResumeByResumeId"
#define ENROLLDOCTORURL @"http://116.228.153.157:8888/assfinance/hospital/acceptResume"
#define SETCHARGEURL @"http://116.228.153.157:8888/assfinance/hospital/setPersonInCharge"
#define SENDHOSPITALINFOURL @"http://116.228.153.157:8888/assfinance/hospital/changeHospitalIntroduction"
#define SENDDOCARRANGEMENTURL @"http://116.228.153.157:8888/assfinance/hospital/releaseDoctorArrangement"
#define WITHDRAWNURL @"http://116.228.153.157:8888/assfinance/hospital/deleteEmployInfo"
#define RELEASECASEURL @"http://116.228.153.157:8888/assfinance/hospital/releaseTypicalCase"
#define GETGCINFOLISTURL @"http://116.228.153.157:8888/assfinance/doctor/getGCInfoList"
#define DOCCONSULTDETAILURL @"http://116.228.153.157:8888/assfinance/doctor/getGCInfoById"
#define SDINFOLISTURL @"http://116.228.153.157:8888/assfinance/doctor/getSDInfoList"
#define FREEDETAILURL @"http://116.228.153.157:8888/assfinance/doctor/getSDInfoById"
#define REPLYINVITEURL @"http://116.228.153.157:8888/assfinance/doctor/replySDInfoById"
#define SEEKDOCLISTURL @"http://116.228.153.157:8888/assfinance/patient/getSeekDoctorList"
#define DOCTORREPLYCONSULTURL @"http://116.228.153.157:8888/assfinance/doctor/replyGCInfoById"
#define PATIENTINVITEDEURL @"http://116.228.153.157:8888/assfinance/patient/getSeekDoctorById"
#define ALLDOCLISTURL @"http://116.228.153.157:8888/assfinance/patient/getAllById"
#define ACCEPTDOCURL @"http://116.228.153.157:8888/assfinance/patient/getAcceptById"
#define PATIENTACCEPTDOCURL @"http://116.228.153.157:8888/assfinance/patient/acceptDoctor"
#define DELETEEMPLOYURL @"http://116.228.153.157:8888/assfinance/patient/deleteSDById"
#define APPENDINVITEURL @"http://116.228.153.157:8888/assfinance/patient/releaseSeekDoctor"
#define DEPARTMENTWITHDRAWURL @"http://116.228.153.157:8888/assfinance/hospital/deleteGCById"
#define POSTEDCASELISTURL @"http://116.228.153.157:8888/assfinance/hospital/getMyTypicalCase"
#define DOCARRANGEMENTLISTURL @"http://116.228.153.157:8888/assfinance/hospital/getMyDoctorArrangement"
#define RELEASEDOCARRANGEMENTURL @"http://116.228.153.157:8888/assfinance/hospital/releaseDoctorArrangement"
#define DOCARRANGEMENTDETAILURL @"http://116.228.153.157:8888/assfinance/hospital/getMyDoctorArrangementById"
#define USEINFOURL @"http://116.228.153.157:8888/assfinance/user/getAccountInfo"
#define CHANGEPWDURL @"http://116.228.153.157:8888/assfinance/user/changePassword"

// 获取我的会诊信息
#define MYCONSULTURL @"http://116.228.153.157:8888/assfinance/doctor/getMyGCInfoList"
#define MYCONSULTDETAILURL @"http://116.228.153.157:8888/assfinance/doctor/getGCInfoById"
// 医生获取自己的请医信息列表
#define MYINVITEURL @"http://116.228.153.157:8888/assfinance/doctor/getMySDInfoList"
#define MYINVITETDETAILURL @"http://116.228.153.157:8888/assfinance/doctor/getSDInfoById"
//医生查看自己应聘的招聘信息
#define MYAPPLIANTURL @"http://116.228.153.157:8888/assfinance/doctor/getListIApplyFor"
#define MYAPPLIANTDETAILURL @"http://116.228.153.157:8888/assfinance/doctor/getMyEmployInfoById"
//医生配置
#define GETDOCTORCONFIGUREURL @"http://116.228.153.157:8888/assfinance/doctor/getMyServiceSettings"
#define CHANGEDOCTORCONFIGUREURL @"http://116.228.153.157:8888/assfinance/doctor/changeMyServiceSettings"

#define SUCCESSSTATUS @"S"
#define FAILURESTATUS @"F"
#define TABLEMARGIN 5
#define CELLMARGIN 8
#define HEADERHEIGHT 285
#define NAVBARHEIGHT 64
#define LOGINDONWNOTIFICATION @"logindown"
#define FREEINVITENEEDREFRESHNOTIFICATION @"freeinviteneedrefreshnotification"
#define SCREENWIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREENHEIGHT ([UIScreen mainScreen].bounds.size.height)
#define DefaultCenter [NSNotificationCenter defaultCenter]
#endif
//doctor/getMyServiceSettings(String token)
//map.put("settings", serviceSettings);
//map.put("status","S");
//。 2015/7/17 10:39:33
//doctor/changeMyServiceSettings(String token,String settings)
//{"status":"S"}
//。 2015/7/17 10:51:43
//1,0,0,0,1,1,0,1,0,0