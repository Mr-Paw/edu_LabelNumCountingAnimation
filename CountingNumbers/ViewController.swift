//
//  ViewController.swift
//  CountingNumbers
//
//  Created by Nik on 10/28/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelToAnimate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
let labelAnimator = LabelCountingAnimator()
        labelAnimator.animate(forLabel: labelToAnimate, duration: 1.5, startValue: 0, endValue: 100)
    }
   
    
   

}

