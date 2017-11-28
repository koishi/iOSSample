//
//  ViewController.swift
//  iOSSample
//
//  Created by KoichiroOishi on 2017/11/28.
//  Copyright © 2017年 KoichiroOishi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControll: UIPageControl!
    let pageNum = 4
    let pageColors:[Int : UIColor] = [1 : UIColor.red, 2 : UIColor.yellow, 3 : UIColor.blue, 4 : UIColor.green]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = CGSize(width: view.bounds.width * CGFloat(pageNum), height: 200)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self;

        pageControll.numberOfPages = pageNum
        pageControll.currentPage = 0

        for p in 1...pageNum {
            let v = UIView(frame: CGRect(x: view.bounds.width * CGFloat(p-1), y: 0, width: view.bounds.width, height: scrollView.bounds.height))
            v.backgroundColor = pageColors[p]
            self.scrollView.addSubview(v)
        }
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageProgress = Double(scrollView.contentOffset.x / scrollView.bounds.width)
        pageControll.currentPage = Int(round(pageProgress))
    }
}
