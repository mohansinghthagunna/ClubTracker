//
//  HomeVC.swift
//  ClubTracker
//
//  Created by Developer8 on 8/19/16.
//  Copyright © 2016 CreatuDevelopers. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    //MARK: --Outlets
    @IBOutlet var viewNavbar: UIView!
    @IBOutlet var viewTabbar: UIView!
    @IBOutlet var viewMenu: UIView!
    
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
        let height = UIScreen.mainScreen().bounds.size.width / 320
        print(height)
        let navbarView = NavbarView(frame:CGRectMake(0, 0,UIScreen.mainScreen().bounds.size.width, viewNavbar.frame.size.height * height))
       // viewNavbar.delegate = self
        viewNavbar.addSubview(navbarView)
        
        let teacherMenuView = TeacherMenuView(frame:CGRectMake(0, 0,UIScreen.mainScreen().bounds.size.width, viewMenu.frame.size.height * height))
        // viewNavbar.delegate = self
        viewMenu.addSubview(teacherMenuView)
        
        let tabbarView = TabbarView(frame:CGRectMake(0, 0,UIScreen.mainScreen().bounds.size.width, viewTabbar.frame.size.height * height))
        // viewNavbar.delegate = self
        viewTabbar.addSubview(tabbarView)
    }
    
}

