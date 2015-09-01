//
//  nearbyJobs.swift
//  contaktme
//
//  Created by Riyad Anabtawi on 3/4/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//



import UIKit

class nearbyJobs: UIViewController, iCarouselDataSource, iCarouselDelegate,JobAppDelegate {
    
    
    @IBOutlet weak var carousel: iCarousel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var sndAppView: UIView!
    var selectedIndex = -1
    var currentIndex = 0
    
    var teamData : [Dictionary<String,String>]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sndAppView.alpha=0
        self.carousel.type = iCarouselType.Custom
        
     self.titleLabel.font = UIFont(name:FONT_LIGHT, size: self.titleLabel.font.pointSize)

       self.textField.font = UIFont(name: FONT_LIGHT, size: self.textField.font.pointSize)
        
        self.cancelButton.titleLabel!.font = UIFont(name: FONT_LIGHT, size: self.cancelButton.titleLabel!.font.pointSize)
        
        self.sendButton.titleLabel!.font = UIFont(name: FONT_LIGHT, size: self.sendButton.titleLabel!.font.pointSize)
        
        
        //TODO: This should come from a service
        self.teamData = [
            [
                "name" : "Job Offer 1",
                "image" : "riyad.jpg",
                "time" : "01 Feb | 09:00 Hrs",
                "description" : "Job description, blablablablablablablabla blablablabla blablablabla \n blablablabla blablablabla blablablabla blablablabla blablablabla blablablabla blablablabla",
                "author" : "Riyad Anabtawi"
            ],
            [
               "name" : "Job Offer 2",
                "image" : "albert.png",
                "time" : "01 Feb | 09:00 Hrs",
               "description" : "Job description, blablablablablablablabla blablablabla blablablabla \n blablablabla blablablabla blablablabla blablablabla blablablabla blablablabla blablablabla",
                "author" : "Alberto Maluje"
            ],
            [
               "name" : "Job Offer 3",
                "image" : "frank.png",
                "time" : "01 Feb | 09:00 Hrs",
                "description" : "Job description, blablablablablablablabla blablablabla blablablabla  \n blablablabla blablablabla blablablabla blablablabla blablablabla blablablabla blablablabla",
                "author" : "Franklin Cruz"
            ],
            [
                "name" : "Job Offer 4",
                "image" : "isaac.png",
                "time" : "01 Feb | 09:00 Hrs",
                "description" : "Job description, blablablablablablablabla blablablabla \n blablablabla blablablabla blablablabla blablablabla blablablabla blablablabla blablablabla blablablabla",
                "author" : "Isaac Kaufman"
            ],
            [
                "name" : "Job Offer 5",
                "image" : "emrie.jpg",
                "time" : "01 Feb | 09:00 Hrs",
                "description" : "Job description, blablablablablablablabla blablablabla blablablabla \n blablablabla blablablabla blablablabla blablablabla blablablabla blablablabla blablablabla",
                "author" : "Anan Anabtawi"
            ]
            ,[
                "name" : "Job Offer 6",
                "image" : "farid.png",
                "time" : "01 Feb | 09:00 Hrs",
                "description" : "Job description, blablablablablablablabla blablablabla blablablabla blablablabla blablablabla blablablabla blablablabla blablablabla blablablabla \n blablablablablablablablablablablablablablablablablablablablablablabl \n ablablablablablablablablablablablablablablablablablablablablabla \n blablablablablablablablablablablabla",
                "author" : "Farid AlKasm"
            ],
            [
                "name" : "Job Offer 7",
                "image" : "boris.jpg",
                "time" : "01 Feb | 09:00 Hrs",
               "description" : "Job description, blablablablablablablabla blablablabla blablablabla blablablabla blablablabla blablablabla blablablabla blablablabla blablablabla blablablabla",
                "author" : "Boris Munoz"
            ],
          
        ]
        
        self.carousel.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func numberOfItemsInCarousel(carousel: iCarousel!) -> Int {
        
        
        return self.teamData.count;
    }
    
    func carousel(carousel: iCarousel!, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView! {
        return self.setupTeamCellView(view, index: index)
    }
    
    func numberOfPlaceholdersInCarousel(carousel: iCarousel!) -> Int {
        return 4 //Not sure if this is needed
    }
    
    func carousel(carousel: iCarousel!, placeholderViewAtIndex index: Int, reusingView view: UIView!) -> UIView! {
        return self.setupTeamCellView(view, index: index)
    }
    
    func setupTeamCellView( view : UIView?, index : Int ) -> UIView {
        var cell : SBTVTeamCell
      
        if ( view == nil ) {
            cell = SBTVTeamCell.create()
        }
        else {
            cell = view as! SBTVTeamCell
        }
          cell.delegate=self
        if index == self.selectedIndex {
      //      cell.checkImageView.highlighted = true
        }
        else {
        //    cell.checkImageView.highlighted = false
        }
        
        NSLog("INDEX:\(index) Current Index:  \( carousel.currentItemIndex )")
        if self.teamData.count > 0 && index >= 0 && index < self.teamData.count {
            
            cell.projectImage.image = UIImage(named: self.teamData[index]["image"]!)
            cell.titleLabel.text = self.teamData[index]["name"]
            cell.descriptionLabel.text = self.teamData[index]["description"]
            cell.timeLabel.text = self.teamData[index]["time"]
            
            cell.authorLabel.text = "By " + self.teamData[index]["author"]!
            
        }
        
        
        return cell;
    }
    
    func carousel(carousel: iCarousel!, itemTransformForOffset offset: CGFloat, baseTransform transform: CATransform3D) -> CATransform3D {
        
        let _itemWidth : CGFloat = 276.0
        let _itemHeight : CGFloat = 347.0
        //
        //        let count : CGFloat = 25.0
        let spacing : CGFloat = 1.2
        //
        //        let arc : CGFloat = CGFloat(M_PI) * CGFloat(2.0)
        //
        //        let left = _itemWidth * spacing / CGFloat(2.0)
        //
        //        let right = _itemWidth * spacing / 2.0 / CGFloat( tanf( Float(arc) / 2.0 ) ) / count
        //
        //        let radius : CGFloat = max(left, right)
        //
        //        let angle = offset / count * arc
        //
        //        return CATransform3DTranslate(transform, radius * sin(angle), 0.0, radius * cos(angle) - radius)
        //
        let absOffset = fabs(offset)
        
        let xScale = 1.0 - ( absOffset / CGFloat(6.0) )
        let yScale = 1.0 - ( absOffset / CGFloat(6.0) )
        
        NSLog("xScale: \(xScale)")
        
        var newtransform = CATransform3DTranslate(
            transform,
            (_itemWidth * offset * spacing) - ( (_itemWidth - _itemWidth * xScale) * (offset > 0 ? 1 : -1) ),
            (_itemHeight - _itemHeight * yScale ) / -2.0,
            _itemWidth * -0.3 * absOffset)
        
        NSLog("Offset: \(absOffset)")
        newtransform = CATransform3DScale(newtransform, xScale, yScale, 1.0)
        
        return newtransform
        /*
        CGFloat count = [self circularCarouselItemCount];
        CGFloat spacing = [self valueForOption:iCarouselOptionSpacing withDefault:1.0];
        CGFloat arc = [self valueForOption:iCarouselOptionArc withDefault:M_PI * 2.0];
        CGFloat radius = [self valueForOption:iCarouselOptionRadius withDefault:MAX(_itemWidth * spacing / 2.0, _itemWidth * spacing / 2.0 / tanf(arc/2.0/count))];
        CGFloat angle = [self valueForOption:iCarouselOptionAngle withDefault:offset / count * arc];
        
        if (_type == iCarouselTypeInvertedRotary)
        {
        radius = -radius;
        angle = -angle;
        }
        
        if (_vertical)
        {
        return CATransform3DTranslate(transform, 0.0, radius * sin(angle), radius * cos(angle) - radius);
        }
        else
        {
        return CATransform3DTranslate(transform, radius * sin(angle), 0.0, radius * cos(angle) - radius);
        }
        */
        
    }
    
    
    
    func carousel(carousel: iCarousel!, valueForOption option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        
        switch(option) {
        case .Wrap:
            return 1.0
        case .Spacing:
            return value * 0.85
        case .FadeMax:
            return value
        case .ShowBackfaces:
            return 0.0
        case .FadeMinAlpha:
            return value
        case .FadeMin:
            return value
        case .FadeRange:
            return value
        case
        .Angle
        ,.Arc
        ,.Tilt
        ,.OffsetMultiplier:
            return value
        case
        .Radius:
            return 10
        case .VisibleItems,
        .Count:
            return 32 //Still don't get how this number works if you know plase enlighten me
        }
        
    }
    
    func carousel(carousel: iCarousel!, didSelectItemAtIndex index: Int) {
        NSLog("Selected Item index: \(index)")
        
        
//        let newSelectedView = carousel.itemViewAtIndex(index) as SBTVTeamCell
//        newSelectedView.checkImageView.highlighted = true
//        
//        if self.selectedIndex != -1 && self.selectedIndex != index {
//            let prevSelected = carousel.itemViewAtIndex(self.selectedIndex) as SBTVTeamCell
//            prevSelected.checkImageView.highlighted = false
//        }
        
        self.selectedIndex = index
        
        
    }
    
    func carouselCurrentItemIndexDidChange(carousel: iCarousel!) {
        
        self.currentIndex = carousel.currentItemIndex
        NSLog("\(carousel.currentItemIndex) - \(self.currentIndex)")
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func userAppliedForJob(id: Int) {
        self.sndAppView.transform = CGAffineTransformMakeScale(0.01, 0.01);
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.sndAppView.transform = CGAffineTransformIdentity
             self.sndAppView.alpha=1.0
        })
        
    }
    
    
    
    
    @IBAction func dismissAppView(sender: AnyObject) {
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.sndAppView.transform = CGAffineTransformMakeScale(0.01, 0.01)
           
                self.sndAppView.alpha=0.0
        })
    }
    
    @IBAction func sendAppView(sender: AnyObject) {
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.sndAppView.transform = CGAffineTransformMakeScale(0.01, 0.01)
            self.sndAppView.transform = CGAffineTransformMakeScale(0.0, 0.0)
            self.sndAppView.alpha=0.0
            
            var alert = UIAlertController(title: "Nice!", message: "Your job application was sent. You will be contacted shortly.", preferredStyle: UIAlertControllerStyle.Alert)
                       alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                      self.presentViewController(alert, animated: true, completion: nil)
        })
    }
}
