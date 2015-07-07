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
//116.228.153.157:8888
#define HOSID @"hospital"
#define DOCID @"doctor"
#define DISID @"disease"
#define CELLBORDER 10
//http://localhost:8080/assfinance/public/getEmployInfoList
//
//说明：type   招聘类型 1-多点执业邀请2-专家邀请3- 实习 4-进修 5-博士后
#define BGCOLOR IWColor(226, 226, 226)
#define APPENDRECRUITURL @"http://192.168.1.4:8080/assfinance/hospital/releaseEmployInfo"
#define HOTHOSURL @"http://116.228.153.157:8888/assfinance/public/hotHospitals"
#define SEARCHCASEURL @"http://116.228.153.157:8888/assfinance/public/searchCases"
#define COREEXPERTURL @"http://116.228.153.157:8888/assfinance/public/getImpartantDoctors"
#define SEARCHHOSURL @"http://116.228.153.157:8888/assfinance/public/searchHospitals"
#define HOTDEPARTMENTURL @"http://116.228.153.157:8888/assfinance/public/hotDepartments/"
#define TOKENHOSINFOURL @"http://116.228.153.157:8888/assfinance/hospital/getHospitalInfoById"
#define TOKENDOCTORINFOURL @"http://116.228.153.157:8888/assfinance/doctor/getDoctorInfoById"
#define RECRUITURL @"http://116.228.153.157:8888/assfinance/public/getEmployInfoList"
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
#define GETCHECKINURL @"http://116.228.153.157:8888/assfinance/user/sendSecurityCode"
#define LOGINURL @"http://116.228.153.157:8888/assfinance/user/login"
#define DOCTORENTERURL @"http://116.228.153.157:8888/assfinance/doctor/doctorSignIn"
#define PATIENTENTERURL @"http://116.228.153.157:8888/assfinance/patient/patientSignIn"
#define POSTCONSULTURL @"http://116.228.153.157:8888/assfinance/hospital/releaseGroupConsultation"
#define QUERYCONSULTURL @"http://116.228.153.157:8888/assfinance/hospital/getMyGroupConsultation"
#define CONSULTDETAILURL @"http://116.228.153.157:8888/assfinance/hospital/getMyGroupConsultationById"
#define GETEMPLOYURL @"http://192.168.1.4:8080/assfinance/hospital/getMyEmployInfo"
#define GETEMPLOYDETAILURL @"http://116.228.153.157:8888/assfinance/hospital/getMyEmployInfoById"
#define GETACCEPTEDURL @"http://116.228.153.157:8888/assfinance/hospital/getAcceptedResumeById"
#define GETALLRESUMEURL @"http://116.228.153.157:8888/assfinance/hospital/getAllResumeById"
#define GETDOCTORRESUMEURL @"http://116.228.153.157:8888/assfinance/hospital/getResumeByResumeId"
#define ENROLLDOCTORURL @"http://116.228.153.157:8888/assfinance/hospital/acceptResume"
#define SETCHARGEURL @"http://116.228.153.157:8888/assfinance/hospital/setPersonInCharge"
#define SENDHOSPITALINFOURL @"http://116.228.153.157:8888/assfinance/hospital/changeHospitalIntroduction"
#define SENDDOCARRANGEMENTURL @"http://116.228.153.157:8888/assfinance/hospital/releaseDoctorArrangement"
#define WITHDRAWNURL @"http://116.228.153.157:8888/assfinance/hospital/deleteEmployInfo"
#define ReleaseTypicalCaseRul @"http://116.228.153.157:8888/assfinance/hospital/releaseTypicalCase"
#define GETGCINFOLISTURL @"http://116.228.153.157:8888/assfinance/doctor/getGCInfoList"
#define DOCCONSULTDETAILURL @"http://116.228.153.157:8888/assfinance/doctor/getGCInfoById"
#define SDINFOLISTURL @"http://116.228.153.157:8888/assfinance/doctor/getSDInfoList"
#define FREEDETAILURL @"http://116.228.153.157:8888/assfinance/doctor/getSDInfoById"
#define REPLYINVITEURL @"http://116.228.153.157:8888/assfinance/doctor/replySDInfoById"
#define SEEKDOCLISTURL @"http://116.228.153.157:8888/assfinance/patient/getSeekDoctorList"
#define PATIENTINVITEDEURL @"http://116.228.153.157:8888/assfinance/patient/getSeekDoctorById"
#define ALLDOCLISTURL @"http://116.228.153.157:8888/assfinance/patient/getAllById"
#define ACCEPTDOCURL @"http://116.228.153.157:8888/assfinance/patient/getAcceptById"
#define PATIENTACCEPTDOCURL @"http://116.228.153.157:8888/assfinance/patient/acceptDoctor"
#define DELETEEMPLOYURL @"http://116.228.153.157:8888/assfinance/patient/deleteSDById"
#define APPENDINVITEURL @"http://116.228.153.157:8888/assfinance/patient/releaseSeekDoctor"
#define DEPARTMENTWITHDRAWURL @"http://116.228.153.157:8888/assfinance/hospital/deleteGCById"
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
