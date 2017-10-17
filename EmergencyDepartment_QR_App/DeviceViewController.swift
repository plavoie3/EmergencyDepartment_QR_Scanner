//
//  DeviceViewController.swift
//  ED_QR_Code_Reader
//
//  Created by QA&Testing on 8/16/17.
//  Copyright © 2017 UVM Medical Center. All rights reserved.
//

import UIKit

class DeviceViewController: UIViewController {
    
    // Add array of all devices to allow for error checking
    
    var equipment = String()
    
    @IBAction func video(_ sender: Any) {
        
        var url_str = String()
        if equipment == "3M Bair Hugger System"{
            url_str = "ctxmobilebrowser://bairhugger.com/3M/en_US/bair-hugger-us/normothermia-education#Z7_79L2HO02K0S440ATD5LT0FHMV7"
        }

        
        
        let url = URL(string: url_str)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            // Fallback on earlier versions
        }
    }
    
    @IBAction func instructions(_ sender: Any) {
        
        var url_str = String()
        if equipment == "3M Bair Hugger System"{
            url_str = "ctxmobilebrowser://isweb.fahc.org/IS%20Teams/interns/Shared%20Documents/ED%20QR%20Tests/bair_hugger_ed_example.pdf#page=7"
        }
        
        
        
        let url = URL(string: url_str)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            // Fallback on earlier versions
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                    
                    
        navigationItem.title = equipment
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
