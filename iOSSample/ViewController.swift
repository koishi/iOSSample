//
//  ViewController.swift
//  iOSSample
//
//  Created by KoichiroOishi on 2017/11/28.
//  Copyright © 2017年 KoichiroOishi. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControll: UIPageControl!
    let pageImages: [Int : String] = [1 : "http://www.doya-doya.com/wp-content/uploads/2011/01/img14.jpg",
                                      2 : "https://manual.atmark-techno.com/armadillo-840/armadillo-840_lcd_startup_guide_ja-1.0.0/images/gstreamer-videotest.png",
                                      3 : "http://whitebear0930.net/wp-content/uploads/2013/05/13050301.jpg",
                                      4 : "http://goodnews-wow.c.blog.so-net.ne.jp/_images/blog/_c0e/goodnews-wow/E38386E382B9E38388.gif"]

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = CGSize(width: view.bounds.width * CGFloat(pageImages.count), height: 200)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self;

        pageControll.numberOfPages = pageImages.count
        pageControll.currentPage = 0

        for p in 1...pageImages.count {
            let button = UIButton(frame: CGRect(x: view.bounds.width * CGFloat(p-1), y: 0, width: view.bounds.width, height: scrollView.bounds.height))
            button.sd_setImage(with: URL.init(string: pageImages[p]!)!, for: .normal, completed: nil)
            self.scrollView.addSubview(button)
        }
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageProgress = Double(scrollView.contentOffset.x / scrollView.bounds.width)
        pageControll.currentPage = Int(round(pageProgress))
    }
}
