//
//  SampleModalViewController.swift
//  iOSSample
//
//  Created by KoichiroOishi on 2018/03/05.
//  Copyright © 2018年 KoichiroOishi. All rights reserved.
//

import UIKit

class SampleModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    deinit {
        print("\(#function) \(NSStringFromClass(type(of: self)))")
    }

    @IBAction func tappedPushButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "NavigationController", bundle:nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "SampleViewController") as? SampleViewController {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }

    @IBAction func tappedModalButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "NavigationController", bundle:nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "SampleModalViewController") as? SampleModalViewController {
            present(viewController, animated: true, completion: nil)
        }
    }

    @IBAction func tappedCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func tappedRootButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        let storyboard = UIStoryboard(name: "NavigationController", bundle:nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "SampleViewController") as? SampleViewController else { return }
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        appDelegate.window?.rootViewController = viewController
    }
}
