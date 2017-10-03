//
//  UIImage_Color.swift
//  iOSAppJul17
//
//  Created by NDIAYE on 21/07/2017.
//  Copyright © 2017 BEUZE. All rights reserved.
//

import Foundation
import UIKit

public extension UIImage {
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 40, height: 40)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
