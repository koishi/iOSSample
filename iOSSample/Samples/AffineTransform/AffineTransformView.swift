//
//  AffineTransformView.swift
//  iOSSample
//
//  Created by KoichiroOishi on 2018/02/14.
//  Copyright © 2018年 KoichiroOishi. All rights reserved.
//

import UIKit
import GestureRecognizerClosures

protocol AffineTransformViewDelegate {
    func updateView()
}

class AffineTransformView: UIView {

    var delegate: AffineTransformViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()

        setupGesture()
    }

    private func setupGesture() {

        onPan { pan in
            let move = pan.translation(in: self)
            self.transform = self.transform.translatedBy(x: move.x, y: move.y)
            pan.setTranslation(CGPoint.zero, in: self)
            self.delegate?.updateView()
        }

        onPinch { pinch in
            self.transform = self.transform.scaledBy(x: pinch.scale, y: pinch.scale)
            pinch.scale = 1
            self.delegate?.updateView()
        }

        onRotate { rotate in
            self.transform = self.transform.rotated(by: rotate.rotation)
            rotate.rotation = 0
            self.delegate?.updateView()
        }
    }
}
