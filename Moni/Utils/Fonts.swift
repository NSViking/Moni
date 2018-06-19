//
//  Fonts.swift
//  Manager
//
//  Created by VITI on 16/04/2018.
//  Copyright © 2018 TourWhiz. All rights reserved.
//

import UIKit

extension UIFont
{
    public class func moni_bold(_ size: CGFloat) -> UIFont
    {
        return UIFont(name: "SFCompactText-Bold", size: size)!;
    }
    
    public class func moni_regular(_ size: CGFloat) -> UIFont
    {
        return UIFont(name: "SFCompactText-Regular", size: size)!;
    }
    
    public class func moni_black(_ size: CGFloat) -> UIFont
    {
        return UIFont(name: "SFCompactText-Heavy", size: size)!;
    }
    
    public class func moni_light(_ size: CGFloat) -> UIFont
    {
        return UIFont(name: "SFCompactText-Light", size: size)!;
    }
}
