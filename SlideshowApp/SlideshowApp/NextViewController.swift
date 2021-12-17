//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by horiuchi on 2021/12/17.
//

import UIKit

class NextViewController: UIViewController {
    @IBOutlet weak var imgV: UIImageView!
    var receiveImg:  UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imgV.image = receiveImg
    }
    
    @IBAction func returnBtn(_ sender: Any) {
        // 【戻る】ボタン押下処理
        self.dismiss(animated: true, completion: nil)
    }
    

}
