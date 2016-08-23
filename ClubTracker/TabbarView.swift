//
//  TabbarView.swift
//  ClubTracker
//
//  Created by Developer8 on 8/19/16.
//  Copyright © 2016 CreatuDevelopers. All rights reserved.
//

import UIKit

class TabbarView: UIView {

    //MARK: --Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: --Declarations
    var view:UIView!
    var menu:[String] = []
    
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
        let nib = UINib(nibName: "TabbarView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }
    
    func setup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        addSubview(view)
        
    }
    //MARK: --View Property
    override func layoutSubviews() {
        collectionView.registerNib(UINib(nibName: "TabbarCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
    }
    //MARK: --Button Actions
    
    //MARK: --Custom Functions
    func menuItem(menuItm:[String]){
        menu = menuItm
        collectionView.reloadData()
    }
}


//MARK: --Collection view delegates
extension TabbarView:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count
    }
    
    func collectionView(collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize
    {
        if menu.count == 0 {
            return CGSizeMake(0, 0)
        }
        let cnt:Int = menu.count
        let widthINR = (UIScreen.mainScreen().bounds.size.width - (CGFloat)(cnt - 1)) / (CGFloat)(menu.count)
         let height = (UIScreen.mainScreen().bounds.size.width * 50) / 320
        let cellSize:CGSize = CGSizeMake(widthINR, height)
        return cellSize
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! TabbarCell
        cell.lblTitle.text = menu[indexPath.row]
        cell.backgroundColor = UIColor.clearColor()
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
}
}
