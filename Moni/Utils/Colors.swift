//
//  Colors.swift
//  Manager
//
//  Created by VITI on 16/04/2018.
//  Copyright © 2018 TourWhiz. All rights reserved.
//

import UIKit

extension UIColor
{
    public class func moni_black(alpha: CGFloat = 1.0) -> UIColor
    {
        return UIColor (red: 0.2588, green: 0.2549, blue: 0.2588, alpha: alpha)
    }
    
    public class func moni_pink(alpha: CGFloat = 1.0) -> UIColor
    {
        return UIColor (red: 232/255, green: 56/255, blue: 170/255, alpha: alpha)
    }
    
    public class func addGradientTop(viewToApply: UIView, colorK: UIColor)
    {
        let gradient = CAGradientLayer()
        
        gradient.frame = CGRect(x: 0, y: 0, width: viewToApply.frame.size.width + 100, height: viewToApply.frame.size.height)
        gradient.colors = [colorK.cgColor, UIColor.clear.cgColor]
        
        viewToApply.layer.insertSublayer(gradient, at: 0)
    }
    
    public class func addGradientBottom(viewToApply: UIView, colorK: UIColor)
    {
        let gradient = CAGradientLayer()
        
        gradient.frame = CGRect(x: 0, y: 0, width: viewToApply.frame.size.width + 100, height: viewToApply.frame.size.height + 100)
        gradient.colors = [UIColor.clear.cgColor, colorK.cgColor]
        gradient.locations = []
        
        viewToApply.layer.insertSublayer(gradient, at: 0)
    }
}
