//
//  ViewController.swift
//  DemoAnimation
//
//  Created by 李泳昌 on 2019/3/2.
//  Copyright © 2019 TedLee. All rights reserved.
//

import UIKit
import SnapKit //強烈建議安裝，autolayout 可簡化

var demoView: UIView!
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        demoView = UIView()
//        demoView.backgroundColor = UIColor.red
        demoView.backgroundColor = UIColor.lightGray
        view.addSubview(demoView)
//        demoView.translatesAutoresizingMaskIntoConstraints = false
//        demoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        demoView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        demoView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        demoView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        demoView.snp.makeConstraints { (make) in
            make.center.equalTo(view.center)
            make.width.height.equalTo(100)
        }
        
//        startAnimation()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.startAnimation()
        }
    }
    
    
    func startAnimation() {
        
//        let basicAnimation = CABasicAnimation(keyPath: "postiton")
//        basicAnimation.toValue = CGPoint(x: 300, y: 650)
//        basicAnimation.isRemovedOnCompletion = false
//        basicAnimation.fillMode = .forwards
//        basicAnimation.repeatCount = 5
//        basicAnimation.autoreverses = true
//        basicAnimation.speed = 2
//        demoView.layer.add(basicAnimation, forKey: nil)
        
        let keyAnimation = CAKeyframeAnimation(keyPath: "position")
//        keyAnimation.values = [10,10,100,0]
//        keyAnimation.keyTimes = [0,0.1,0.2,0.9,1.0]
        keyAnimation.duration = 3
        keyAnimation.repeatCount = .infinity
//        keyAnimation.isAdditive = true
        keyAnimation.isRemovedOnCompletion = false

        keyAnimation.fillMode = .forwards
        
        let demoCGPoint = UIBezierPath()
        demoCGPoint.move(to: CGPoint(x: 0, y: 0))
        demoCGPoint.addLine(to: CGPoint(x: 350, y: 0))
        demoCGPoint.addLine(to: CGPoint(x: 100, y: 100))
        demoCGPoint.addLine(to: CGPoint(x: 350, y: 100))
        demoCGPoint.close()
//        let demoPath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 200, height: 200))
        keyAnimation.path = demoCGPoint.cgPath
        demoView.layer.add(keyAnimation, forKey: nil)
    }


}

