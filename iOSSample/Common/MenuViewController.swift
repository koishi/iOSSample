//
//  ViewController.swift
//  iOSSample
//
//  Created by KoichiroOishi on 2017/11/28.
//  Copyright © 2017年 KoichiroOishi. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let samples: [(sampleName: String, storyboard: String)] = [("CarouselView","CarouselView"),
                                                                   ("DrawRectView","DrawRectView"),
                                                                   ("CustomViewController","CustomViewController"),
                                                                   ("PickerView","PickerView")]
    let cellIdentifier = "cell"

    override func viewDidLoad() {
        title = "Koishi iOS Sample"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        let sample = samples[indexPath.row]
        cell.textLabel?.text = sample.sampleName
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return samples.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sample = samples[indexPath.row]
        let storyboard = UIStoryboard(name: sample.storyboard, bundle: nil)
        if let viewController = storyboard.instantiateInitialViewController() {
            navigationController?.pushViewController(viewController, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
