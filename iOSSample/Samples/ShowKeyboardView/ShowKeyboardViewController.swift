//
//  ShowKeyboardViewController.swift
//  iOSSample
//
//  Created by KoichiroOishi on 2018/02/05.
//  Copyright © 2018年 KoichiroOishi. All rights reserved.
//

import UIKit

class ShowKeyboardViewController: UIViewController {

    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addNotificationObservers()
    }

    deinit {
        removeNotificationObservers()
    }

    private func addNotificationObservers() {
        observeKeyboardNotifications()
    }

    private func removeNotificationObservers() {
        unobserveKeyboardNotifications()
    }

    private final func observeKeyboardNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(ShowKeyboardViewController.keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        notificationCenter.addObserver(self, selector: #selector(ShowKeyboardViewController.keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }

    private final func unobserveKeyboardNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        notificationCenter.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }

    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let rect = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        guard let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval else {
            return
        }
        UIView.animate(withDuration: duration, animations: {
            let transform = CGAffineTransform(translationX: 0, y: -rect.size.height)
            self.view.transform = transform
        })
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        guard let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval else {
            return
        }
        UIView.animate(withDuration: duration, animations: {
            self.view.transform = CGAffineTransform.identity
        })
    }
}

extension ShowKeyboardViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
