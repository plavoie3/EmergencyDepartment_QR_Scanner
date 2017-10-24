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
    
    
    @IBAction func instructions(_ sender: Any) {
        
        
        let newString = equipment.replacingOccurrences(of: "http://", with: "", options: .literal, range: nil)
        
        var url_str = String()


        url_str = "ctxmobilebrowser://" + newString
        print(url_str)
    
        
        
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
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
