//  Rabbit.swift
//  XPTools
//
//  Created by QTJT on 2017/5/17.
//  Copyright © 2017年 xpLoading. All rights reserved.
//

import UIKit
let BaiscURL = URL(string: "http://192.168.1.178:8080/CrowdFunding/api/")






/// 整合工具类
class Rabbit: NSObject {
    
    
//  MARK:----------正则表达式判断
    
    /// 验证手机号合法性
    static func isMobileNumber(mobile:String)->Bool
    {
        let regex = "^1[3578]\\d{9}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return  predicate.evaluate(with: mobile)
        
    }
    /// 验证email合法性
    static func isEmailAddress(email:String)->Bool
    {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,5}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: email)
    }
    /// 验证身份证号合法性
    static func isIdentityNumber(number:String)->Bool
    {
        let regex = "^\\d{14}[xX]|\\d{18}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: number)
    }
//  MARK:----------弹框相关

    /** 通用弹框创建AlertController
     
     * - Parameters:
     * - title:   alert显示的内容
     * - handler: 点击确定后执行的方法,如果为nil则不执行任何操作并且不显示取消按钮
     */
    static func createAlertWith(title:String,handler: ((UIAlertAction)->Void)?)->UIAlertController
    {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let execute = UIAlertAction(title: "确定", style: .default, handler: handler)
        if handler != nil
        {
            let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            alert.addAction(cancel)
        }
        alert.addAction(execute)
        return alert
    }
//  MARK:----------网络请求相关
    
    private static let manager = AFHTTPSessionManager(baseURL: BaiscURL)
    static func share()->AFHTTPSessionManager{
        let set = Set<String>(arrayLiteral: "text/html","text/plain","text/json","application/json", "text/javascript")
        manager.responseSerializer.acceptableContentTypes = set
        return manager
    }
    /** POST请求*/
    static func POST(urlString:String,paraments:Any?,successBack:@escaping (_ json:Any)->Void,failBack:@escaping (_ error:Any)->Void){
        
        Rabbit.share().post(urlString, parameters: paraments, progress: nil, success: { (task, json) in
            
            successBack(json as Any)
        }) { (task, error) in
            print("异常的请求接口:\t",manager.baseURL as Any,urlString)
            print("异常的请求参数:\t",paraments as Any)
            print("异常原因:\t",error)
            failBack(error)
        }
    }
    /// GET 请求
    static func GET(urlString:String,paraments:Any?,successBack:@escaping (_ json:Any)->Void,failBack:@escaping (_ error:Any)->Void)
    {
        Rabbit.share().get(urlString, parameters: paraments, progress: nil, success: { (task, json) in
            successBack(json as Any)
        }) { (task, error) in
            print("异常的请求接口:\t",manager.baseURL as Any,urlString)
            print("异常的请求参数:\t",paraments as Any)
            print("异常原因:\t",error)
            failBack(error)
        }
    }
    
    
    
}



















