//
//  TeacherMenuView.swift
//  ClubTracker
//
//  Created by Mohan Singh Thagunna on 8/17/16.
//  Copyright © 2016 CreatuDevelopers. All rights reserved.
//

import UIKit

class TeacherMenuView: UIView {

    
    //MARK: --Outlets
    
    @IBOutlet var collectionView: UICollectionView!
    
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
        let nib = UINib(nibName: "TeacherMenuView", bundle: bundle)
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
         collectionView.registerNib(UINib(nibName: "TeacherMenuItemCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
    }
    //MARK: --Button Actions
    
    //MARK: --Custom Functions

}
//MARK: --Collection view delegates
extension TeacherMenuView:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize
    {
         let widthINR = (UIScreen.mainScreen().bounds.size.width - 20) / 3
        let cellSize:CGSize = CGSizeMake(widthINR, widthINR)
        return cellSize
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! TeacherMenuItemCell
        
        
        cell.backgroundColor = UIColor.yellowColor() // make cell more visible in our example project
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
}

