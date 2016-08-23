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
    
    //MARK:Declarations
    var titles:String? = nil
    //MARK: --ViewController Events
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
       
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.title = titles
        
    }
    
    //MARK: --Custom Function
    func setupView(){
        let height = UIScreen.mainScreen().bounds.size.width / 320
        print(height)

        let teacherMenuView = TeacherMenuView(frame:CGRectMake(0, 0,UIScreen.mainScreen().bounds.size.width, viewMenu.frame.size.height * height))
        teacherMenuView.delegate = self
        viewMenu.addSubview(teacherMenuView)
        
        let tabbarView = TabbarView(frame:CGRectMake(0, 0,UIScreen.mainScreen().bounds.size.width, viewTabbar.frame.size.height * height))
        tabbarView.menuItem(["HELP","FAQ","TUTORIAL"])
        // viewNavbar.delegate = self
        viewTabbar.addSubview(tabbarView)
    }
    
}

extension HomeVC:menuViewDelegates{
    func didMenuSelect(menuIndex: Int) {
        switch menuIndex {
        case 0:
            let secondVC = self.storyboard!.instantiateViewControllerWithIdentifier("registerVC") as! RegisterVC
            self.navigationController?.pushViewController(secondVC, animated: true)
            break
        case 1:
            let secondVC = self.storyboard!.instantiateViewControllerWithIdentifier("demoVC") 
            self.navigationController?.pushViewController(secondVC, animated: true)
            break
        case 2:
            let secondVC = self.storyboard!.instantiateViewControllerWithIdentifier("demoVC")
            self.navigationController?.pushViewController(secondVC, animated: true)
            break
        case 3:
            let secondVC = self.storyboard!.instantiateViewControllerWithIdentifier("demoVC")
            self.navigationController?.pushViewController(secondVC, animated: true)
            break
        case 4:
            let secondVC = self.storyboard!.instantiateViewControllerWithIdentifier("demoVC")
            self.navigationController?.pushViewController(secondVC, animated: true)
            break
        case 5:
            let secondVC = self.storyboard!.instantiateViewControllerWithIdentifier("demoVC")
            self.navigationController?.pushViewController(secondVC, animated: true)
            break
        case 6:
            let secondVC = self.storyboard!.instantiateViewControllerWithIdentifier("demoVC")
            self.navigationController?.pushViewController(secondVC, animated: true)
            break
        case 7:
            let secondVC = self.storyboard!.instantiateViewControllerWithIdentifier("demoVC")
            self.navigationController?.pushViewController(secondVC, animated: true)
            break
        case 8:
            let secondVC = self.storyboard!.instantiateViewControllerWithIdentifier("demoVC")
            self.navigationController?.pushViewController(secondVC, animated: true)
            break
        default:
            break
        }
    }
}