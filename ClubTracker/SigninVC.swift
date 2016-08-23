//
//  SigninVC.swift
//  ClubTracker
//
//  Created by Mohan Singh Thagunna on 8/18/16.
//  Copyright © 2016 CreatuDevelopers. All rights reserved.
//

import UIKit

//MARK: --Signin View COntroller CLass
class SigninVC: UIViewController {
    
    //MARK: --Outlets
    
    @IBOutlet weak var viewSignin: UIView!
    
    
    //MARK: --ViewController Events
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    
    //MARK: --Custom Function
    func setupView(){
        let height = UIScreen.mainScreen().bounds.size.width * 213 / 320
        print(height)
        let signinView = SigninView(frame:CGRectMake(0, 0,UIScreen.mainScreen().bounds.size.width,height))
        signinView.delegate = self
        viewSignin.addSubview(signinView)
        
    }
    
}

//MARK: --Signin delegates
extension SigninVC:signinViewDelegate{
    func buttonTapped(sender: UIButton){
        if sender.tag == 90 {
            // Create the alert controller
            let alertController = UIAlertController(title: "Missing", message: "Please Insert Username And Password", preferredStyle: .Alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                NSLog("OK Pressed")
            }
//            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) {
//                UIAlertAction in
//                NSLog("Cancel Pressed")
//            }
            
            // Add the actions
            alertController.addAction(okAction)
         //   alertController.addAction(cancelAction)
            
            // Present the controller
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else{
        let secondVC = self.storyboard!.instantiateViewControllerWithIdentifier("selectClassVC") as! SelectClassVC
        self.navigationController?.pushViewController(secondVC, animated: true)
        }
    }
}