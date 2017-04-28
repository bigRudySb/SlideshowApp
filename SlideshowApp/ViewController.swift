//
//  ViewController.swift
//  SlideshowApp
//
//  Created by masaki TANAKA on 2017/04/19.
//  Copyright © 2017年 masaki.tanaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var playPoseButton: UIButton!
    @IBOutlet weak var stepBackButton: UIButton!
    @IBOutlet weak var stepForwardButton: UIButton!

    let animationPhotos = [
        UIImage(named: "001.jpg")!,
        UIImage(named: "002.jpg")!,
        UIImage(named: "003.jpg")!
    ]
    
    
    var num: Int = 0

    @IBOutlet weak var imageView: UIImageView!
    @IBAction func stepBack(_ sender: Any) {
        if self.imageView.isAnimating {
            self.imageView.stopAnimating()
        }
        num -= 1
        if 0 > num {
            num = animationPhotos.count - 1
        }
        imageView.image = animationPhotos[num]
    }
    @IBAction func stepForward(_ sender: Any) {
        if self.imageView.isAnimating {
            self.imageView.stopAnimating()
        }
        num += 1
        if animationPhotos.count <= num {
            num = 0
        }
        imageView.image = animationPhotos[num]
    }
    @IBAction func playPose(_ sender: Any) {
        if self.imageView.isAnimating {
            self.imageView.stopAnimating()
            num = 0
            self.stepBackButton.isEnabled = true
            self.stepForwardButton.isEnabled = true
            self.imageButton.isEnabled = true
            self.playPoseButton.setTitle("再生", for: .normal)
        } else {
            self.imageView.startAnimating()
            self.stepBackButton.isEnabled = false
            self.stepForwardButton.isEnabled = false
            self.imageButton.isEnabled = false
            self.playPoseButton.setTitle("停止", for: .normal)
        }
    }

    @IBAction func unwind(segue: UIStoryboardSegue) {
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.imageView.animationImages = animationPhotos
        self.imageView.animationDuration = 2.0;
        self.imageView.image = animationPhotos[num]
        self.playPoseButton.setTitle("再生", for: .normal)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let imageViewController:ImageViewController = segue.destination as! ImageViewController
        imageViewController.tgtImg = animationPhotos[num]
        
    }
    
    func viewTap(sender: UITapGestureRecognizer){
        
    }


}

