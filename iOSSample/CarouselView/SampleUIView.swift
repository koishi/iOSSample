//
//  SampleUIView.swift
//  iOSSample
//
//  Created by 大石弘一郎 on 2017/12/30.
//  Copyright © 2017年 KoichiroOishi. All rights reserved.
//

import UIKit

class SampleUIView: UIView {

    @IBOutlet var contentView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)

        Bundle.main.loadNibNamed("SampleUIView", owner: self, options: nil)

        bounds = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        self.contentView.frame = bounds
        self.contentView.translatesAutoresizingMaskIntoConstraints = true
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        addSubview(self.contentView)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        Bundle.main.loadNibNamed("SampleUIView", owner: self, options: nil)

        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(self.contentView)

        self.addConstraints([
            NSLayoutConstraint(item: self.contentView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: self.contentView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: self.contentView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: self.contentView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0),
            ])
    }

}
