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
//192.168.1.4:8080 192.168.1.4:8080
#define HOSID @"hospital"
#define DOCID @"doctor"
#define DISID @"disease"
#define CELLBORDER 10
//http://localhost:8080/assfinance/public/getEmployInfoList
//说明：type   招聘类型 1-多点执业邀请2-专家邀请3- 实习 4-进修 5-博士后
#define BGCOLOR IWColor(226, 226, 226)
#define DEPMENTALLURL @"http://192.168.1.4:8080/assfinance/hospital/getAllByGCId"
#define DEPMENTACCEPTURL @"http://192.168.1.4:8080/assfinance/hospital/getAcceptedByGCId"
#define DISMISSMANAGERURL @"http://192.168.1.4:8080/assfinance/hospital/deleteDepartment"
#define APPENDRECRUITURL @"http://192.168.1.4:8080/assfinance/hospital/releaseEmployInfo"
#define DEPARTMENTLISTURL @"http://192.168.1.4:8080/assfinance/hospital/getPersonInCharge"
#define MANAGERDETAILURL @"http://192.168.1.4:8080/assfinance/hospital/getMyDepartmentInfoById"
#define HOTHOSURL @"http://192.168.1.4:8080/assfinance/public/hotHospitals"
#define SEARCHCASEURL @"http://192.168.1.4:8080/assfinance/public/searchCases"
#define COREEXPERTURL @"http://192.168.1.4:8080/assfinance/public/getImpartantDoctors"
#define SEARCHHOSURL @"http://192.168.1.4:8080/assfinance/public/searchHospitals"
#define HOTDEPARTMENTURL @"http://192.168.1.4:8080/assfinance/public/hotDepartments/"
#define TOKENHOSINFOURL @"http://192.168.1.4:8080/assfinance/hospital/getHospitalInfoById"
#define TOKENDOCTORINFOURL @"http://192.168.1.4:8080/assfinance/doctor/getMyDoctorInfo"
#define RECRUITURL @"http://192.168.1.4:8080/assfinance/public/getEmployInfoList"
#define RECRUITDETAILURL @"http://192.168.1.4:8080/assfinance/public/getEmployInfoById"
#define IMAGEPREF @"http://192.168.1.4:8080/assfinance/welcome/image"
#define DOCTORSTATIONURL @"http://192.168.1.4:8080/assfinance/public/getPostdoctorStationList"
#define DOCTORSTATIONDETAILURL @"http://192.168.1.4:8080/assfinance/public/getPostdoctorStationInfoById"
#define CASEDETAILURL @"http://192.168.1.4:8080/assfinance/public/getCaseInfoById"
#define HOSPITALDETAILURL @"http://192.168.1.4:8080/assfinance/public/getHospitalInfoById"
#define HOTAREAURL @"http://192.168.1.4:8080/assfinance/public/hotLocations"
#define DOCTORDETAILURL @"http://192.168.1.4:8080/assfinance/public/getDoctorInfoById"
#define GETRECOMMENDURL @"http://192.168.1.4:8080/assfinance/public/getRecommanded"
#define RECOMMENDDOCURL @"http://192.168.1.4:8080/assfinance/public/recommandedDoctors"
#define RECOMMENDHOSURL @"http://192.168.1.4:8080/assfinance/public/recommandedHospitals"
#define COMMONDISURL @"http://192.168.1.4:8080/assfinance/welcome/image"
#define MULTIJOBURL @"http://192.168.1.4:8080/assfinance/public/getPolicyList"
#define MULTIJOBDETAILURL @"http://192.168.1.4:8080/assfinance/public/getPolicyInfoById"
#define COREEXPERTURL @"http://192.168.1.4:8080/assfinance/public/getImpartantDoctors"
#define DOCSEARCHURL @"http://192.168.1.4:8080/assfinance/public/searchDoctors"
#define HOSRANKURL @"http://192.168.1.4:8080/assfinance/public/getHospitalLevel"
#define POSTDOCSTATIONURL @"http://192.168.1.4:8080/assfinance/public/getPostdoctorStationList"
#define HOSPITALLEVELURL @"http://192.168.1.4:8080/assfinance/public/getHospitalLevel"
#define HOSPITALENTERURL @"http://192.168.1.4:8080/assfinance/hospital/hospitalSignIn"
#define SIGNUPURL @"http://192.168.1.4:8080/assfinance/user/toRegister"
#define GETCHECKINURL @"http://192.168.1.4:8080/assfinance/public/sendSecurityCode"
#define LOGINURL @"http://192.168.1.4:8080/assfinance/user/login"
#define DOCTORENTERURL @"http://192.168.1.4:8080/assfinance/doctor/doctorSignIn"
#define PATIENTENTERURL @"http://192.168.1.4:8080/assfinance/patient/patientSignIn"
#define POSTCONSULTURL @"http://192.168.1.4:8080/assfinance/hospital/releaseGroupConsultation"
#define QUERYCONSULTURL @"http://192.168.1.4:8080/assfinance/hospital/getMyGroupConsultation"
#define CONSULTDETAILURL @"http://192.168.1.4:8080/assfinance/hospital/getMyGroupConsultationById"
#define GETEMPLOYURL @"http://192.168.1.4:8080/assfinance/hospital/getMyEmployInfo"
#define GETSUCCESSEDEMPLOYURL @"http://192.168.1.4:8080/assfinance/hospital/getMySucceedEmployInfo"
#define GETEMPLOYDETAILURL @"http://192.168.1.4:8080/assfinance/hospital/getMyEmployInfoById"
#define GETACCEPTEDURL @"http://192.168.1.4:8080/assfinance/hospital/getAcceptedResumeById"
#define GETALLRESUMEURL @"http://192.168.1.4:8080/assfinance/hospital/getAllResumeById"
#define GETDOCTORRESUMEURL @"http://192.168.1.4:8080/assfinance/hospital/getResumeByResumeId"
#define ENROLLDOCTORURL @"http://192.168.1.4:8080/assfinance/hospital/acceptResume"
#define SETCHARGEURL @"http://192.168.1.4:8080/assfinance/hospital/setPersonInCharge"
#define SENDHOSPITALINFOURL @"http://192.168.1.4:8080/assfinance/hospital/changeHospitalIntroduction"
#define SENDDOCARRANGEMENTURL @"http://192.168.1.4:8080/assfinance/hospital/releaseDoctorArrangement"
#define WITHDRAWNURL @"http://192.168.1.4:8080/assfinance/hospital/deleteEmployInfo"
#define RELEASECASEURL @"http://192.168.1.4:8080/assfinance/hospital/releaseTypicalCase"
#define GETGCINFOLISTURL @"http://192.168.1.4:8080/assfinance/doctor/getGCInfoList"
#define DOCCONSULTDETAILURL @"http://192.168.1.4:8080/assfinance/doctor/getGCInfoById"
#define SDINFOLISTURL @"http://192.168.1.4:8080/assfinance/doctor/getSDInfoList"
#define FREEDETAILURL @"http://192.168.1.4:8080/assfinance/doctor/getSDInfoById"
#define REPLYINVITEURL @"http://192.168.1.4:8080/assfinance/doctor/replySDInfoById"
#define SEEKDOCLISTURL @"http://192.168.1.4:8080/assfinance/patient/getSeekDoctorList"
#define PATIENTINVITEDEURL @"http://192.168.1.4:8080/assfinance/patient/getSeekDoctorById"
#define ALLDOCLISTURL @"http://192.168.1.4:8080/assfinance/patient/getAllById"
#define ACCEPTDOCURL @"http://192.168.1.4:8080/assfinance/patient/getAcceptById"
#define PATIENTACCEPTDOCURL @"http://192.168.1.4:8080/assfinance/patient/acceptDoctor"
#define DELETEEMPLOYURL @"http://192.168.1.4:8080/assfinance/patient/deleteSDById"
#define APPENDINVITEURL @"http://192.168.1.4:8080/assfinance/patient/releaseSeekDoctor"
#define DEPARTMENTWITHDRAWURL @"http://192.168.1.4:8080/assfinance/hospital/deleteGCById"
#define POSTEDCASELISTURL @"http://192.168.1.4:8080/assfinance/hospital/getMyTypicalCase"
#define DOCARRANGEMENTLISTURL @"http://192.168.1.4:8080/assfinance/hospital/getMyDoctorArrangement"
#define RELEASEDOCARRANGEMENTURL @"http://192.168.1.4:8080/assfinance/hospital/releaseDoctorArrangement"
#define DOCARRANGEMENTDETAILURL @"http://192.168.1.4:8080/assfinance/hospital/getMyDoctorArrangementById"
#define USEINFOURL @"http://192.168.1.4:8080/assfinance/user/getAccountInfo"

// 获取我的会诊信息
#define MYCONSULTURL @"http://192.168.1.4:8080/assfinance/doctor/getMyGCInfoList"
#define MYCONSULTDETAILURL @"http://192.168.1.4:8080/assfinance/doctor/getGCInfoById"
// 医生获取自己的请医信息列表
#define MYINVITEURL @"http://192.168.1.4:8080/assfinance/doctor/getMySDInfoList"
#define MYINVITETDETAILURL @"http://192.168.1.4:8080/assfinance/doctor/getSDInfoById"
//医生查看自己应聘的招聘信息
#define MYAPPLIANTURL @"http://192.168.1.4:8080/assfinance/doctor/getListIApplyFor"
#define MYAPPLIANTDETAILURL @"http://192.168.1.4:8080/assfinance/doctor/getMyEmployInfoById"

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
