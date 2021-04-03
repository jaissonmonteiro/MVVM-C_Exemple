//
//  UIView+Extension.swift
//  MVVM-C_Exemple
//
//  Created by Jaisson Monteiro on 02/04/21.
//

import UIKit

extension UIView {
    func image() -> UIImage {
        let size = frame.size
        let render = UIGraphicsImageRenderer(size: size)
        let image = render.image { (context) in
            draw(frame)
        }
        return image
    }
}
