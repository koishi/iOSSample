//
//  InfinityScroolViewController.swift
//  iOSSample
//
//  Created by KoichiroOishi on 2018/01/28.
//  Copyright © 2017年 KoichiroOishi. All rights reserved.
//

import UIKit

class InfinityScroolViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private var pageTabItemsWidth: CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension InfinityScroolViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3 * 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell

        let fixedIndex = indexPath.item % 3
        switch fixedIndex {
        case 0:
            cell.contentView.backgroundColor = UIColor.red
        case 1:
            cell.contentView.backgroundColor = UIColor.green
        case 2:
            cell.contentView.backgroundColor = UIColor.blue
        default:
            break
        }
        return cell
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if pageTabItemsWidth == 0.0 {
            pageTabItemsWidth = floor(scrollView.contentSize.width / 3.0) // 表示したい要素群のwidthを計算
        }

        if (scrollView.contentOffset.x <= 0.0) || (scrollView.contentOffset.x > pageTabItemsWidth * 2.0) { // スクロールした位置がしきい値を超えたら中央に戻す
            scrollView.contentOffset.x = pageTabItemsWidth
        }
    }
}

extension InfinityScroolViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = view.frame.width
        let height: CGFloat = view.frame.height
        return CGSize(width: width, height: height)
    }
}
