//
//  ViewController.swift
//  SlideshowApp
//
//  Created by horiuchi on 2021/12/10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var returnBottun: UIButton!
    
    var nowIndex:Int = 0
    var timer:Timer!
    
    var imageArr:[UIImage] = [
        UIImage(named: "wallpaper_pc-1920-1080-42")!,
        UIImage(named: "wallpaper_pc-1920-1080-43")!,
        UIImage(named: "wallpaper_pc-1920-1080-50")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapImg)))
    }
    
    @IBAction func playButton(_ sender: Any) {
        // 【再生 / 停止】ボタン押下処理
        if (timer == nil) {
            // 停止 → 再生
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            playButton.setTitle("停止", for: .normal)
            
            // 【進む・戻る】ボタン非活性
            nextButton.isEnabled = false
            returnBottun.isEnabled = false
            
            // 画像タップ無効
            imgView.isUserInteractionEnabled = false
        } else {
            // 再生 → 停止
            timer.invalidate()
            timer = nil
            playButton.setTitle("再生", for: .normal)
            
            // 【進む・戻る】ボタン活性
            nextButton.isEnabled = true
            returnBottun.isEnabled = true
            
            // 画像タップ有効
            imgView.isUserInteractionEnabled = true
        }
    }
    
    @IBAction func nextBottun(_ sender: Any) {
        // 【進む】ボタン押下処理
        changeImage()
    }


    @IBAction func returnBottun(_ sender: Any) {
        // 【戻る】ボタン押下処理
        nowIndex -= 1
        if (nowIndex < 0) {
            nowIndex = 2
        }
        imgView.image = imageArr[nowIndex]
    }
    
    @objc func changeImage() {
        // 【再生・進む】ボタン押下時の画像更新
        nowIndex += 1
        
        if (nowIndex == imageArr.count) {
            nowIndex = 0
        }
        imgView.image = imageArr[nowIndex]
    }

    @objc func tapImg() {
        // 画像タップ処理
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "NextView") as! NextViewController
        // 遷移先に画像データを渡す
        nextViewController.receiveImg = imgView.image!
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
    }
}

