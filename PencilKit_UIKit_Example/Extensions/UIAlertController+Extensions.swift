//
//  UIAlertController+Extensions.swift
//  PencilKit_UIKit_Example
//
//  Created by Irakli Chkhitunidze on 9/3/23.
//

import UIKit

extension UIAlertController {
    
    func present() {
        guard let controller =  UIApplication.shared.allWindow?.filter({$0.isKeyWindow}).first?.rootViewController else {
            return
        }
        controller.present(self, animated: true)
    }
}
