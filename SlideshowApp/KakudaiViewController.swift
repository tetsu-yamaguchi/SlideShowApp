//
//  KakudaiViewController.swift
//  SlideshowApp
//
//  Created by MAC USER on 2017/03/21.
//  Copyright © 2017年 MAC USER. All rights reserved.
//

import UIKit

class KakudaiViewController: UIViewController {
    var Ki :UIImage? = nil

    @IBOutlet weak var KakudaiGazo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        KakudaiGazo.image = Ki
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

}
