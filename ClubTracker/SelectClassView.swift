//
//  SelectClassView.swift
//  ClubTracker
//
//  Created by Mohan Singh Thagunna on 8/17/16.
//  Copyright © 2016 CreatuDevelopers. All rights reserved.
//

import UIKit

//MARK: --Protocol delegate
protocol selectClassViewDelegate{
    func buttonTapped(sender: UIButton)
}
//MARK: --SelectClass View
class SelectClassView: UIView {

    //MARK: --Outlets
    
    @IBOutlet weak var btnSelectClass: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: --Declarations
    var view:UIView!
    var delegate:selectClassViewDelegate?
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
        let nib = UINib(nibName: "SelectClassView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }
    
    func setup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        addSubview(view)
        
    }
    
    //MARK: --View Events
    override func layoutSubviews() {
       // tableView.registerNib(UINib(nibName: "BankListCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
       // tableView.hidden = true
    
    }
    
    //MARK: --Button Actions
    @IBAction func buttonTapped(sender: AnyObject) {
        if sender.tag == 0{
            if tableView.hidden {
        tableView.reloadData()
        tableView.hidden = false
            }
            else{
                tableView.hidden = true
            }
        }
        else{
            if btnSelectClass.titleLabel?.text != "Select Class"{
                 (sender as! UIButton).tag = 9
            delegate?.buttonTapped(sender as! UIButton)
            }
            else{
                (sender as! UIButton).tag = 90
                delegate?.buttonTapped(sender as! UIButton)
            }
        }
    }
    //MARK: --Custom Functions

}

//MARK: --TableView delegates
extension SelectClassView:UITableViewDelegate,UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        cell.textLabel!.text = "Class : \(indexPath.row)"
        cell.textLabel?.textColor = UIColor.blackColor()
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        btnSelectClass.setTitle("Class : \(indexPath.row)", forState: .Normal)
        tableView.hidden = true
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
}