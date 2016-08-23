//
//  RegisterVC.swift
//  ClubTracker
//
//  Created by Mohan Singh Thagunna on 8/20/16.
//  Copyright © 2016 CreatuDevelopers. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {
    //MARK: --Outlets
    
    @IBOutlet weak var viewBody: UIView!
    @IBOutlet weak var viewTabbar: UIView!
    
    //MARK: --ViewController Property
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: -- Custom Function
    func setupView(){
        let height = UIScreen.mainScreen().bounds.size.width / 320
        print(height)
        
        let teacherMenuView = RegisterView(frame:CGRectMake(0, 0,UIScreen.mainScreen().bounds.size.width, viewBody.frame.size.height * height))
        // viewNavbar.delegate = self
        viewBody.addSubview(teacherMenuView)
        
        let tabbarView = TabbarView(frame:CGRectMake(0, 0,UIScreen.mainScreen().bounds.size.width, viewTabbar.frame.size.height * height))
        tabbarView.menuItem(["Save","Archive","All In"])
        // viewNavbar.delegate = self
        viewTabbar.addSubview(tabbarView)
    }
}
