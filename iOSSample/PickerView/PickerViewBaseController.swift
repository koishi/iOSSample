//
//  PickerViewController.swift
//  iOSSample
//
//  Created by 大石弘一郎 on 2018/01/05.
//  Copyright © 2018年 KoichiroOishi. All rights reserved.
//

import UIKit

class PickerViewBaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tappedButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "PickerViewController", bundle:nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "PickerViewController") as? PickerViewController {
            viewController.modalTransitionStyle = .coverVertical
            viewController.titles = ["てすと0","てすと1","てすと2","てすと3","てすと4"]
            viewController.delegate = self
            present(viewController, animated: true, completion: nil)
        }
    }
}

extension PickerViewBaseController: PickerViewControllerDelegate {
    func selectedIndex(index: Int) {
        print("\(index)")
    }
}
