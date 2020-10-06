//
//  UISegmentedControl.swift
//  NeuKit
//
//  Created by Vincenzo Romano on 09/06/2020.
//

import UIKit

@IBDesignable
extension UISegmentedControl {

    func setSegmentStyle() {
        let background:UIView = UIView()
        background.frame = bounds;
        background.backgroundColor = UIColor.blue
        // self.insertSubview(background, at: 0)
        
        self.subviews.forEach { (imageView) in
            if(imageView.isUserInteractionEnabled == false){
                imageView.backgroundColor = UIColor.green;
                if(imageView.subviews.count > 0){
                    let tmp:UIImageView = imageView.subviews[0] as! UIImageView
                    if(tmp.alpha != 0){
                        tmp.backgroundColor = UIColor.clear;
                    }
                }
            }
        }
    
    }

    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }

}
