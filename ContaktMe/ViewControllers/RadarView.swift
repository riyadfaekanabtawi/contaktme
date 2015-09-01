//
//  RadarView.swift
//  contaktme
//
//  Created by Riyad Anabtawi on 2/25/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//



import UIKit

public protocol RadarViewDelegate {
    func cancellAnimation(id : Int)
    func pushViewIsSelected(id : Int)
}

@objc public class RadarView: UIView{
   
    
   var color: UIColor = UIColor.blueColor()
     var animating: Bool = true
    

    init(frame: CGRect, color: UIColor) {
        self.color = color
        super.init(frame: frame)

    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }

    
    
    
    //var circleArray:[UIBezierPath] = [];
    
    @IBInspectable var reversedRadar:Bool = false{
        didSet{
          
        }
    }
    
    @IBInspectable var numberOfWaves:Int = 4{
        didSet{
            //setNeedsDisplay()

        }
    }
    
    @IBInspectable var radarColor: UIColor = UIColor.blueColor() {
        didSet{
            //setNeedsDisplay()
        
        }
    }
    
    @IBInspectable var innerRadius: Double = 50.0 {
        didSet{
            //setNeedsDisplay()
        
        }
    }
    
    @IBInspectable var iconImage: UIImage?{
        didSet{
            //setNeedsDisplay()
       
        }
    }
    
    @IBInspectable var iconSize: CGSize = CGSizeMake(20, 20){
        didSet{
            //setNeedsDisplay()
        
        }
    }
    
    @IBInspectable var waveWidth: CGFloat = 2 {
        didSet{
            //setNeedsDisplay()
         
        }
    }
    
    //    @IBInspectable var minWaveAlpha: CGFloat = 0.1 {
    //        didSet{
    //            //setNeedsDisplay()
    //            initialSetup()
    //        }
    //    }
    
    @IBInspectable var maxWaveAlpha: CGFloat = 1 {
        didSet{
            //setNeedsDisplay()
        
        }
        
        
    }
    
  public func startAnimation() {
        //var animation = CAAnimation()
        //animation.
        //if !animating{
        animating = true
        if layer.sublayers != nil{
            for (index,sublayer) in enumerate(layer.sublayers as! [CALayer]!) {
                if sublayer is CAShapeLayer {
                    //sublayer.opacity = 1;
                    var animation = CAKeyframeAnimation()
                    animation.keyPath = "opacity"
                    //animation.fromValue = 1
                    //animation.toValue = 0
                    animation.values = [0,0,1,0]
                    animation.duration = 2.5
                    var beginTime:Double
                    if (!reversedRadar){
                        beginTime = (Double(animation.duration)/Double(numberOfWaves + 1)) * (Double(layer.sublayers.count) - 1.0 - Double(index))
                    } else {
                        beginTime = (Double(animation.duration)/Double(numberOfWaves + 1)) * Double(index)
                    }
                    animation.keyTimes = [0, beginTime/animation.duration, beginTime/animation.duration, (beginTime + Double(animation.duration)/(Double(numberOfWaves) - 2.5))/animation.duration]
                    animation.delegate = self
                    //animation.beginTime = CFTimeInterval((Double(10)/Double(numberOfWaves + 1)) * (Double(layer.sublayers.count) - 1.0 - Double(index)))
                    //XCPCaptureValue("begin Time", animation.beginTime)
                    sublayer.addAnimation(animation, forKey: "animForLayer\(index)")
                    sublayer.opacity = 0
                    //XCPCaptureValue("animForLayer\(index)", 0)
                    //XCPCaptureValue("finishedAnimation", 0)
                }
            }
        }
        //}
    }
    
 override public func animationDidStart(anim: CAAnimation!) {
        //        for (index,sublayer) in enumerate(layer.sublayers as [CALayer]!){
        //            if sublayer.animationForKey("animForLayer\(index)") === anim {
        //                XCPCaptureValue("animForLayer\(index)", 1)
        //            }
        //        }
        
    }
    
  override public func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        
        if flag{
            //XCPCaptureValue("finishedAnimation", numberOfFinishedAnimations)
            for (index,sublayer) in enumerate(layer.sublayers as! [CALayer]!){
                //                if sublayer.animationForKey("animForLayer\(index)") != nil && sublayer.animationForKey("animForLayer\(index)") === anim {
                //
                //                    //XCPCaptureValue("animForLayer\(index)", 1)
                //                }
                
                if(index == layer.sublayers.count - 1 && animating){
                    startAnimation()
                } else {
                    restoreInitialAlphas()
                }
                
            }
        }
    }
    
    private func restoreInitialAlphas(){
        var currentAlpha = maxWaveAlpha;
        if reversedRadar {
            for _ in 1..<numberOfWaves{
                currentAlpha /= 2.5
            }
        }
        
        
        UIView.animateWithDuration(0.6, animations: { () -> Void in
            for (index,sublayer) in enumerate(self.layer.sublayers as! [CALayer]!) {
                if sublayer is CAShapeLayer {
                    sublayer.opacity = Float(currentAlpha)
                    if(self.reversedRadar){
                        currentAlpha *= 2.5
                    } else {
                        currentAlpha /= 2.5
                    }
                }
            }
        })
    }
    
 public   func stopAnimation() {
        animating = false
        initialSetup()
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    override public func layoutSubviews() {
        initialSetup()
    }
    
    public func initialSetup(){
        layer.sublayers = []
        let insetOffsetDelta = (Double(CGRectGetHeight(self.layer.bounds)/2) - innerRadius) / Double(numberOfWaves)
        //let alphaVariance = (maxWaveAlpha - minWaveAlpha) / CGFloat(numberOfWaves)
        var currentInsetOffset:CGFloat = 0;
        
        var currentAlpha = maxWaveAlpha;
        if reversedRadar {
            for _ in 1..<numberOfWaves{
                currentAlpha /= 2.5
            }
        }
        
        for index in 0..<numberOfWaves {
            var sublayer = CAShapeLayer()
            sublayer.frame = CGRectInset(self.layer.bounds, currentInsetOffset, currentInsetOffset)
            var circle = UIBezierPath(ovalInRect: CGRectInset(sublayer.bounds, waveWidth, waveWidth))
            sublayer.path = circle.CGPath
            sublayer.strokeColor = radarColor.CGColor
            sublayer.lineWidth = waveWidth
            sublayer.fillColor = UIColor.clearColor().CGColor
            sublayer.opacity = Float(currentAlpha)
            layer.addSublayer(sublayer)
            currentInsetOffset += CGFloat(insetOffsetDelta)
            if(reversedRadar){
                currentAlpha *= 2.5
            } else {
                currentAlpha /= 2.5
            }
        }
        
        if let image = iconImage {
            var imageView = UIImageView(frame: CGRectMake((self.bounds.width - iconSize.width) / 2.0, (self.bounds.height - iconSize.height) / 2.0, iconSize.width, iconSize.height))
            imageView.image = image
            self.addSubview(imageView)
        }
        
     
               startAnimation()

     
    }
    
    // Draw Rect implementation not usefull when animating its contents
    /*
    override func drawRect(rect: CGRect) {
    var context = UIGraphicsGetCurrentContext();
    let insetOffsetDelta = (Double(CGRectGetHeight(rect)/2) - innerRadius) / Double(numberOfWaves)
    let alphaVariance = (maxWaveAlpha - minWaveAlpha) / CGFloat(numberOfWaves)
    var currentInsetOffset:CGFloat = waveWidth/2;
    var currentAlpha = maxWaveAlpha;
    
    for index in 0..<numberOfWaves {
    var circle = UIBezierPath(ovalInRect: CGRectInset(rect, currentInsetOffset, currentInsetOffset))
    radarColor.setStroke()
    circle.lineWidth = waveWidth;
    circle.strokeWithBlendMode(kCGBlendModeNormal, alpha: currentAlpha)
    circleArray.append(circle)
    currentInsetOffset += CGFloat(insetOffsetDelta)
    currentAlpha /= 2.5
    }
    
    
    }
    */
}
