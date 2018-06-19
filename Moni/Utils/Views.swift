//
//  Views.swift
//  Affinity
//
//  Created by Víctor Vicente on 06/04/17.
//  Copyright © 2017 Pangea. All rights reserved.
//

import UIKit

extension UIView
{
    class func identifier() -> String
    {
        return String(describing: self)
    }
    
    class func nib() -> UINib {
        return UINib(nibName: self.identifier(), bundle: nil)
    }
}
