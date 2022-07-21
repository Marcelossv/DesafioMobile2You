//
//  UIButton+Extension.swift
//  DesafioMobile2You
//
//  Created by Marcelo Silva on 21/07/22.
//

import Foundation
import UIKit

extension UIButton {
   
    func setupFont(name:String,size:CGFloat,titleColor:UIColor,disableTitleColor:UIColor){
            self.titleLabel?.font = UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
            self.setTitleColor(titleColor, for: .normal)
            self.setTitleColor(disableTitleColor, for: .disabled)
        }
    
}
