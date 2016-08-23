//
//  RegisterView.swift
//  ClubTracker
//
//  Created by Mohan Singh Thagunna on 8/20/16.
//  Copyright © 2016 CreatuDevelopers. All rights reserved.
//

import UIKit

class RegisterView: UIView {
    //MARK: --Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: --Declarations
    var view:UIView!
    var itm = [0,0,0,0,0,0,0,0,0,0]
    var color:UIColor = UIColor.blackColor()
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
        let nib = UINib(nibName: "RegisterView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }
    
    func setup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        addSubview(view)
        
    }
    
    //Mark: --View Property
    override func layoutSubviews() {
      tableView.registerNib(UINib(nibName: "RegisterCell", bundle: nil), forCellReuseIdentifier: "Cell")   
    }
    //MARK: --Button Actions
    func buttonInTapped(sender: UIButton!) {
        print("Button tapped in")
        if itm[sender.tag] != 1{
            itm[sender.tag] = 1
        }
        else{
            itm[sender.tag] = 0
        }
        tableView.reloadData()
    }
    func buttonAbsTapped(sender: UIButton!) {
        print("Button tapped abs")
        if itm[sender.tag] != 2{
         itm[sender.tag] = 2
        }
        else{
             itm[sender.tag] = 0
        }
         tableView.reloadData()
    }
    func buttonLateTapped(sender: UIButton!) {
        print("Button tapped late")
        if itm[sender.tag] != 3{
            itm[sender.tag] = 3
        }
        else{
            itm[sender.tag] = 0
        }
         tableView.reloadData()
    }
    //MARK: --Custom Functions
}

extension RegisterView:UITableViewDelegate,UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! RegisterCell
        cell.lblName.text = "child name \(indexPath.row + 1) "
        cell.btnIn.tag = indexPath.row
        cell.btnAbs.tag = indexPath.row
        cell.btnLate.tag = indexPath.row
        cell.btnIn.addTarget(self, action: #selector(buttonInTapped), forControlEvents: .TouchUpInside)
        cell.btnAbs.addTarget(self, action: #selector(buttonAbsTapped), forControlEvents: .TouchUpInside)
        cell.btnLate.addTarget(self, action: #selector(buttonLateTapped), forControlEvents: .TouchUpInside)
        if(color == UIColor.blackColor()){
        color = cell.btnIn.backgroundColor!
        }
         cell.btnIn.backgroundColor = color
         cell.btnAbs.backgroundColor = color
         cell.btnLate.backgroundColor = color
        if itm[indexPath.row] == 1{
            cell.btnIn.backgroundColor = cell.lblName.backgroundColor
            cell.btnIn.tintColor = UIColor.whiteColor()
        }
        else if itm[indexPath.row] == 2{
             cell.btnAbs.backgroundColor =  cell.lblName.backgroundColor
              cell.btnAbs.tintColor = UIColor.whiteColor()
        }
        else if itm[indexPath.row] == 3{
             cell.btnLate.backgroundColor = cell.lblName.backgroundColor
              cell.btnLate.tintColor = UIColor.whiteColor()
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 55
    }
}
