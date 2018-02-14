//
//  AffineTransformViewController.swift
//  iOSSample
//
//  Created by KoichiroOishi on 2018/02/14.
//  Copyright © 2018年 KoichiroOishi. All rights reserved.
//

import UIKit

class AffineTransformViewController: UIViewController {

    @IBOutlet weak var transView: AffineTransformView!
    @IBOutlet weak var frameLabel: UILabel!
    @IBOutlet weak var boundsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        transView.delegate = self
    }
}

extension AffineTransformViewController: AffineTransformViewDelegate {
    func updateView() {
        frameLabel.text = transView.frame.debugDescription
        boundsLabel.text = transView.bounds.debugDescription
    }
}
