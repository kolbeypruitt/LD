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
#define HOSID @"hospital"
#define DOCID @"doctor"
#define DISID @"disease"
#define IMAGEPREF @"http://116.228.153.157:8888/assfinance/welcome/image"
#define GETRECOMMENDURL @"http://116.228.153.157:8888/assfinance/public/getRecommanded"
#define RECOMMENDDOCURL @"http://116.228.153.157:8888/assfinance/public/recommandedDoctors"
#define CELLBORDER 10
#define RECOMMENDHOSURL @"http://116.228.153.157:8888/assfinance/public/recommandedHospitals"
#define COMMONDISURL @"http://116.228.153.157:8888/assfinance/welcome/image"
#define MULTIJOBURL @"http://116.228.153.157:8888/assfinance/public/getPolicyList"
#define COREEXPERTURL @"http://116.228.153.157:8888/assfinance/public/getImpartantDoctors"
#define DOCSEARCHURL @"http://116.228.153.157:8888/assfinance/public/searchDoctors"
#define HOSRANKURL @"http://116.228.153.157:8888/assfinance/public/getHospitalLevel"
#define POSTDOCSTATIONURL @"http://116.228.153.157:8888/assfinance/public/getPostdoctorStationList"
#define HOSPITALLEVELURL @"http://116.228.153.157:8888/assfinance/public/getHospitalLevel"
#define HOSPITALENTERURL @"http://116.228.153.157:8888/assfinance/hospital/hospitalSignIn"
#define SIGNUPURL @"http://116.228.153.157:8888/assfinance/user/toRegister"
#define GETCHECKINURL @"http://116.228.153.157:8888/assfinance/user/sendSecurityCode"
#define LOGINURL @"http://192.168.1.17:8080/assfinance/user/login"
#define DOCTORENTERURL @"http://192.168.1.17:8080/assfinance/doctor/doctorSignIn"
#define PATIENTENTERURL @"http://192.168.1.17:8080/assfinance/patient/patientSignIn"
#define POSTCONSULTURL @"http://192.168.1.17:8080/assfinance/hospital/releaseGroupConsultation"
#define QUERYCONSULTURL @"http://192.168.1.17:8080/assfinance/hospital/getMyGroupConsultation"
#define CONSULTDETAILURL @"http://192.168.1.17:8080/assfinance/hospital/getMyGroupConsultationById"
#define GETEMPLOYURL @"http://192.168.1.17:8080/assfinance/hospital/getMyEmployInfo"
#define GETEMPLOYDETAILURL @"http://192.168.1.17:8080/assfinance/hospital/getMyEmployInfoById"
#define GETACCEPTEDURL @"http://192.168.1.17:8080/assfinance/hospital/getAcceptedResumeById"
#define GETALLRESUMEURL @"http://192.168.1.17:8080/assfinance/hospital/getAllResumeById"
#define SUCCESSSTATUS @"S"
#define TABLEMARGIN 5
#define CELLMARGIN 8
#define HEADERHEIGHT 285
#define NAVBARHEIGHT 64
#define LOGINDONWNOTIFICATION @"logindown"
#define SCREENWIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREENHEIGHT ([UIScreen mainScreen].bounds.size.height)
#endif
