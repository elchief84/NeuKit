//
//  UITextField.swift
//  NeuKit
//
//  Created by Vincenzo Romano on 08/06/2020.
//

import UIKit

@IBDesignable
extension UITextField {
    
    struct UITextFieldParams {
        static var horizontalMargin = [String:CGFloat]()
    }
    
    @IBInspectable
    public var horizontalMargin: CGFloat
    {
        set (horizontalMargin) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            UITextFieldParams.horizontalMargin[tmpAddress] = horizontalMargin
        }

        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return UITextFieldParams.horizontalMargin[tmpAddress] ?? 0.0
        }
    }
    
    @objc open override func draw(_ rect: CGRect) {
        let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
        if(Params.active[tmpAddress] == true){
            setupShadows()
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib();
        let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
        if(Params.active[tmpAddress] == true){
            setupShadows()
        }
    }

    open func setupShadows() {
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
        
        if(UITextFieldParams.horizontalMargin[tmpAddress] != nil) {
            horizontalMargin = UITextFieldParams.horizontalMargin[tmpAddress]!;
        }else{
            horizontalMargin = 20.0;
        }

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: horizontalMargin, height: self.frame.size.height))
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
            content.name = "content";
            content.frame = bounds
            debugPrint("\(content.frame.size.width)");
            content.backgroundColor = self.backgroundColor?.cgColor
            roundCorners(layer:content, corners: corners, radius: Params.cornerRadius[tmpAddress]!)
            content.masksToBounds = true;
            shadowLayerDark.addSublayer(content)
        }else{
            shadowLayerDark.sublayers![0].frame = bounds
            debugPrint("\(shadowLayerLight.sublayers![0].frame.size.width)");
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
            content.name = "content"
            content.frame = bounds
            debugPrint("\(content.frame.size.width)");
            content.backgroundColor = self.backgroundColor?.cgColor
            roundCorners(layer:content, corners: corners, radius: Params.cornerRadius[tmpAddress]!)
            content.masksToBounds = true;
            shadowLayerLight.addSublayer(content)
        }else{
            shadowLayerLight.sublayers![0].frame = bounds
            debugPrint("\(shadowLayerLight.sublayers![0].frame.size.width)");
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
    
}
