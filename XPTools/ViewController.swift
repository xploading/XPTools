//
//  ViewController.swift
//  XPTools
//
//  Created by QTJT on 2017/5/17.
//  Copyright © 2017年 xpLoading. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{
    
    var textField : UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textField = UITextField(frame: CGRect.init(x: 7, y: 200, width: 400, height: 50))
        textField?.borderStyle = .roundedRect
        textField?.delegate = self
        self.view.addSubview(textField!)
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let  url = "www.baidu.com"
        Rabbit.POST(urlString: url, paraments: nil) { (json) in
            print(json)
        }

        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let str = textField.text
        let result = Rabbit.isIdentityNumber(number: str!)
        
        print(result)
        return true
    }
    
    
    

}

