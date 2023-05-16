//
//  Util.swift
//  News
//
//  Created by Gülfem Albayrak on 16.05.2023.
//

import UIKit

class Util {
    static var app: Util = {
        return Util()
    }()
    
    func resizeImageWithAspect(image: UIImage, scaledToMaxWidth width: CGFloat, maxHeigth height: CGFloat) -> UIImage? {
        let oldWidth = image.size.width
        let oldHeight = image.size.height
        
        let scaleFactor = (oldWidth > oldHeight) ? width / oldWidth : height / oldWidth
        
        let newHeight = oldHeight * scaleFactor
        let newWidth = oldWidth * scaleFactor
        let newSize = CGSize(width: newWidth, height: newHeight)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.main.scale)
        
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
}
