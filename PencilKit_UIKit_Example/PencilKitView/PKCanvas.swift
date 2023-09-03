//
//  PKCanvas.swift
//  PencilKit_UIKit_Example
//
//  Created by Irakli Chkhitunidze on 9/3/23.
//

import UIKit
import PencilKit

class PKCanvas: UIView {
    
    var canvasView: PKCanvasView!
    weak var pencilKitDelegate: PencilKitDelegate?
    
    let toolPicker = PKToolPicker()
    
    //MARK: - iOS Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPencilKitCanvas()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCanvasOrientation(with frame: CGRect) {
        self.canvasView.frame = frame
        self.frame = frame
    }
    
    private func setupPencilKitCanvas() {
        canvasView = PKCanvasView(frame:self.bounds)
        canvasView.delegate = self
        canvasView.alwaysBounceVertical = false
        canvasView.drawingPolicy = .anyInput
        canvasView.becomeFirstResponder()
        addSubview(canvasView)
        
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        toolPicker.addObserver(self)
        canvasView.becomeFirstResponder()
        
    }
    
}


// MARK: Canvas View Delegate
extension PKCanvas: PKCanvasViewDelegate {
    
    /// Delegate method: Note that the drawing has changed.
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        print("canvasViewDrawingDidChange")
    }
}

extension PKCanvas: PKToolPickerObserver {
    
    func toolPickerSelectedToolDidChange(_ toolPicker: PKToolPicker) {
        print("toolPickerSelectedToolDidChange")
    }
    
    func toolPickerIsRulerActiveDidChange(_ toolPicker: PKToolPicker) {
        print("toolPickerIsRulerActiveDidChange")
    }
    
    func toolPickerVisibilityDidChange(_ toolPicker: PKToolPicker) {
        print("toolPickerVisibilityDidChange")
    }
    
    func toolPickerFramesObscuredDidChange(_ toolPicker: PKToolPicker) {
        print("toolPickerFramesObscuredDidChange")
    }
}


