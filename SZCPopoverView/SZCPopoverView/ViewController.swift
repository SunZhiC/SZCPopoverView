//
//  ViewController.swift
//  SZCPopoverView
//
//  Created by Sun on 2016/12/23.
//  Copyright © 2016年 sunzhichao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        
        guard let point = touch?.location(in: view) else { return }
        
        let popoverView = SZCPopOverView(origin: point, width: 200, height: 100, direction: .top)
        popoverView.backView.layer.cornerRadius = 5
        
        let labelOne = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        labelOne.text = "Take a photo"
        let labelTwo = UILabel(frame: CGRect(x: 0, y: 50, width: 200, height: 50))
        labelTwo.text = "Choose from library"
        
        popoverView.backView.addSubview(labelOne)
        popoverView.backView.addSubview(labelTwo)
        
        popoverView.popView()
    }
    
}

