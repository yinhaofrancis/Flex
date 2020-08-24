//
//  NEScrollView.swift
//  NestScrollView
//
//  Created by hao yin on 2020/8/24.
//  Copyright © 2020 Himalaya. All rights reserved.
//

import UIKit

public class NEScrollView: UIScrollView,UIGestureRecognizerDelegate,UIScrollViewDelegate {
    @objc @IBOutlet public var verticalScrollViews:[UIScrollView]?
    @objc @IBOutlet public var horizontalScrollView:UIScrollView?
    
    public var currentChildScrollView:UIScrollView?{
        guard let hs = self.horizontalScrollView else { return self.verticalScrollViews?.first }
        let indx = Int(hs.contentSize.width / hs.frame.size.width)
        guard indx < verticalScrollViews?.count ?? 0 else {return nil}
        return verticalScrollViews?[indx]
    }
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
  
        guard let  currentsc = self.currentChildScrollView else { return }
        if self.YSpeed < 0 && self.canUp{
            currentsc.stopTop()
        }
        else if self.YSpeed > 0 && currentsc.canDown{
            self.stopLast()
        }
        print(scrollView.contentOffset)
    }
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let osc = otherGestureRecognizer.view as? UIScrollView else {
            return false
        }
        guard let vsc = self.verticalScrollViews else { return false }
        if vsc.contains(osc) {
            return true
        }
        return false
        
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.bounces = false
    }
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.delegate = self
        self.showsVerticalScrollIndicator = false
        self.bounces = false
        self.showsHorizontalScrollIndicator = false
    }
}

public extension UIScrollView {

    var canUp:Bool{
        return self.contentOffset.y + self.frame.height + contentInset.bottom < self.contentSize.height
    }
    var canDown:Bool{
        return self.contentOffset.y > -self.contentInset.top;
    }
    var YSpeed:CGFloat{
        return self.panGestureRecognizer.velocity(in: self).y
    }
    var isAtTopOfScrollView:Bool{
        return self.contentOffset.y + self.contentInset.top <= 0;
    }
    func stopTop(){
        self.setContentOffset(CGPoint(x: 0, y: -self.contentInset.top), animated: false)
    }
    
    func stopLast(){
        self.setContentOffset(CGPoint(x: 0, y: self.contentSize.height - self.frame.size.height), animated: false)
    }
    
}
