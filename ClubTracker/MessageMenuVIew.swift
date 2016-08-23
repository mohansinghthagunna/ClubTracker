//
//  MessageMenuVIew.swift
//  ClubTracker
//
//  Created by Mohan Singh Thagunna on 8/22/16.
//  Copyright © 2016 CreatuDevelopers. All rights reserved.
//

import UIKit

class MessageMenuVIew: UIView {
    //MARK: --Outlets
    
    
    //MARK: --Declarations
    var view:UIView!
    
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
        let nib = UINib(nibName: "MessageMenuVIew", bundle: bundle)
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
    
    //MARK: --Custom Functions
    
}


