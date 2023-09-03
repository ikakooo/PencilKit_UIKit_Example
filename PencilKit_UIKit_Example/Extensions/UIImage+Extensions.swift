//
//  UIImage+Extensions.swift
//  PencilKit_UIKit_Example
//
//  Created by Irakli Chkhitunidze on 9/3/23.
//

import UIKit

extension UIImage {
    
    func saveToPhotoLibrary(_ completionTarget: Any?, _ completionSelector: Selector?) {
        DispatchQueue.global(qos: .userInitiated).async {
            UIImageWriteToSavedPhotosAlbum(self, completionTarget, completionSelector, nil)
        }
    }
}
