//
//  UILabel+Extension.swift
//  DesafioMobile2You
//
//  Created by Marcelo Silva on 21/07/22.
//

import Foundation
import UIKit

extension UILabel{
    
    func setupFont(name:String,size:CGFloat,color:UIColor){
            self.font = UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
            self.textColor = color
        }
}


