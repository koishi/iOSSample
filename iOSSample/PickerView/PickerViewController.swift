//
//  PickerView.swift
//  iOSSample
//
//  Created by 大石弘一郎 on 2018/01/06.
//  Copyright © 2018年 KoichiroOishi. All rights reserved.
//

import UIKit

public protocol PickerViewControllerDelegate {
    func selectedIndex(index: Int)
}

class PickerViewController: UIViewController {

    @IBOutlet weak var basePickerView: UIView!
    @IBOutlet weak var pickerView: UIPickerView!

    var delegate: PickerViewControllerDelegate?
    var selectedIndex: Int = 0
    var titles = [String]()

    override func viewDidLoad() {
        pickerView.dataSource = self
        pickerView.delegate = self
    
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedBaseView(_:)))
        basePickerView.addGestureRecognizer(tapGesture)
    }

    @IBAction func tappedConfirmButton(_ sender: UIButton) {
        delegate?.selectedIndex(index: selectedIndex)
        dismiss()
    }

    @IBAction func tappedCanselButton(_ sender: UIButton) {
        dismiss()
    }

    @objc func tappedBaseView(_ sender: UITapGestureRecognizer) {
        dismiss()
    }

    private func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}

extension PickerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return titles.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return titles[row]
    }
}

extension PickerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedIndex = row
    }
}
