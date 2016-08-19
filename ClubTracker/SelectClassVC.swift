//
//  SelectClassVC.swift
//  ClubTracker
//
//  Created by Mohan Singh Thagunna on 8/18/16.
//  Copyright © 2016 CreatuDevelopers. All rights reserved.
//

import UIKit

class SelectClassVC: UIViewController {

    
    //MARK: --Outlets
    @IBOutlet weak var viewSelectClass: UIView!
    
    
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
        let height = UIScreen.mainScreen().bounds.size.width * 264 / 320
        print(height)
        let selectClass = SelectClassView(frame:CGRectMake(0, 0,UIScreen.mainScreen().bounds.size.width, height))
        selectClass.delegate = self
        viewSelectClass.addSubview(selectClass)
        
    }
    
}

//MARK: --selectClass View Delegates
extension SelectClassVC: selectClassViewDelegate{
    func buttonTapped(sender: UIButton) {
        let secondVC = self.storyboard!.instantiateViewControllerWithIdentifier("homeVC") as! HomeVC
        self.navigationController?.pushViewController(secondVC, animated: true)

    }
}