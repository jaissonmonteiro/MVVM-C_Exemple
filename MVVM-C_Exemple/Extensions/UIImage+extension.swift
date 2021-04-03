//
//  UIImage+extension.swift
//  MVVM-C_Exemple
//
//  Created by Jaisson Monteiro on 02/04/21.
//

import UIKit

extension UIImage {
    static func from(text: String, fontSize: CGFloat) -> UIImage {
        let twoCharacter = String(text.prefix(2))
        let label = UILabel()
        label.textAlignment = .center
        label.text = twoCharacter
        label.font = .systemFont(ofSize: fontSize)
        label.sizeToFit()
        
        return label.image()
    }
}
