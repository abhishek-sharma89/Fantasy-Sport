//
//  String Constants.swift
//  Sahel
//
//  Created by Octal on 02/11/17.
//  Copyright © 2017 Octal. All rights reserved.
//

import Foundation
import UIKit


#if Real11
let kThemeColor1        = UIColor(red:0.12, green:0.22, blue:0.38, alpha:1.0)
let kThemeColor2        = UIColor(red:0.12, green:0.59, blue:0.81, alpha:1.0)
#elseif RealBash
let kThemeColor1        = UIColor(red:1.00, green:0.37, blue:0.00, alpha:1.0)
let kThemeColor2        = UIColor(red:0.43, green:0.76, blue:0.78, alpha:1.0)
#elseif FSL
let kThemeColor1        = UIColor(red:1.00, green:0.37, blue:0.00, alpha:1.0)
let kThemeColor2        = UIColor(red:0.43, green:0.76, blue:0.78, alpha:1.0)
#elseif CashFantasy
let kThemeColor1        = UIColor(red:1.00, green:0.37, blue:0.00, alpha:1.0)
let kThemeColor2        = UIColor(red:0.43, green:0.76, blue:0.78, alpha:1.0)
#elseif CricSet
let kThemeColor1        = UIColor(red:1.00, green:0.37, blue:0.00, alpha:1.0)
let kThemeColor2        = UIColor(red:0.43, green:0.76, blue:0.78, alpha:1.0)
#elseif Playing11
let kThemeColor1        = UIColor(red:0.97, green:0.00, blue:0.09, alpha:1.0)
let kThemeColor2        = UIColor(red:0.15, green:0.45, blue:0.01, alpha:1.0)
#endif





// App URL
#if Real11
let kBaseURL : String                       =   "http://56.octallabs.com/real11/web_services4/"
#elseif RealBash
let kBaseURL : String                       =   "http://56.octallabs.com/realbash/web_services4/"
#elseif FSL
let kBaseURL : String                       =   "http://56.octallabs.com/fsl/web_services4/"
#elseif CashFantasy
let kBaseURL : String                       =   "http://56.octallabs.com/cashfantasy/web_services4/"
#elseif CricSet
let kBaseURL : String                       =   "http://56.octallabs.com/cricset/web_services4/"
#elseif Playing11
let kBaseURL : String                       =   "http://56.octallabs.com/playing11/web_services4/"
#endif



let kURL_Social_Login : String              =   "social_login"
let kURL_Signup : String                    =   "signup"
let kURL_Resend_Otp : String                =   "resend_otp"
let kURL_Verify_Otp : String                =   "otp_verification"
let kURL_Login : String                     =   "login"
let kURL_Forget_pass : String               =   "forgot_password"
let kURL_MobileVerify_Otp                   =   "mobile_otp_confirmation"
let kURL_Mobile_Resend_Otp                  =   "mobile_resend_otp"






//MARK: AppConstant Text
#if Real11
let kAPPName = "Real11"
#elseif RealBash
let kAPPName = "Real Bash"
#elseif FSL
let kAPPName = "FSL"
#elseif CashFantasy
let kAPPName = "Cash Fantasy"
#elseif CricSet
let kAPPName = "Cric Set"
#elseif Playing11
let kAPPName = "Playing 11"
#endif


let kAPPUSERDATA = "user_data"
let kAPP_DEVICE_ID = "device_id"
let kAPP_DEVICETYPE = "iphone"

let kAPP_SOCIAL_LOG = "Social_Login"

let kAPP_FIRSTOPEN = "first_open"
let kAPP_IS_LOGEDIN = "is_loggedIn"

let kAPP_USERNAME = "user_name"
let kAPP_PASSWORD = "password"


