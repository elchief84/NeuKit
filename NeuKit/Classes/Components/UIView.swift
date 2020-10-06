//
//  UIView.swift
//  NeuKit
//
//  Created by Vincenzo Romano on 09/06/2020.
//

import UIKit

@IBDesignable
extension UIView {
    
    struct Params {
        static var active = [String:Bool]()
        static var cornerRadius = [String:CGFloat]()
        static var cornersLeft = [String:Bool]()
        static var cornersRight = [String:Bool]()
        static var reverse = [String:Bool]()
        static var darkShadowColor = [String:UIColor]()
        static var lightShadowColor = [String:UIColor]()
        static var shadowDarkOffsetX = [String:CGFloat]()
        static var shadowDarkOffsetY = [String:CGFloat]()
        static var shadowLightOffsetX = [String:CGFloat]()
        static var shadowLightOffsetY = [String:CGFloat]()
        static var shadowRadius = [String:CGFloat]()
        static var initied = [String:Bool]()
    }
    
    @IBInspectable
    public var active: Bool
    {
        set (active) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            Params.active[tmpAddress] = active
        }

        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return Params.active[tmpAddress] ?? true
        }
    }
    
    @IBInspectable
    public var cornerRadius: CGFloat
    {
        set (radius) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            Params.cornerRadius[tmpAddress] = radius
        }

        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return Params.cornerRadius[tmpAddress] ?? 0.0
        }
    }
    
    @IBInspectable
    public var shadowRadius: CGFloat
    {
        set (radius) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            Params.shadowRadius[tmpAddress] = radius
        }

        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return Params.shadowRadius[tmpAddress] ?? 4.0
        }
    }
    
    @IBInspectable
    public var cornersLeft: Bool
    {
        set (cornersLeft) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            Params.cornersLeft[tmpAddress] = cornersLeft
        }

        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return Params.cornersLeft[tmpAddress] ?? true
        }
    }
    
    @IBInspectable
    public var cornersRight: Bool
    {
        set (cornersRight) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            Params.cornersRight[tmpAddress] = cornersRight
        }

        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return Params.cornersRight[tmpAddress] ?? true
        }
    }
    
    @IBInspectable
    public var reverse: Bool
    {
        set (reverse) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            Params.reverse[tmpAddress] = reverse
        }

        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return Params.reverse[tmpAddress] ?? false
        }
    }
    
    @IBInspectable
    public var shadowDarkOffsetX: CGFloat
    {
        set (shadowDarkOffsetX) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            Params.shadowDarkOffsetX[tmpAddress] = shadowDarkOffsetX
        }

        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return Params.shadowDarkOffsetX[tmpAddress] ?? 2.0
        }
    }
    
    @IBInspectable
    public var shadowDarkOffsetY: CGFloat
    {
        set (shadowDarkOffsetY) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            Params.shadowDarkOffsetY[tmpAddress] = shadowDarkOffsetY
        }

        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return Params.shadowDarkOffsetY[tmpAddress] ?? 2.0
        }
    }
    
    @IBInspectable
    public var shadowLightOffsetX: CGFloat
    {
        set (shadowLightOffsetX) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            Params.shadowLightOffsetX[tmpAddress] = shadowLightOffsetX
        }

        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return Params.shadowLightOffsetX[tmpAddress] ?? 2.0
        }
    }
    
    @IBInspectable
    public var shadowLightOffsetY: CGFloat
    {
        set (shadowLightOffsetY) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            Params.shadowLightOffsetY[tmpAddress] = shadowLightOffsetY
        }

        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return Params.shadowLightOffsetY[tmpAddress] ?? 2.0
        }
    }
    
    @IBInspectable
    public var darkShadowColor: UIColor
    {
        set (darkShadowColor) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            Params.darkShadowColor[tmpAddress] = darkShadowColor
        }

        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return Params.darkShadowColor[tmpAddress] ?? UIColor.black
        }
    }
    
    @IBInspectable
    public var lightShadowColor: UIColor
    {
        set (lightShadowColor) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            Params.lightShadowColor[tmpAddress] = lightShadowColor
        }

        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return Params.lightShadowColor[tmpAddress] ?? UIColor.black
        }
    }
    
    open func initied() -> Bool {
        let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
        return Params.initied[tmpAddress] ?? false;
    }

    open func setup() {
        var shadowLayerDark:CAShapeLayer = CAShapeLayer();
        var shadowLayerLight:CAShapeLayer = CAShapeLayer();
        var hasDark = false;
        var hasLight = false;
        
        if(self.layer.sublayers != nil){
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
        
        Params.initied[tmpAddress] = true;
        
        var corners:UIRectCorner = UIRectCorner()
        
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
        
        cornerRadius = (Params.cornerRadius[tmpAddress] != nil) ? Params.cornerRadius[tmpAddress]! : 0.0
        shadowRadius = (Params.shadowRadius[tmpAddress] != nil) ? Params.shadowRadius[tmpAddress]! : 4.0
        
        if(!hasDark) {
            shadowLayerDark.name = "shadowDark"
            self.layer.insertSublayer(shadowLayerDark, at: 0)
            let content:CAShapeLayer = CAShapeLayer()
            content.frame = bounds
            content.backgroundColor = self.backgroundColor?.cgColor
            roundCorners(layer:content, corners: corners, radius: cornerRadius)
            content.masksToBounds = true;
            shadowLayerDark.addSublayer(content)
        }
        shadowLayerDark.frame = bounds
        shadowLayerDark.shadowRadius = shadowRadius;
        shadowLayerDark.shadowOpacity = 1
        
        var reverse:CGFloat = 1.0;
        if(Params.reverse[tmpAddress] != nil){
            reverse = (Params.reverse[tmpAddress]!) ? -1.0 : 1.0;
        }
        
        let darkOffsetX:CGFloat = (Params.shadowDarkOffsetX[tmpAddress] != nil) ? Params.shadowDarkOffsetX[tmpAddress]! : 2.0
        let darkOffsetY:CGFloat = (Params.shadowDarkOffsetY[tmpAddress] != nil) ? Params.shadowDarkOffsetY[tmpAddress]! : 2.0
        shadowLayerDark.shadowOffset = CGSize( width: reverse*darkOffsetX, height: reverse*darkOffsetY)
        shadowLayerDark.shadowColor = (Params.darkShadowColor[tmpAddress] != nil) ? Params.darkShadowColor[tmpAddress]?.cgColor : UIColor(red: 8/255, green: 8/255, blue: 33/255, alpha: 0.12).cgColor
        
        if(!hasLight) {
            shadowLayerLight.name = "shadowLight"
            self.layer.insertSublayer(shadowLayerLight, at: 0)
            let content:CAShapeLayer = CAShapeLayer()
            content.frame = bounds
            content.backgroundColor = self.backgroundColor?.cgColor
            
            roundCorners(layer:content, corners: corners, radius: cornerRadius)
            content.masksToBounds = true;
            shadowLayerLight.addSublayer(content)
        }
        shadowLayerLight.frame = bounds
        shadowLayerLight.shadowRadius = shadowRadius
        shadowLayerLight.shadowOpacity = 1
        
        let lightOffsetX:CGFloat = (Params.shadowLightOffsetX[tmpAddress] != nil) ? Params.shadowLightOffsetX[tmpAddress]! : 2.0
        let lightOffsetY:CGFloat = (Params.shadowLightOffsetY[tmpAddress] != nil) ? Params.shadowLightOffsetY[tmpAddress]! : 2.0
        shadowLayerLight.shadowOffset = CGSize( width: reverse*lightOffsetX, height: reverse*lightOffsetY)
        shadowLayerLight.shadowColor = (Params.lightShadowColor[tmpAddress] != nil) ? Params.lightShadowColor[tmpAddress]?.cgColor : UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.7).cgColor
        
        self.backgroundColor = UIColor.clear
    }
    
    open func delete() {
        if(self.layer.sublayers != nil){
            for item in self.layer.sublayers! {
                if item.name == "shadowDark" {
                    self.backgroundColor = UIColor(cgColor: item.sublayers![0].backgroundColor!);
                    item.removeFromSuperlayer();
                }
                if item.name == "shadowLight" {
                    self.backgroundColor = UIColor(cgColor: item.sublayers![0].backgroundColor!);
                    item.removeFromSuperlayer();
                }
            }
        }
    }
    
    func roundCorners(layer: CALayer, corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: layer.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.backgroundColor = UIColor.red.cgColor
        mask.path = path.cgPath
        layer.mask = mask
    }
    
}
