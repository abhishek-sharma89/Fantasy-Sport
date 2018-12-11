//
//  HelperClass.swift
//  REAL11
//
//  Created by mac307 on 10/12/18.
//  Copyright © 2018 mac307. All rights reserved.
//

import Foundation
import UIKit

#if Real11

#elseif RealBash

#elseif FSL

#elseif CashFantasy

#elseif CricSet

#elseif Playing11

#endif


class HelperClass : NSObject {
    
    typealias ASCompletionBlock = (_ result: NSDictionary, _ error: Error?, _ success: Bool) -> Void
    typealias ABCompletionBlock = (_ result: NSDictionary, _ message: String, _ success: String) -> Void
    
    
    
    class func isValidEmail(testStr:String) -> Bool {
        
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    class func showPopupAlertController(sender : Any?, message : String, title : String) -> Void {
        
        let alert = UIAlertController(title: title as String,
                                      message: message as String,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.view.tintColor = kThemeColor1;
        
        let OKAction = UIAlertAction(title: languageHelper.LocalString(key:"OK_Title"),
                                     style: .default, handler: nil)
        
        alert.addAction(OKAction)
        
        if (UIApplication.shared.keyWindow?.rootViewController! .isKind(of: UINavigationController.self))!{
            (sender as! UIViewController).present(alert, animated: true, completion: nil)
        }else {
            UIApplication.shared.keyWindow?.rootViewController!.present(alert, animated: true,completion: nil)
        }
    }
    
//    func myNSLog(_ givenFormat: String, _ args: CVarArg..., _ function:String = #function) {
//        let format = "\(function): \(givenFormat)"
//        withVaList(args) { NSLogv(format, $0) }
//    }
    
    func convertDateFromUTCToCurrent(strDate : String, inFormat : String, outFormat : String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = inFormat
        formatter.timeZone = TimeZone.init(abbreviation: "UTC")
        if let date = formatter.date(from: strDate) {
            formatter.dateFormat = outFormat
            formatter.timeZone = TimeZone.current
            formatter.locale = languageHelper.getLocale()
            return formatter.string(from: date)
        }else {
            return ""
        }
    }
    
    class func changeDateFormat(date:String, currentformat : String, newFormat : String) -> String {
        let dateFormator = DateFormatter()
        dateFormator.locale = languageHelper.getLocale()
        dateFormator.dateFormat = currentformat
        
        let dt = dateFormator.date(from: date)
        if (dt == nil){
            return ""
        }else{
            dateFormator.dateFormat = newFormat
            return dateFormator.string(from: dt!)
        }
    }
    
    class func getDateFromString(date:String, format : String) -> Date? {
        let dateFormator = DateFormatter()
        dateFormator.locale = languageHelper.getLocale()
        dateFormator.dateFormat = format
        
        let dt = dateFormator.date(from: date)
        if (dt == nil){
            return nil
        }else{
            return dt
        }
    }
    
    class func getStringFromDate(date:Date, format : String) -> String {
        let dateFormator = DateFormatter()
        dateFormator.locale = languageHelper.getLocale()
        dateFormator.dateFormat = format
        
        let dt = dateFormator.string(from: date)
        return dt
    }
    
    class func isAlphabaticName(_ name: String) -> Bool{
        let regex: String = "^[a-zA-Z]+$"
        let userNameTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return userNameTest.evaluate(with: name)
    }
    
    let nFormatter: NumberFormatter = {
        let _formatter = NumberFormatter()
        _formatter.numberStyle = .decimal
        _formatter.minimumFractionDigits = 3
        _formatter.maximumFractionDigits = 3
        _formatter.generatesDecimalNumbers = false
        return _formatter
    }()
    
    // MARK: Validation Methods
    
    class func isValidFirstName(_ FirstName : String) -> Bool {
        let regex: String = "^[a-z0-9_-]{2,15}$"
        let userNameTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return userNameTest.evaluate(with: FirstName)
    }
    
    class func isValidLastName(_ LastName : String) -> Bool {
        let regex: String = "^[a-z0-9_-]{2,15}$"
        let userNameTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return userNameTest.evaluate(with: LastName)
    }
    
    class func isValidMobileNumber(_ number : String) -> Bool {
        
        let stripped = number.trimmingCharacters(in: .whitespacesAndNewlines)
        if (stripped.count ) < 5 || (stripped.count ) > 17 {
            return false
        }
        let Regex: String = "^([0-9]*)$"
        //NSString *phoneRegex = @"^((\\+)|(00))[0-9]{6,10}$";
        let mobileTest = NSPredicate(format: "SELF MATCHES %@", Regex)
        return mobileTest.evaluate(with: stripped)
    }
    
    class func isValidPassword(_ password : String) -> Bool {
        let regex: String = "^(?=.*[0-9])(?=.*[A-Za-z]).{6,20}$"
        let userNameTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return userNameTest.evaluate(with: password)
    }
    
    func isAlphaNumericName(_ name: String) -> Bool{
        let stripped = name.trimmingCharacters(in: .whitespacesAndNewlines)
        if (stripped.count ) < 5 || (stripped.count ) > 30 {
            return false
        }
        let Regex: String = "^(?=.*[a-z])(?=.*[0-9])[A-Za-z0-9-!$@#%^&*()_+|~=`{}:;'<>?,.]{6,}$"
        //NSString *phoneRegex = @"^((\\+)|(00))[0-9]{6,10}$";
        let mobileTest = NSPredicate(format: "SELF MATCHES %@", Regex)
        return mobileTest.evaluate(with: stripped)
        
    }
    
    class func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    
    class func isValidEmailId(_ email: String) -> Bool {
        let laxString: String = ".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*"
        let emailRegex: String =  laxString
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    
    func saveDataToDefaults(dataObject: NSDictionary, key : String) {
        let currentDefaults = UserDefaults.standard
        let data = NSKeyedArchiver.archivedData(withRootObject: dataObject)
        currentDefaults.set(data, forKey: kAPPUSERDATA)
        currentDefaults.synchronize()
    }
    
    func fetchDataFromDefaults(with key : String)->NSDictionary {
        let currentDefaults = UserDefaults.standard
        
        let data = (currentDefaults.value(forKey: kAPPUSERDATA) as? Data)
        return NSKeyedUnarchiver.unarchiveObject(with: data! as Data) as! NSDictionary
    }
    
    
    //MARK: - WebService Methods
    
    class func requestForAllApiWithBody( param : NSDictionary,serverUrl urlString : String, showAlert isAlert : Bool, showHud isHud : Bool, andHeader isHeader : Bool ,vc : UIViewController, completionHandler : @escaping ABCompletionBlock) -> Void {
        
        var ishud = isHud
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        
        let jsonData: Data? = try? JSONSerialization.data(withJSONObject: param, options:.prettyPrinted)
        
        
        let myString = String(data: jsonData!, encoding: String.Encoding.utf8)
        
        print("Request URL: \(kBaseURL)\(urlString)")
        print("Data: \(myString!)")
        
        var request = URLRequest(url: URL(string: (kBaseURL + urlString))!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 45)
        
        request.httpMethod = "POST"
        request.httpBody = jsonData
        
        if ishud {
//            SVProgressHUD.setBackgroundColor(UIColor.white)
//            SVProgressHUD.setRingThickness(5.0)
//            SVProgressHUD.setForegroundColor(kThemeColor1)
//            SVProgressHUD.setDefaultMaskType(.black)
//            SVProgressHUD.show()
        }
        
        if isHeader {
            
            //            request.setValue(UserDefaults.standard.value(forKey: "") as? String, forHTTPHeaderField: "splalgoval")
        }
        
        if urlString != kURL_Signup {
            let lang = languageHelper.language == "en" ? "eng" : "ara";
            request.setValue(lang, forHTTPHeaderField: "language")
        }
        
        request.timeoutInterval = 45
        var postDataTask = URLSessionDataTask()
        postDataTask.priority = URLSessionDataTask.highPriority
        
        postDataTask = session.dataTask(with: request, completionHandler: { (data : Data?,response : URLResponse?, error : Error?) in
            //            var json : (Any);
            if data != nil && response != nil {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    let results = try? JSONSerialization.jsonObject(with: data!, options: [])
                    let jsonData: Data? = try? JSONSerialization.data(withJSONObject: results! , options: .prettyPrinted)
                    let myString = String(data: jsonData!, encoding: String.Encoding.utf8)
                    print("Result: \(myString ?? "")")
                    
                    let dict : NSDictionary = (json as! NSDictionary).value(forKey: "response") as! NSDictionary;
                    let status = "\((dict ).value(forKey: "status") ?? "false")"
                    let message = (dict ).value(forKey: "message") as? String ?? "Request failed."
//                    SVProgressHUD.dismiss()
                    ishud = false
                    if status == "1" {
                        let data = (dict ).value(forKey: "data") as? NSDictionary  ?? [:]
                        completionHandler(data, message, status)
                    } else {
                        completionHandler([:], message, status)
                    }
                }catch {
                    print(error.localizedDescription)
                    if isAlert {
                        //                        HelperClass.showErrorMessage(msg: languageHelper.LocalString(key: "jsonError"), on: vc)
                        HelperClass.showPopupAlertController(sender: vc, message: languageHelper.LocalString(key: "jsonError"), title: kAPPName)
                    }
                }
            }else if error != nil {
                print((error?.localizedDescription)!)
                
                if isAlert {
                    completionHandler([:], languageHelper.LocalString(key: "failError"), "0")
                    //                      HelperClass.showPopupAlertController(sender: vc, message: (error?.localizedDescription)!, title: kAPPName)
                }
            }else {
                if isAlert {
                    completionHandler([:],  languageHelper.LocalString(key: "unknownError") , "0")
                    //                    HelperClass.showPopupAlertController(sender: vc, message: "Request failed with unknown error.", title: kAPPName)
                }
            }
            if ishud {
//                SVProgressHUD.dismiss()
            }
        })
        postDataTask.resume()
    }
    
    class func requestApiWithBody( param : NSDictionary,serverUrl urlString : String, showAlert isAlert : Bool, showHud isHud : Bool, andHeader isHeader : Bool ,vc : UIViewController, completionHandler : @escaping ABCompletionBlock) -> URLSessionDataTask {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        
        let jsonData: Data? = try? JSONSerialization.data(withJSONObject: param, options:.prettyPrinted)
        
        
        let myString = String(data: jsonData!, encoding: String.Encoding.utf8)
        
        print("Request URL: \(kBaseURL)\(urlString)")
        print("Data: \(myString!)")
        
        var request = URLRequest(url: URL(string: (kBaseURL + urlString))!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 45)
        
        request.httpMethod = "POST"
        request.httpBody = jsonData
        
        if isHud {
//            SVProgressHUD.setBackgroundColor(UIColor.white)
//            SVProgressHUD.setRingThickness(5.0)
//            SVProgressHUD.setForegroundColor(kThemeColor1)
//            SVProgressHUD.setDefaultMaskType(.black)
//            SVProgressHUD.show()
        }
        
        if isHeader {
            
            //            request.setValue(UserDefaults.standard.value(forKey: "") as? String, forHTTPHeaderField: "splalgoval")
        }
        
        if urlString != kURL_Signup {
            let lang = languageHelper.language == "en" ? "eng" : "ara";
            request.setValue(lang, forHTTPHeaderField: "language")
        }
        
        request.timeoutInterval = 45
        var postDataTask = URLSessionDataTask()
        postDataTask.priority = URLSessionDataTask.highPriority
        
        postDataTask = session.dataTask(with: request, completionHandler: { (data : Data?,response : URLResponse?, error : Error?) in
            //            var json : (Any);
            if data != nil && response != nil {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    //                    let results = try? JSONSerialization.jsonObject(with: data!, options: [])
                    let jsonData: Data? = try? JSONSerialization.data(withJSONObject: json , options: .prettyPrinted)
                    let myString = String(data: jsonData!, encoding: String.Encoding.utf8)
                    print("Result: \(myString ?? "")")
                    
                    let dict : NSDictionary = (json as! NSDictionary).value(forKey: "response") as! NSDictionary;
                    let status = "\((dict ).value(forKey: "status") ?? "false")"
                    let message = (dict ).value(forKey: "message") as? String ?? "Request failed."
                    if status == "1" {
                        let data = (dict ).value(forKey: "data") as? NSDictionary  ?? [:]
                        completionHandler(data, message, status)
                    } else {
                        completionHandler([:], message, status)
                    }
                }catch {
                    print(error.localizedDescription)
                    if isAlert {
                        HelperClass.showPopupAlertController(sender: vc, message: languageHelper.LocalString(key: "jsonError"), title: kAPPName);
                    }
                }
            }else if error != nil {
                print((error?.localizedDescription)!)
                
                if isAlert {
                    HelperClass.showPopupAlertController(sender: vc, message: languageHelper.LocalString(key: "failError"), title: kAPPName);
                }
            }else {
                if isAlert {
                    HelperClass.showPopupAlertController(sender: vc, message: languageHelper.LocalString(key: "unknownError"), title: kAPPName);
                }
            }
            if isHud {
//                SVProgressHUD.dismiss()
            }
        })
        postDataTask.resume()
        return postDataTask
    }
    
    class func formRequestApiWithBody( param : NSDictionary, urlString : NSString, mediaData : UIImage?, isHeader : Bool , showAlert isAlert : Bool, showHud isHud : Bool, vc : UIViewController, completionHandler : @escaping ABCompletionBlock) -> Void {
        if isHud {
//            SVProgressHUD.show()
        }
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        
        let jsonData: Data? = try? JSONSerialization.data(withJSONObject: param, options:.prettyPrinted)
        let myString = String(data: jsonData!, encoding: String.Encoding.utf8)!
        
        print("Request URL: \((kBaseURL + (urlString as String)))")
        print("Data: \(String(describing: myString))")
        
        var request = URLRequest(url: URL(string: (kBaseURL + (urlString as String)))!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 45)
        
        request.httpMethod = "POST"
        
        if isHeader {
            //            request.setValue(UserDefaults.standard.value(forKey: "") as? String, forHTTPHeaderField: "splalgoval")
        }
        
        //        if (urlString as String) != kURL_Signup {
        //            let lang = languageHelper.language == "en" ? "eng" : "ara";
        //            request.setValue(lang, forHTTPHeaderField: "language")
        //        }
        
        var body = Data()
        let boundary: String = "0xKhTmLbOuNdArY"
        let kNewLine: String = "\r\n"
        let contentType: String = "multipart/form-data; boundary=\(boundary)"
        request.setValue(contentType, forHTTPHeaderField: "Content-Type")
        
        // Add the parameters from the dictionary to the request body
        
        body.append("--\(boundary)\(kNewLine)".data(using: String.Encoding.utf8)!)
        body.append("Content-Disposition: form-data; name=data".data(using: String.Encoding.utf8)!)
        // For simple data types, such as text or numbers, there's no need to set the content type
        body.append("\(kNewLine)\(kNewLine)".data(using: String.Encoding.utf8)!)
        body.append(jsonData!)
        body.append(kNewLine.data(using: String.Encoding.utf8)!)
        
        
        // Add the image to the request body
        if mediaData != nil {
            
            let datas = mediaData!.jpegData(compressionQuality: 0.5)
            body.append("--\(boundary)\(kNewLine)".data(using: String.Encoding.utf8)!)
            body.append("Content-Disposition: form-data; name=image; filename=file_name.jpeg; Content-Type:image/jpeg;".data(using: String.Encoding.utf8)!)
            body.append("\(kNewLine)\(kNewLine)".data(using: String.Encoding.utf8)!)
            body.append(datas!)
            body.append(kNewLine.data(using: String.Encoding.utf8)!)
            
        }
        // Add the terminating boundary marker to signal that we're at the end of the request body
        body.append("--\(boundary)--".data(using: String.Encoding.utf8)!)
        
        request.httpBody = body;
        var postDataTask = URLSessionDataTask()
        postDataTask.priority = URLSessionTask.highPriority
        
        postDataTask = session.dataTask(with: request, completionHandler: { (data : Data?,response : URLResponse?, error : Error?) in
            //            var json : (Any);
            if data != nil && response != nil {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    let results = try? JSONSerialization.jsonObject(with: data!, options: [])
                    let jsonData: Data? = try? JSONSerialization.data(withJSONObject: results! , options: .prettyPrinted)
                    let myString = String(data: jsonData!, encoding: String.Encoding.utf8)
                    print("Result: \(myString ?? "")")
                    
                    let dict : NSDictionary = (json as! NSDictionary).value(forKey: "response") as! NSDictionary;
                    let status = "\((dict ).value(forKey: "status") ?? "0")"
                    let message = (dict ).value(forKey: "message") as? String ?? "Request failed."
                    if status == "1" {
                        let data = (dict ).value(forKey: "data") as? NSDictionary ?? [:]
                        completionHandler(data, message, status)
                    } else {
                        completionHandler([:], message, status)
                    }
                }catch {
                    print(error.localizedDescription)
                    
                    if isAlert {
                        //                        HelperClass.showErrorMessage(msg: error.localizedDescription, on: vc)
                        HelperClass.showPopupAlertController(sender: vc, message: languageHelper.LocalString(key: "jsonError"), title: kAPPName);
                    }
                }
                if isHud {
//                    SVProgressHUD.dismiss()
                }
            }else if error != nil {
                if isHud {
//                    SVProgressHUD.dismiss()
                }
                print((error?.localizedDescription)!)
                if isAlert {
                    //                    HelperClass.showErrorMessage(msg: (error?.localizedDescription)!, on: vc)
                    HelperClass.showPopupAlertController(sender: vc, message: languageHelper.LocalString(key: "failError"), title: kAPPName)
                }
            }else {
                if isHud {
//                    SVProgressHUD.dismiss()
                }
                if isAlert {
                    //                    HelperClass.showErrorMessage(msg: "Request failed with unknown error.", on: vc)
                    HelperClass.showPopupAlertController(sender: vc, message: languageHelper.LocalString(key: "unknownError"), title: kAPPName)
                }
            }
            if isHud {
//                SVProgressHUD.dismiss()
            }
        })
        postDataTask.resume()
        
    }
    
}
