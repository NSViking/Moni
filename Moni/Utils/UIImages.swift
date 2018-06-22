//
//  UIImages.swift
//  Affinity
//
//  Created by Víctor Vicente on 05/04/17.
//  Copyright © 2017 Pangea. All rights reserved.
//

import UIKit

public extension UIImage
{
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
	
	public func compress() -> Data {
		var compression: CGFloat = 0.7
		let maxCompression: CGFloat = 0.3
	
		let maxFileSize = 250*1024
	
		var imageData: Data = UIImageJPEGRepresentation(self, compression)!
		
		while (imageData.count > maxFileSize && compression > maxCompression) {
			compression -= CGFloat(0.1)
			imageData = UIImageJPEGRepresentation(self, compression)!
		}
		
		return imageData
	}
}
