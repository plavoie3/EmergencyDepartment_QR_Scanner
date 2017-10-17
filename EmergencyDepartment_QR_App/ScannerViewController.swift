//
//  ScannerViewController.swift
//  ED_QR_Code_Reader
//
//  Created by QA&Testing on 8/4/17.
//  Copyright © 2017 UVMMC. All rights reserved.
//

import AVFoundation
import UIKit

class ScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var video = AVCaptureVideoPreviewLayer()
    
    @IBOutlet weak var square: UIImageView!
    
    
    
    func checkPermissions() {
        let authStatus = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
        
        switch authStatus {
        case .authorized:
            setupCamera()
        case .denied:
            alertPromptToAllowCameraAccessViaSetting()
        default:
            setupCamera()
        }
    }
    
    func alertPromptToAllowCameraAccessViaSetting() {
        let alert = UIAlertController(title: "Error", message: "Camera access is required to use this feature. Allow in 'Settings' to contine.", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default))
        alert.addAction(UIAlertAction(title: "Settings", style: .cancel) { (alert) -> Void in
            UIApplication.shared.openURL(URL(string: UIApplicationOpenSettingsURLString)!)
        })
        
        present(alert, animated: true)
    }
    
    func setupCamera(){
        
        var video = AVCaptureVideoPreviewLayer()
        
        
        let session = AVCaptureSession()
        
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do
        {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            session.addInput(input)
        }
            
        catch
        {
            print ("Error")
            
            
        }
        
        
        
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
        
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        
        self.view.bringSubview(toFront: square)
        
        session.startRunning()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Scan"

        
        checkPermissions()
        
    }
    
    
    var QR_name = String()
    
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        if metadataObjects != nil && metadataObjects.count != 0
        {
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject
            {
                if object.type == AVMetadataObjectTypeQRCode
                {
                    QR_name = object.stringValue
                    
                    let alert = UIAlertController(title: QR_name, message: "Aim camera away from code, tap 'Okay' to view options for equipment", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Retake / Close", style: .default, handler: nil))
                    
                    alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {(alert: UIAlertAction!) in
                        
                        self.performSegue(withIdentifier: "device", sender: self)
                        
                        
                    }))
                    
                    present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "device"
        {
            let vc = segue.destination as! DeviceViewController
            vc.equipment = QR_name
        }
        
    }
}

