//
//  ContentSizeViewController.swift
//  iOSSample
//
//  Created by KoichiroOishi on 2018/01/30.
//  Copyright © 2018年 KoichiroOishi. All rights reserved.
//

import UIKit

class ContentSizeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
//        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    @IBAction func tappedButton(_ sender: Any) {

        let contentSizeHeight = tableView.contentSize.height
        let sizeHeight = tableView.frame.size.height
        print("contentSizeHeight:\(contentSizeHeight)-sizeHeight:\(sizeHeight)")
        tableView.setContentOffset(CGPoint(x: 0, y: contentSizeHeight - sizeHeight), animated: true)

    }

}

extension  ContentSizeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = indexPath.row.description
        return cell
    }

}

extension  ContentSizeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}
