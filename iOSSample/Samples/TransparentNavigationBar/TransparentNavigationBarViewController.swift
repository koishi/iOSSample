//
//  ScrollViewController.swift
//  iOSSample
//
//  Created by 大石弘一郎 on 2019/01/21.
//  Copyright © 2019年 KoichiroOishi. All rights reserved.
//

import UIKit

class TransparentNavigationBarViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!

    var statusBarStyle: UIStatusBarStyle = .default {
        didSet {
            guard oldValue != statusBarStyle  else { return }
            setNeedsStatusBarAppearanceUpdate()

            print("NavigationBar status changed!")

            switch statusBarStyle {
            case .default:
                changeNavigationBarColor(color: .black)
                isHideNavigationBar(hide: false)
            case .lightContent:
                changeNavigationBarColor(color: .white)
                isHideNavigationBar(hide: true)
            default:
                break
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self

        changeNavigationBarColor(color: .white)
        statusBarStyle = .lightContent
        isHideNavigationBar(hide: true)

        let edgeInsets = UIEdgeInsets(top: UIApplication.shared.statusBarFrame.size.height, left: 0, bottom: 0, right: 0)
        scrollView.scrollIndicatorInsets = edgeInsets
    }

    private func isHideNavigationBar(hide: Bool) {
        if hide {
            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            navigationController?.navigationBar.shadowImage = UIImage()
        } else {
            navigationController?.navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
            navigationController?.navigationBar.shadowImage = nil
            navigationController?.navigationBar.tintColor = nil
        }
    }

    private func changeNavigationBarColor(color: UIColor) {
        navigationController?.navigationBar.tintColor = color
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: color
        ]
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
}

extension UINavigationController {
    override open var childViewControllerForStatusBarStyle: UIViewController? {
        return visibleViewController
    }

    override open var childViewControllerForStatusBarHidden: UIViewController? {
        return visibleViewController
    }
}

extension TransparentNavigationBarViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        if scrollView.contentOffset.y + navigationBarHeight() > headerView.frame.height {
            statusBarStyle = .default
        } else {
            statusBarStyle = .lightContent
        }
    }

    private func navigationBarHeight() -> CGFloat {
        return UIApplication.shared.statusBarFrame.size.height + (navigationController?.navigationBar.frame.size.height ?? 0)
    }
}
