//
//  LabelCountingAnimator.swift
//  CountingNumbers
//
//  Created by Nik on 10/29/20.
//

import Foundation
import UIKit
class LabelCountingAnimator {
    private var animationStartDate = Date()
    private var displayLink: CADisplayLink!
    private var label: UILabel!
    private var startValue: Double = 0
    private var endValue: Double = 0
    private var animationDuration: Double = 0.3

    var delay = 0
    
    func animate(forLabel label: UILabel, duration: Double, delay: Double = 0, startValue: Double, endValue: Double){
        self.label = label
        self.animationDuration = duration
        self.startValue = startValue
        self.endValue = endValue
        animationStartDate = Date()
        displayLink.add(to: .main, forMode: .default)
    }
    init() {
        displayLink = CADisplayLink(target: self, selector: #selector(count))
    }
    @objc private func count(){
        let now = Date()
        let elapsedTime = now.timeIntervalSince(animationStartDate)
        if elapsedTime > animationDuration {
            self.label.text = "\(endValue)"
            displayLink.remove(from: .main, forMode: .default)
        } else {
            let percentage = (elapsedTime / animationDuration)
            let value = Double(startValue + Double(percentage) * (endValue - startValue)).rounded()
            label.text = "\(value)"
            
            
        }
    }
}
