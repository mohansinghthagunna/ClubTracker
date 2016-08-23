//
//  SigninView.swift
//  ClubTracker
//
//  Created by Mohan Singh Thagunna on 8/17/16.
//  Copyright © 2016 CreatuDevelopers. All rights reserved.
//

import UIKit

//MARK: --Protocol delegates
protocol signinViewDelegate {
    func buttonTapped(sender: UIButton)
}

//MARK: --SigninView Class
class SigninView: UIView {

    
    //MARK: --Outlets
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!

    //MARK: --Declarations
    var view:UIView!
    var delegate:signinViewDelegate?
    //MARK: --View Setup
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass:self.dynamicType)
        let nib = UINib(nibName: "SigninView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }
    
    func setup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        addSubview(view)
        
    }
    
    //MARK: --Button Actions

    @IBAction func signinButton_Tapped(sender: AnyObject) {
      
        if (txtUserName.text != "" && txtPassword.text != ""){
            (sender as! UIButton).tag = 9
        self.delegate?.buttonTapped(sender as! UIButton)
        }
        else{
            (sender as! UIButton).tag = 90
            
            self.delegate?.buttonTapped(sender as! UIButton)
           
        }
    }
    //MARK: --Custom Functions

}
