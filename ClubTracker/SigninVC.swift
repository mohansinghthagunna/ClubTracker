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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let secondVC = self.storyboard!.instantiateViewControllerWithIdentifier("selectClassVC") as! SelectClassVC
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}