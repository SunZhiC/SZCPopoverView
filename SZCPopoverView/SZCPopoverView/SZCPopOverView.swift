//
//  SZCPopOverView.swift
//  TestProject
//
//  Created by Sun on 2016/12/21.
//  Copyright © 2016年 sunzhichao. All rights reserved.
//



import UIKit

enum SZCPopOverViewArrowDirection {
    case top
    case left
    case right
    case bottom
    case leftTop
    case leftBottom
    case rightTop
    case rightBottom
    case topRight
    case topLeft
    case bottomRight
    case bottomLeft
}

class SZCPopOverView: UIView {

    var origin: CGPoint
    var height: CGFloat
    var width: CGFloat
    var backView: UIView
    var direction: SZCPopOverViewArrowDirection
    
    init(origin: CGPoint, width: CGFloat, height: CGFloat, direction: SZCPopOverViewArrowDirection) {
        
        
        self.origin = origin
        self.height = height
        self.width = width
        print(direction)
        self.direction = direction
        self.backView = UIView(frame: CGRect(x: origin.x, y: origin.y, width: width, height: height))
		self.backView.backgroundColor = UIColor.white
		self.backView.layer.borderWidth = 1
		self.backView.layer.borderColor = UIColor(white: 0, alpha: 0.5).cgColor
		
		self.backView.layer.shadowColor = UIColor.lightGray.cgColor
		self.backView.layer.shadowOpacity = 0.5
		self.backView.layer.shadowOffset = CGSize(width: 2, height: 2)
		
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        self.addSubview(self.backView)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
}

extension SZCPopOverView {
    internal override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        let startX = origin.x
        let startY = origin.y
        context?.move(to: origin)
        
        switch direction {
        case .top:
            context?.addLine(to: CGPoint(x: startX + 5, y: startY + 5))
            context?.addLine(to: CGPoint(x: startX - 5, y: startY + 5))
        case .left:
            context?.addLine(to: CGPoint(x: startX + 5, y: startY - 5))
            context?.addLine(to: CGPoint(x: startX + 5, y: startY + 5))
        case .right:
            context?.addLine(to: CGPoint(x: startX - 5, y: startY - 5))
            context?.addLine(to: CGPoint(x: startX - 5, y: startY + 5))
        case .bottom:
            context?.addLine(to: CGPoint(x: startX - 5, y: startY - 5))
            context?.addLine(to: CGPoint(x: startX + 5, y: startY - 5))
        case .leftTop:
            context?.addLine(to: CGPoint(x: startX + 5, y: startY - 5))
            context?.addLine(to: CGPoint(x: startX + 5, y: startY + 5))
        case .leftBottom:
            context?.addLine(to: CGPoint(x: startX + 5, y: startY - 5))
            context?.addLine(to: CGPoint(x: startX + 5, y: startY + 5))
        case .rightTop:
            context?.addLine(to: CGPoint(x: startX - 5, y: startY - 5))
            context?.addLine(to: CGPoint(x: startX - 5, y: startY + 5))
        case .rightBottom:
            context?.addLine(to: CGPoint(x: startX - 5, y: startY - 5))
            context?.addLine(to: CGPoint(x: startX - 5, y: startY + 5))
        case .topRight:
            context?.addLine(to: CGPoint(x: startX + 5, y: startY + 5))
            context?.addLine(to: CGPoint(x: startX - 5, y: startY + 5))
        case .topLeft:
            context?.addLine(to: CGPoint(x: startX + 5, y: startY + 5))
            context?.addLine(to: CGPoint(x: startX - 5, y: startY + 5))
        case .bottomRight:
            context?.addLine(to: CGPoint(x: startX - 5, y: startY - 5))
            context?.addLine(to: CGPoint(x: startX + 5, y: startY - 5))
        case .bottomLeft:
            context?.addLine(to: CGPoint(x: startX - 5, y: startY - 5))
            context?.addLine(to: CGPoint(x: startX + 5, y: startY - 5))
        }
        
        context?.closePath()
		context?.setFillColor(UIColor.white.cgColor)
		context?.setStrokeColor(UIColor(white: 0, alpha: 0.5).cgColor)
        context?.drawPath(using: .fillStroke)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else { return }
        
        guard let view = touch.view else { return }
        
        if !view.isEqual(self.backView) {
            dismiss()
        }
    }

}

extension SZCPopOverView {
    public func popView() {
        
        _ = backView.subviews.map{ $0.isHidden = true}
        UIApplication.shared.keyWindow?.addSubview(self)
        alpha = 0.0
        
        switch direction {
        case .top:
            backView.frame = CGRect(x: origin.x, y: origin.y + 5, width: 0, height: 0)
            UIView.animate(withDuration: 0.2, animations: {
                self.alpha = 1.0
                self.backView.frame = CGRect(x: self.origin.x - self.width/2, y: self.origin.y + 5, width: self.width, height: self.height)
            }, completion: { (finished: Bool) in
                _ = self.backView.subviews.map{ $0.isHidden = false}
            })
        case .left:
            backView.frame = CGRect(x: origin.x + 5, y: origin.y, width: 0, height: 0)
            UIView.animate(withDuration: 0.2, animations: {
                self.alpha = 1.0
                self.backView.frame = CGRect(x: self.origin.x + 5, y: self.origin.y - self.height / 2, width: self.width, height: self.height)
            }, completion: { (finished: Bool) in
                _ = self.backView.subviews.map{ $0.isHidden = false}
            })
        case .right:
            backView.frame = CGRect(x: origin.x - 5, y: origin.y, width: 0, height: 0)
            UIView.animate(withDuration: 0.2, animations: {
                self.alpha = 1.0
                self.backView.frame = CGRect(x: self.origin.x - 5, y: self.origin.y - self.height / 2, width: -self.width, height: self.height)
            }, completion: { (finished: Bool) in
                _ = self.backView.subviews.map{ $0.isHidden = false}
            })
        case .bottom:
            backView.frame = CGRect(x: origin.x, y: origin.y - 5, width: 0, height: 0)
            UIView.animate(withDuration: 0.2, animations: {
                self.alpha = 1.0
                self.backView.frame = CGRect(x: self.origin.x - self.width / 2, y: self.origin.y - 5, width: self.width, height: -self.height)
            }, completion: { (finished: Bool) in
                _ = self.backView.subviews.map{ $0.isHidden = false}
            })
        case .leftTop:
            backView.frame = CGRect(x: origin.x + 5, y: origin.y, width: 0, height: 0)
            UIView.animate(withDuration: 0.2, animations: {
                self.alpha = 1.0
                self.backView.frame = CGRect(x: self.origin.x + 5, y: self.origin.y - 20, width: self.width, height: self.height)
            }, completion: { (finished: Bool) in
                _ = self.backView.subviews.map{ $0.isHidden = false}
            })
        case .leftBottom:
            backView.frame = CGRect(x: origin.x + 5, y: origin.y, width: 0, height: 0)
            UIView.animate(withDuration: 0.2, animations: {
                self.alpha = 1.0
                self.backView.frame = CGRect(x: self.origin.x + 5, y: self.origin.y - self.height + 20, width: self.width, height: self.height)
            }, completion: { (finished: Bool) in
                _ = self.backView.subviews.map{ $0.isHidden = false}
            })
        case .rightTop:
            backView.frame = CGRect(x: origin.x - 5, y: origin.y, width: 0, height: 0)
            UIView.animate(withDuration: 0.2, animations: {
                self.alpha = 1.0
                self.backView.frame = CGRect(x: self.origin.x - 5, y: self.origin.y - 20, width: -self.width, height: self.height)
            }, completion: { (finished: Bool) in
                _ = self.backView.subviews.map{ $0.isHidden = false}
            })
        case .rightBottom:
            backView.frame = CGRect(x: origin.x - 5, y: origin.y, width: 0, height: 0)
            UIView.animate(withDuration: 0.2, animations: {
                self.alpha = 1.0
                self.backView.frame = CGRect(x: self.origin.x - 5, y: self.origin.y - self.height + 20, width: -self.width, height: self.height)
            }, completion: { (finished: Bool) in
                _ = self.backView.subviews.map{ $0.isHidden = false}
            })
        case .topRight:
            backView.frame = CGRect(x: origin.x, y: origin.y + 5, width: 0, height: 0)
            UIView.animate(withDuration: 0.2, animations: {
                self.alpha = 1.0
                self.backView.frame = CGRect(x: self.origin.x + 20, y: self.origin.y + 5, width: -self.width, height: self.height)
            }, completion: { (finished: Bool) in
                _ = self.backView.subviews.map{ $0.isHidden = false}
            })
        case .topLeft:
            backView.frame = CGRect(x: origin.x, y: origin.y + 5, width: 0, height: 0)
            UIView.animate(withDuration: 0.2, animations: {
                self.alpha = 1.0
                self.backView.frame = CGRect(x: self.origin.x - 20, y: self.origin.y + 5, width: self.width, height: self.height)
            }, completion: { (finished: Bool) in
                _ = self.backView.subviews.map{ $0.isHidden = false}
            })
        case .bottomRight:
            backView.frame = CGRect(x: origin.x, y: origin.y - 5, width: 0, height: 0)
            UIView.animate(withDuration: 0.2, animations: {
                self.alpha = 1.0
                self.backView.frame = CGRect(x: self.origin.x - 20, y: self.origin.y - 5, width: self.width, height: -self.height)
            }, completion: { (finished: Bool) in
                _ = self.backView.subviews.map{ $0.isHidden = false}
            })
        case .bottomLeft:
            backView.frame = CGRect(x: origin.x, y: origin.y - 5, width: 0, height: 0)
            UIView.animate(withDuration: 0.2, animations: {
                self.alpha = 1.0
                self.backView.frame = CGRect(x: self.origin.x - self.width + 20, y: self.origin.y - 5, width: self.width, height: -self.height)
            }, completion: { (finished: Bool) in
                _ = self.backView.subviews.map{ $0.isHidden = false}
            })
        }
    }
    
    public func dismiss() {
        _ = backView.subviews.map{ $0.removeFromSuperview()}
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 0.0
            self.backView.frame = CGRect(x: self.origin.x, y: self.origin.y, width: 0, height: 0)
        }) { (finished: Bool) in
            self.removeFromSuperview()
        }
        
    }

}







