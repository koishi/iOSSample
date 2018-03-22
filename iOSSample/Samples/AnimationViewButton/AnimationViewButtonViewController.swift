//
//  AnimationViewButtonViewController.swift
//  iOSSample
//
//  Created by KoichiroOishi on 2018/03/20.
//  Copyright © 2018年 KoichiroOishi. All rights reserved.
//

import UIKit

class AnimationViewButtonViewController: UIViewController {

    @IBOutlet weak var chatView: UIView!
    var chatHiddenStatus: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func tappedCloceButton(_ sender: Any) {
        view.layoutIfNeeded()
        chatHiddenStatus = !chatHiddenStatus
        chatView.isHidden = chatHiddenStatus
        UIView.animate(withDuration: 0.2, delay: 0.0, animations: {
            self.view.layoutIfNeeded()
        })
    }

}
