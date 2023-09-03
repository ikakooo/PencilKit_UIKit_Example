//
//  ViewController.swift
//  PencilKit_UIKit_Example
//
//  Created by Irakli Chkhitunidze on 9/3/23.
//

import UIKit

class PencilKitViewController: UIViewController {
    
    private var drowingViewContainer: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "square.and.arrow.down.on.square.fill"), for: .normal)
        button.setTitle(" Save ScreenShot", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 19.0, weight: .regular)
        button.setTitleColor(.red, for: .normal)
        button.tintColor = .red
        return button
    }()
    
    
    var pencilKitCanvas =  PKCanvas()
    
    //MARK: - iOS Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        setUpViews()
        setUpConstraints()
        
        
        saveButton.addTarget(self, action: #selector(saveButtonTapAction(_:)), for: .touchUpInside)
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
    
    //MARK: -  Actions
    
    @objc func saveButtonTapAction(_ sender: Any) {
        let snapshotView =  snapshot(from: pencilKitCanvas)
        let selector = #selector(self.onImageSaved(_:error:contextInfo:))
        
        snapshotView.saveToPhotoLibrary(self, selector)
    }
    
    @objc private func onImageSaved(_ image: UIImage, error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            ac.present()
        } else {
            let ac = UIAlertController(title: "Saved!", message: "You create image and has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            ac.present()
        }
    }
    
    //MARK: -  Setup Functions
    
    private func setUpViews(){
        view.addSubview(drowingViewContainer)
        view.addSubview(saveButton)
        addPencilKit()
    }
    
    private func addPencilKit() {
        pencilKitCanvas  = createPencilKitCanvas(frame: drowingViewContainer.frame, delegate: self)
        
        drowingViewContainer.addArrangedSubview(pencilKitCanvas)
    }
    
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            drowingViewContainer.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            drowingViewContainer.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            drowingViewContainer.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            drowingViewContainer.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            saveButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            saveButton.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            saveButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
}

extension PencilKitViewController: PencilKitManager { }

extension PencilKitViewController: PencilKitDelegate { }


