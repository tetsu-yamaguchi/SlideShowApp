//
//  ViewController.swift
//  SlideshowApp
//
//  Created by MAC USER on 2017/03/20.
//  Copyright © 2017年 MAC USER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //画像管理関係
    let gazosu = 8
    var i = 0
    var imageArray:[UIImage] = [UIImage]()
    //スライドショー再生管理関係
    var showon = 0// on 0,off 1
    var timer: Timer!
    var timer_sec: Int = 0
    
    @IBOutlet weak var slide: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for i in 0...gazosu-1{
            imageArray.append(UIImage(named: "p\(i).jpg")!)
        }
        slide.image = imageArray[0]
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateshow), userInfo: nil, repeats: true)
            Button3.setTitle("停止", for: UIControlState.normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func updateshow (timer: Timer){
        self.timer_sec += 1
        if self.timer_sec >= 2{
            print ("\(self.timer_sec)")
            self.timer_sec = 0
            if showon == 0{//以下、susumuを呼び出してやれるとシンプルでいい。
                if i < gazosu-1 {
                    i += 1
                    slide.image = imageArray[i]
                } else {
                    slide.image = imageArray[0]
                    i = 0
                }
            }
        }
    }
    @IBAction func susumu(_ sender: Any) {
        if showon == 1 {
            if i < gazosu-1 {
                i += 1
                slide.image = imageArray[i]
            } else {
                slide.image = imageArray[0]
                i = 0
            }
        }
    }

    @IBAction func modoru(_ sender: Any) {
        if showon == 1 {
            if i > 0 {
                i -= 1
                slide.image = imageArray[i]
            } else {
                slide.image = imageArray[gazosu-1]
                i = gazosu-1
            }
        }
    }
    
    @IBOutlet weak var Button3: UIButton!
    @IBAction func saiseiteisi(_ sender: Any) {
        showon = 1 - showon //0->1,1->0
        if showon == 0 {//再生が始まった。
            Button3.setTitle("停止", for: UIControlState.normal)
        }
        else {
          Button3.setTitle("再生", for: UIControlState.normal)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let sK = segue.destination as! KakudaiViewController
        sK.Ki = imageArray[i]
        }
    @IBAction func onTapImage(_ sender: Any) {
        showon = 1//拡大中はスライドを停止
        Button3.setTitle("再生", for: UIControlState.normal)
        performSegue(withIdentifier: "sK", sender: nil)
    }
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
}

