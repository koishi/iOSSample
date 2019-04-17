//
//  RoundedRectView.swift
//  iOSSample
//
//  Created by 大石弘一郎 on 2019/04/18.
//  Copyright © 2019 KoichiroOishi. All rights reserved.
//

import UIKit

class RoundedRectView: UIView {

    @IBInspectable var baseColor: UIColor?

    override func draw(_ rect: CGRect) {
        let r = bounds.size.height * 0.5
        drawRoundRect(rect: rect, radius: r, color: baseColor ?? UIColor.clear)
    }

    private func drawRoundRect(rect: CGRect, radius: CGFloat, color: UIColor) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.move(to: CGPoint(x: rect.minX, y: rect.midY))
        context.addArc(tangent1End: CGPoint(x: rect.minX, y: rect.minY), tangent2End: CGPoint(x: rect.midX, y: rect.minY), radius: radius)
        context.addArc(tangent1End: CGPoint(x: rect.maxX, y: rect.minY), tangent2End: CGPoint(x: rect.maxX, y: rect.midY), radius: radius)
        context.addArc(tangent1End: CGPoint(x: rect.maxX, y: rect.maxY), tangent2End: CGPoint(x: rect.midX, y: rect.maxY), radius: radius)
        context.addArc(tangent1End: CGPoint(x: rect.minX, y: rect.maxY), tangent2End: CGPoint(x: rect.minX, y: rect.midY), radius: radius)
        context.closePath()
        context.fillPath()
    }
}
