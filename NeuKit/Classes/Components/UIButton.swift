//
//  UIButton.swift
//  NeuKit
//
//  Created by Vincenzo Romano on 08/06/2020.
//

import UIKit

@IBDesignable
extension UIButton {
    
    struct ButtonParams {
        static var hapticLevel          = [String:Int]()        //0: disabled; 1: light; 2: medium; 3: heavy light; 4: soft; 5: rigid (4 - 5 only iOS 13)
        static var isToggle             = [String:Bool]()
        static var normalColor          = [String:UIColor]()
        static var highligthColor       = [String:UIColor]()
    }
    
    @IBInspectable
    public var hapticLevel: Int
    {
        set (hapticLevel) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            ButtonParams.hapticLevel[tmpAddress] = hapticLevel
        }

        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return ButtonParams.hapticLevel[tmpAddress] ?? 0
        }
    }
    
    @IBInspectable
    public var isToggle: Bool
    {
        set (isToggle) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            ButtonParams.isToggle[tmpAddress] = isToggle
        }

        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return ButtonParams.isToggle[tmpAddress] ?? true
        }
    }
    
    @IBInspectable
    public var normalColor: UIColor
    {
        set (normalColor) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            ButtonParams.normalColor[tmpAddress] = normalColor
        }

        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return ButtonParams.normalColor[tmpAddress] ?? UIColor.black
        }
    }
    
    @IBInspectable
    public var highligthColor: UIColor
    {
        set (highligthColor) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            ButtonParams.highligthColor[tmpAddress] = highligthColor
        }

        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return ButtonParams.highligthColor[tmpAddress] ?? UIColor.black
        }
    }
    
    open override func layoutSubviews() {
        let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
        if(Params.active[tmpAddress] == true){
            self.backgroundColor = UIColor.clear;
        }
    }
    
    @objc open override func draw(_ rect: CGRect) {
        super.draw(rect);
        
        let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
        if(Params.active[tmpAddress] == true){
            setupShadows()
            self.backgroundColor = UIColor.clear
        }
    }

    open func setupShadows() {
        var shadowLayerDark:CAShapeLayer = CAShapeLayer();
        var shadowLayerLight:CAShapeLayer = CAShapeLayer();
        var hasDark = false;
        var hasLight = false;
        if(self.layer.sublayers != nil) {
            for item in self.layer.sublayers! {
                if item.name == "shadowDark" {
                    shadowLayerDark = item as! CAShapeLayer
                    hasDark = true;
                }
                if item.name == "shadowLight" {
                    shadowLayerLight = item as! CAShapeLayer
                    hasLight = true;
                }
            }
        }

        let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
        
        var corners:UIRectCorner = UIRectCorner()
        
        cornerRadius = (Params.cornerRadius[tmpAddress] != nil) ? Params.cornerRadius[tmpAddress]! : 0.0
        shadowRadius = (Params.shadowRadius[tmpAddress] != nil) ? Params.shadowRadius[tmpAddress]! : 4.0
        
        if(Params.cornersLeft[tmpAddress] != nil) {
            if(Params.cornersLeft[tmpAddress] == true){
                corners.insert(.topLeft);
                corners.insert(.bottomLeft);
            }
        }else{
            corners.insert(.topLeft);
            corners.insert(.bottomLeft);
        }
        
        if(Params.cornersRight[tmpAddress] != nil) {
            if(Params.cornersRight[tmpAddress] == true){
                corners.insert(.topRight);
                corners.insert(.bottomRight);
            }
        }else{
            corners.insert(.topRight);
            corners.insert(.bottomRight);
        }
        
        var bgColor:UIColor?;
        if(self.backgroundColor != nil){
            bgColor = self.backgroundColor!;
            if(ButtonParams.normalColor[tmpAddress] != nil) {
                bgColor = ButtonParams.normalColor[tmpAddress]!;
            }
        }
        
        if(!hasDark) {
            shadowLayerDark.name = "shadowDark"
            self.layer.insertSublayer(shadowLayerDark, below: self.imageView!.layer)
            let content:CAShapeLayer = CAShapeLayer()
            content.frame = bounds
            content.backgroundColor = (bgColor != nil) ? bgColor!.cgColor : UIColor.clear.cgColor;
            roundCorners(layer:content, corners: corners, radius: cornerRadius)
            content.masksToBounds = true;
            shadowLayerDark.addSublayer(content)
        }
        shadowLayerDark.frame = bounds
        shadowLayerDark.shadowRadius = 4
        shadowLayerDark.shadowOpacity = 1
        
        var reverse:CGFloat = 1.0;
        if(Params.reverse[tmpAddress] != nil){
            reverse = (Params.reverse[tmpAddress]!) ? -1.0 : 1.0;
        }else{
            reverse = 1.0;
        }
        
        let darkOffsetX:CGFloat = (Params.shadowDarkOffsetX[tmpAddress] != nil) ? Params.shadowDarkOffsetX[tmpAddress]! : 2.0
        let darkOffsetY:CGFloat = (Params.shadowDarkOffsetY[tmpAddress] != nil) ? Params.shadowDarkOffsetY[tmpAddress]! : 2.0
        shadowLayerDark.shadowOffset = CGSize( width: reverse*darkOffsetX, height: reverse*darkOffsetY)
        if(self.isEnabled){
            shadowLayerDark.shadowColor = (Params.darkShadowColor[tmpAddress] != nil) ? Params.darkShadowColor[tmpAddress]?.cgColor : UIColor(red: 8/255, green: 8/255, blue: 33/255, alpha: 0.12).cgColor
        }else{
            shadowLayerDark.shadowColor = UIColor.clear.cgColor;
        }
        
        if(!hasLight) {
            shadowLayerLight.name = "shadowLight"
            self.layer.insertSublayer(shadowLayerLight, below: self.imageView!.layer)
            let content:CAShapeLayer = CAShapeLayer()
            content.frame = bounds
            content.backgroundColor = (bgColor != nil) ? bgColor!.cgColor : UIColor.clear.cgColor;
            
            roundCorners(layer:content, corners: corners, radius: Params.cornerRadius[tmpAddress]!)
            content.masksToBounds = true;
            shadowLayerLight.addSublayer(content)
        }
        shadowLayerLight.frame = bounds
        shadowLayerLight.shadowRadius = 4
        shadowLayerLight.shadowOpacity = 1
        
        let lightOffsetX:CGFloat = (Params.shadowLightOffsetX[tmpAddress] != nil) ? Params.shadowLightOffsetX[tmpAddress]! : 2.0
        let lightOffsetY:CGFloat = (Params.shadowLightOffsetY[tmpAddress] != nil) ? Params.shadowLightOffsetY[tmpAddress]! : 2.0
        shadowLayerLight.shadowOffset = CGSize( width: reverse*lightOffsetX, height: reverse*lightOffsetY)
        if(self.isEnabled){
            shadowLayerLight.shadowColor = (Params.lightShadowColor[tmpAddress] != nil) ? Params.lightShadowColor[tmpAddress]?.cgColor : UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.7).cgColor
        }else{
            shadowLayerLight.shadowColor = UIColor.clear.cgColor;
        }
        
        self.backgroundColor = UIColor.clear;

    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
        
        if(Params.active[tmpAddress] != true){
            super.touchesBegan(touches, with: event)
            return;
        }
        
        if(Params.active[tmpAddress] == true){
            Params.reverse[tmpAddress] = (Params.reverse[tmpAddress] != nil) ? !Params.reverse[tmpAddress]! : true
            setupShadows()
        }
        
        var bgColor:UIColor = self.backgroundColor!;
        if(ButtonParams.normalColor[tmpAddress] != nil) {
            bgColor = ButtonParams.normalColor[tmpAddress]!;
        }
        
        var fgColor:UIColor = self.backgroundColor!;
        if(ButtonParams.highligthColor[tmpAddress] != nil) {
            fgColor = ButtonParams.highligthColor[tmpAddress]!;
        }
        
        var isToggle = false;
        if(ButtonParams.isToggle[tmpAddress] != nil){
            isToggle = (ButtonParams.isToggle[tmpAddress] != nil) ? ButtonParams.isToggle[tmpAddress]! : false
        }
        
        if(isToggle){
            self.isSelected = !self.isSelected;
            if(self.isSelected){
                for item in self.layer.sublayers! {
                    if item.name == "shadowDark" {
                        item.sublayers![0].backgroundColor = fgColor.cgColor;
                    }
                    if item.name == "shadowLight" {
                        item.sublayers![0].backgroundColor = fgColor.cgColor;
                    }
                }
            }else{
                for item in self.layer.sublayers! {
                    if item.name == "shadowDark" {
                        item.sublayers![0].backgroundColor = bgColor.cgColor;
                    }
                    if item.name == "shadowLight" {
                        item.sublayers![0].backgroundColor = bgColor.cgColor;
                    }
                }
            }
        }
        
        if(ButtonParams.hapticLevel[tmpAddress] != nil) {
            if(ButtonParams.hapticLevel[tmpAddress] != 0) {
                let force:UIImpactFeedbackGenerator.FeedbackStyle = UIImpactFeedbackGenerator.FeedbackStyle(rawValue: ButtonParams.hapticLevel[tmpAddress]!-1)!
                UIImpactFeedbackGenerator(style: force).impactOccurred()
            }
        }
        super.touchesBegan(touches, with: event)
    }

    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
        
        if(Params.active[tmpAddress] == false){
            super.touchesEnded(touches, with: event)
            return;
        }
        
        var isToggle = false;
        if(ButtonParams.isToggle[tmpAddress] != nil){
            isToggle = (ButtonParams.isToggle[tmpAddress] != nil) ? ButtonParams.isToggle[tmpAddress]! : false
        }
        
        if(Params.active[tmpAddress] == true){
            if(!isToggle){
                Params.reverse[tmpAddress] = (Params.reverse[tmpAddress] != nil) ? !Params.reverse[tmpAddress]! : false
                setupShadows()
            }
        }
        
        super.touchesEnded(touches, with: event)
    }

    override open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
        
        if(Params.active[tmpAddress] == false){
            super.touchesCancelled(touches, with: event)
            return;
        }
        
        var isToggle = false;
        if(ButtonParams.isToggle[tmpAddress] != nil){
            isToggle = (ButtonParams.isToggle[tmpAddress] != nil) ? ButtonParams.isToggle[tmpAddress]! : false
        }
        
        if(Params.active[tmpAddress] == true){
            if(!isToggle){
                Params.reverse[tmpAddress] = (Params.reverse[tmpAddress] != nil) ? !Params.reverse[tmpAddress]! : false
                setupShadows()
            }
        }
        
        super.touchesCancelled(touches, with: event)
    }
    
}
