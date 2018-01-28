//
//  CustomCell.swift
//  iOSSample
//
//  Created by KoichiroOishi on 2018/01/28.
//  Copyright © 2017年 KoichiroOishi. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    @IBOutlet var img:UIImageView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
    }
}
