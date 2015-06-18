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
//192.168.1.4:8080
//192.168.1.4:8080
#define HOSID @"hospital"
#define DOCID @"doctor"
#define DISID @"disease"
#define IMAGEPREF @"http://192.168.1.4:8080/assfinance/welcome/image"
#define GETRECOMMENDURL @"http://192.168.1.4:8080/assfinance/public/getRecommanded"
#define RECOMMENDDOCURL @"http://192.168.1.4:8080/assfinance/public/recommandedDoctors"
#define CELLBORDER 10
#define RECOMMENDHOSURL @"http://192.168.1.4:8080/assfinance/public/recommandedHospitals"
#define COMMONDISURL @"http://192.168.1.4:8080/assfinance/welcome/image"
#define MULTIJOBURL @"http://192.168.1.4:8080/assfinance/public/getPolicyList"
#define COREEXPERTURL @"http://192.168.1.4:8080/assfinance/public/getImpartantDoctors"
#define DOCSEARCHURL @"http://192.168.1.4:8080/assfinance/public/searchDoctors"
#define HOSRANKURL @"http://192.168.1.4:8080/assfinance/public/getHospitalLevel"
#define POSTDOCSTATIONURL @"http://192.168.1.4:8080/assfinance/public/getPostdoctorStationList"
#define HOSPITALLEVELURL @"http://192.168.1.4:8080/assfinance/public/getHospitalLevel"
#define HOSPITALENTERURL @"http://192.168.1.4:8080/assfinance/hospital/hospitalSignIn"
#define SIGNUPURL @"http://192.168.1.4:8080/assfinance/user/toRegister"
#define GETCHECKINURL @"http://192.168.1.4:8080/assfinance/user/sendSecurityCode"
#define LOGINURL @"http://192.168.1.4:8080/assfinance/user/login"
#define DOCTORENTERURL @"http://192.168.1.4:8080/assfinance/doctor/doctorSignIn"
#define PATIENTENTERURL @"http://192.168.1.4:8080/assfinance/patient/patientSignIn"
#define POSTCONSULTURL @"http://192.168.1.4:8080/assfinance/hospital/releaseGroupConsultation"
#define QUERYCONSULTURL @"http://192.168.1.4:8080/assfinance/hospital/getMyGroupConsultation"
#define CONSULTDETAILURL @"http://192.168.1.4:8080/assfinance/hospital/getMyGroupConsultationById"
#define GETEMPLOYURL @"http://192.168.1.4:8080/assfinance/hospital/getMyEmployInfo"
#define GETEMPLOYDETAILURL @"http://192.168.1.4:8080/assfinance/hospital/getMyEmployInfoById"
#define GETACCEPTEDURL @"http://192.168.1.4:8080/assfinance/hospital/getAcceptedResumeById"
#define GETALLRESUMEURL @"http://192.168.1.4:8080/assfinance/hospital/getAllResumeById"
#define GETDOCTORRESUMEURL @"http://192.168.1.4:8080/assfinance/hospital/getResumeByResumeId"
#define ENROLLDOCTORURL @"http://192.168.1.4:8080/assfinance/hospital/acceptResume"
#define SETCHARGEURL @"http://192.168.1.4:8080/assfinance/hospital/setPersonInCharge"
#define SENDHOSPITALINFOURL @"http://192.168.1.4:8080/assfinance/hospital/changeHospitalIntroduction"
#define SENDDOCARRANGEMENTURL @"http://192.168.1.4:8080/assfinance/hospital/releaseDoctorArrangement"
#define WITHDRAWNURL @"http://192.168.1.4:8080/assfinance/hospital/deleteEmployInfo"
#define ReleaseTypicalCaseRul @"http://192.168.1.4:8080/assfinance/hospital/releaseTypicalCase"
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
