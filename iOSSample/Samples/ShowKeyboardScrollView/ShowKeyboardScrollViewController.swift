//
//  ShowKeyboardViewController.swift
//  iOSSample
//
//  Created by KoichiroOishi on 2018/02/05.
//  Copyright © 2018年 KoichiroOishi. All rights reserved.
//

import UIKit

class ShowKeyboardScrollViewController: UIViewController {

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
        notificationCenter.addObserver(self, selector: #selector(ShowKeyboardScrollViewController.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(ShowKeyboardScrollViewController.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private final func unobserveKeyboardNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let rect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else {
            return
        }
        UIView.animate(withDuration: duration, animations: {
            let transform = CGAffineTransform(translationX: 0, y: -rect.size.height)
            self.view.transform = transform
        })
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else {
            return
        }
        UIView.animate(withDuration: duration, animations: {
            self.view.transform = CGAffineTransform.identity
        })
    }
}

extension ShowKeyboardScrollViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
