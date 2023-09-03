//
//  PencilKitManager.swift
//  PencilKit_UIKit_Example
//
//  Created by Irakli Chkhitunidze on 9/3/23.
//

import UIKit

protocol PencilKitDelegate: AnyObject {
    func snapshot(from canvas: PKCanvas) -> UIImage
}

extension PencilKitDelegate {
    
    func snapshot(from canvas: PKCanvas) -> UIImage {
        //Take PencilKit Drawings snapshot
        let renderer = UIGraphicsImageRenderer(size: canvas.bounds.size)
        let image = renderer.image { ctx in
            canvas.drawHierarchy(in: canvas.bounds, afterScreenUpdates: true)
        }
        
        return image
    }
}

protocol PencilKitManager: NSObject {
    var pencilKitCanvas: PKCanvas { get set }
    func createPencilKitCanvas(frame: CGRect, delegate: PencilKitDelegate) -> PKCanvas
    func updateCanvasOrientation(with frame: CGRect)
}

extension PencilKitManager {
    
    func createPencilKitCanvas(frame: CGRect, delegate: PencilKitDelegate) -> PKCanvas {
        pencilKitCanvas = PKCanvas(frame: frame)
        pencilKitCanvas.pencilKitDelegate = delegate
        return pencilKitCanvas
    }
    
    func updateCanvasOrientation(with frame: CGRect) {
        pencilKitCanvas.updateCanvasOrientation(with: frame)
    }
}
