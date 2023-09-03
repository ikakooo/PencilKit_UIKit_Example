//
//  ViewController.swift
//  PencilKit_UIKit_Example
//
//  Created by Irakli Chkhitunidze on 9/3/23.
//

import UIKit

class PencilKitViewController: UIViewController {

    var pencilKitCanvas =  PKCanvas()
    
    //MARK: - iOS Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        addPencilKit()
    }
    
    override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
          updateCanvasOrientation(with: view.bounds)
      }
    
    //MARK: - iOS override properties
    override var prefersHomeIndicatorAutoHidden: Bool {
          return true
      }
    
    override var prefersStatusBarHidden: Bool {
        return true;
    }
    
    //MARK: -  Setup Functions

    private func addPencilKit() {
        view.backgroundColor = .clear
        
        pencilKitCanvas  = createPencilKitCanvas(frame: view.frame, delegate: self)
        view.addSubview(pencilKitCanvas)
      }

}

extension PencilKitViewController: PencilKitManager { }

extension PencilKitViewController: PencilKitDelegate { }


