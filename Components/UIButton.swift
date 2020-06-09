//
//  UIButton.swift
//  NeuKit
//
//  Created by Vincenzo Romano on 08/06/2020.
//

import UIKit

@IBDesignable
extension UIButton {
    
    struct Params {
        static var active               = [String:Bool]()
        static var hapticLevel          = [String:Int]()        //0: disabled; 1: light; 2: medium; 3: heavy light; 4: soft; 5: rigid (4 - 5 only iOS 13)
        static var cornerRadius         = [String:CGFloat]()
        static var cornersLeft          = [String:Bool]()
        static var cornersRight         = [String:Bool]()
        static var reverse              = [String:Bool]()
        static var darkShadowColor      = [String:UIColor]()
        static var lightShadowColor     = [String:UIColor]()
        static var shadowDarkOffsetX    = [String:CGFloat]()
        static var shadowDarkOffsetY    = [String:CGFloat]()
        static var shadowLightOffsetX   = [String:CGFloat]()
        static var shadowLightOffsetY   = [String:CGFloat]()
        static var isToggle             = [String:Bool]()
        static var normalColor          = [String:UIColor]()
        static var highligthColor       = [String:UIColor]()
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
    public var hapticLevel: Int
    {
        set (hapticLevel) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            Params.hapticLevel[tmpAddress] = hapticLevel
        }

        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return Params.hapticLevel[tmpAddress] ?? 0
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
    
    @IBInspectable
    public var isToggle: Bool
    {
        set (isToggle) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            Params.isToggle[tmpAddress] = isToggle
        }

        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return Params.isToggle[tmpAddress] ?? true
        }
    }
    
    @IBInspectable
    public var normalColor: UIColor
    {
        set (normalColor) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            Params.normalColor[tmpAddress] = normalColor
        }

        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return Params.normalColor[tmpAddress] ?? UIColor.black
        }
    }
    
    @IBInspectable
    public var highligthColor: UIColor
    {
        set (highligthColor) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            Params.highligthColor[tmpAddress] = highligthColor
        }

        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return Params.highligthColor[tmpAddress] ?? UIColor.black
        }
    }
    
    open override func draw(_ rect: CGRect) {
        let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
        if(Params.active[tmpAddress] == true){
            setupShadows()
        }
        self.backgroundColor = UIColor.clear
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
        
        var bgColor:UIColor = self.backgroundColor!;
        if(Params.normalColor[tmpAddress] != nil) {
            bgColor = Params.normalColor[tmpAddress]!;
        }
        
        if(!hasDark) {
            shadowLayerDark.name = "shadowDark"
            self.layer.insertSublayer(shadowLayerDark, at: 0)
            let content:CAShapeLayer = CAShapeLayer()
            content.frame = bounds
            content.backgroundColor = bgColor.cgColor
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
            self.layer.insertSublayer(shadowLayerLight, at: 0)
            let content:CAShapeLayer = CAShapeLayer()
            content.frame = bounds
            content.backgroundColor = bgColor.cgColor
            
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

    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
        if(Params.active[tmpAddress] == true){
            Params.reverse[tmpAddress] = (Params.reverse[tmpAddress] != nil) ? !Params.reverse[tmpAddress]! : true
            setupShadows()
        }
        
        var bgColor:UIColor = self.backgroundColor!;
        if(Params.normalColor[tmpAddress] != nil) {
            bgColor = Params.normalColor[tmpAddress]!;
        }
        
        var fgColor:UIColor = self.backgroundColor!;
        if(Params.highligthColor[tmpAddress] != nil) {
            fgColor = Params.highligthColor[tmpAddress]!;
        }
        
        var isToggle = false;
        if(Params.isToggle[tmpAddress] != nil){
            isToggle = (Params.isToggle[tmpAddress] != nil) ? Params.isToggle[tmpAddress]! : false
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
        
        if(Params.hapticLevel[tmpAddress] != nil) {
            if(Params.hapticLevel[tmpAddress] != 0) {
                debugPrint(Params.hapticLevel[tmpAddress] ?? 0)
                let force:UIImpactFeedbackStyle = UIImpactFeedbackStyle(rawValue: Params.hapticLevel[tmpAddress]!-1)!
                UIImpactFeedbackGenerator(style: force).impactOccurred()
            }
        }
        super.touchesBegan(touches, with: event)
    }

    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
        
        var isToggle = false;
        if(Params.isToggle[tmpAddress] != nil){
            isToggle = (Params.isToggle[tmpAddress] != nil) ? Params.isToggle[tmpAddress]! : false
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
        
        var isToggle = false;
        if(Params.isToggle[tmpAddress] != nil){
            isToggle = (Params.isToggle[tmpAddress] != nil) ? Params.isToggle[tmpAddress]! : false
        }
        
        if(Params.active[tmpAddress] == true){
            if(!isToggle){
                Params.reverse[tmpAddress] = (Params.reverse[tmpAddress] != nil) ? !Params.reverse[tmpAddress]! : false
                setupShadows()
            }
        }
        
        super.touchesCancelled(touches, with: event)
    }
    
    func roundCorners(layer: CALayer, corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: layer.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.backgroundColor = UIColor.red.cgColor
        mask.path = path.cgPath
        layer.mask = mask
    }
    
}
