//
//  DrawRectViewController.swift
//  iOSSample
//
//  Created by KoichiroOishi on 2017/12/28.
//  Copyright © 2017年 KoichiroOishi. All rights reserved.
//

import UIKit

class DrawRectViewController: UIViewController {

    @IBOutlet weak var squareView: RoundView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {

    }

}

class RoundView: UIView {

    override func draw(_ rect: CGRect) {
        guard let c = UIGraphicsGetCurrentContext() else {
            return
        }
        let w = self.bounds.size.width
        let h = self.bounds.size.height
        let r = w * 0.5

        c.setFillColor(UIColor.blue.cgColor)

        let rc = CGRect(x: 0, y: 0, width: w, height: h)
        c.move(to: CGPoint(x: rc.minX, y: rc.maxY - r))
        c.addArc(tangent1End: CGPoint(x: rc.minX, y: rc.minY), tangent2End: CGPoint(x: rc.midX, y: rc.minY), radius: r)
        c.addArc(tangent1End: CGPoint(x: rc.maxX, y: rc.minY), tangent2End: CGPoint(x: rc.maxX, y: rc.midY), radius: r)
        c.addArc(tangent1End: CGPoint(x: rc.maxX, y: rc.maxY), tangent2End: CGPoint(x: rc.midX, y: rc.maxY), radius: r)
        c.addArc(tangent1End: CGPoint(x: rc.minX, y: rc.maxY), tangent2End: CGPoint(x: rc.minX, y: rc.midY), radius: r)
        c.closePath()
//        c.fillPath()
        c.clip()

        UIImage(named: "icon")?.draw(in: self.bounds)


    }
}

class RoundedCornersView: UIView {

    override func draw(_ rect: CGRect) {
        UIBezierPath(roundedRect: self.bounds, cornerRadius: self.bounds.height / 2).addClip()
        UIImage(named: "icon")?.draw(in: self.bounds)

        layer.borderColor = UIColor.red.cgColor
        layer.borderWidth = 2.0
    }
}

class LayerRoundedCornersView: UIView {

    override func draw(_ rect: CGRect) {
        UIImage(named: "icon")?.draw(in: self.bounds)

        let maskPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.bounds.height / 2)
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer;

        // Add border
        let borderLayer = CAShapeLayer()
        borderLayer.path = maskLayer.path
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = UIColor.green.cgColor
        borderLayer.lineWidth = 5
        borderLayer.frame = self.bounds
        self.layer.addSublayer(borderLayer)

        maskLayer.borderColor = UIColor.red.cgColor
        maskLayer.borderWidth = 2.0
    }
}
