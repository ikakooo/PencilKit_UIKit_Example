//
//  UIApplication+Extensions.swift
//  PencilKit_UIKit_Example
//
//  Created by Irakli Chkhitunidze on 9/3/23.
//

import UIKit

extension UIApplication {
    
    var keyWindow: UIWindow? {
        // Get connected scenes
        return self.connectedScenes
        // Keep only active scenes, onscreen and visible to the user
            .filter { $0.activationState == .foregroundActive }
        // Keep only the first `UIWindowScene`
            .first(where: { $0 is UIWindowScene })
        // Get its associated windows
            .flatMap({ $0 as? UIWindowScene })?.windows
        // Finally, keep only the key window
            .first(where: \.isKeyWindow)
    }
    
    var allWindow: [UIWindow]? {
        // Get connected scenes
        return self.connectedScenes
        // Keep only active scenes, onscreen and visible to the user
            .filter { $0.activationState == .foregroundActive }
        // Keep only the first `UIWindowScene`
            .first(where: { $0 is UIWindowScene })
        // Get its associated windows
            .flatMap({ $0 as? UIWindowScene })?.windows
    }
    
}
