//
//  ColorPickerController.swift
//  MAD ALP Tim Charlin
//
//  Created by Patrick Steven Kent Sugiarto on 05/06/24.
//

import UIKit

class ColorPickerController: UIViewController {
    
    private var selectedColor = UIColor.systemRed
    private var colorPicker = UIColorPickerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPicker.delegate = self
        //change this
        view.backgroundColor = selectedColor
        setupBarButton()
    }
    private func selectColor() {
        colorPicker.supportsAlpha = true
        colorPicker.selectedColor = selectedColor
        present(colorPicker, animated: true)
    }
    
    private func setupBarButton() {
        let pickedColorAction = UIAction(title: "Pick Color") { _
            in self.selectColor()
        }
        
        let pickColorBarButton = UIBarButtonItem(image: UIImage(systemName:
            "eyedropper"), primaryAction: pickedColorAction)
        navigationItem.rightBarButtonItem = pickColorBarButton
    }
}
extension ColorPickerController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        selectedColor = viewController.selectedColor
        //change this
        view.backgroundColor = selectedColor
    }
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        print("Did Dismiss Controller")
    }
}
