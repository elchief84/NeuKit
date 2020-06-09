//
//  UITextField.swift
//  NeuKit
//
//  Created by Vincenzo Romano on 08/06/2020.
//

import UIKit

@IBDesignable
extension UITextField {
    
    struct Params {
        static var active = [String:Bool]()
        static var cornerRadius = [String:CGFloat]()
        static var cornersLeft = [String:Bool]()
        static var cornersRight = [String:Bool]()
        static var horizontalMargin = [String:CGFloat]()
        static var reverse = [String:Bool]()
        static var darkShadowColor = [String:UIColor]()
        static var lightShadowColor = [String:UIColor]()
        static var shadowDarkOffsetX = [String:CGFloat]()
        static var shadowDarkOffsetY = [String:CGFloat]()
        static var shadowLightOffsetX = [String:CGFloat]()
        static var shadowLightOffsetY = [String:CGFloat]()
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
    public var horizontalMargin: CGFloat
    {
        set (horizontalMargin) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            Params.horizontalMargin[tmpAddress] = horizontalMargin
        }

        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return Params.horizontalMargin[tmpAddress] ?? 0.0
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
    
    open override func draw(_ rect: CGRect) {
        let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
        if(Params.active[tmpAddress] == true){
            setupShadows()
        }
    }

    func setupShadows() {
        var shadowLayerDark:CAShapeLayer = CAShapeLayer();
        var shadowLayerLight:CAShapeLayer = CAShapeLayer();
        var hasDark = false;
        var hasLight = false;
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

        let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
        
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

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: Params.horizontalMargin[tmpAddress]!, height: self.frame.size.height))
        self.leftView = paddingView
        self.rightView = paddingView
        self.leftViewMode = .always
        self.rightViewMode = .always
        
        self.borderStyle = BorderStyle.none;
        if(self.backgroundColor == nil) { self.backgroundColor = UIColor.white; }
        
        
        if(!hasDark) {
            shadowLayerDark.name = "shadowDark"
            self.layer.insertSublayer(shadowLayerDark, at: 0)
            let content:CAShapeLayer = CAShapeLayer()
            content.frame = bounds
            content.backgroundColor = self.backgroundColor?.cgColor
            roundCorners(layer:content, corners: corners, radius: Params.cornerRadius[tmpAddress]!)
            content.masksToBounds = true;
            shadowLayerDark.addSublayer(content)
        }
        shadowLayerDark.frame = bounds
        shadowLayerDark.shadowRadius = 4
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
        shadowLayerLight.shadowColor = (Params.lightShadowColor[tmpAddress] != nil) ? Params.lightShadowColor[tmpAddress]?.cgColor : UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.7).cgColor
        
        self.backgroundColor = UIColor.clear
    }
    
    func roundCorners(layer: CALayer, corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: layer.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.backgroundColor = UIColor.red.cgColor
        mask.path = path.cgPath
        layer.mask = mask
    }
    
}
