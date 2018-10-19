//
//  StackViewToggle.swift
//  Converter
//
//  Created by Alan on 10/19/18.
//  Copyright © 2018 AlanG. All rights reserved.
//


import UIKit

extension UIStackView {
    
    @objc open class func animateVisibilityOfViews(visible: [UIView], hidden: [UIView], duration: TimeInterval = 0.25) {
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: [], animations: {
            if !visible.isEmpty {
                addKeyframesForVisibilityOfViews(visible, hidden: false)
            }
            if !hidden.isEmpty {
                addKeyframesForVisibilityOfViews(hidden, hidden: true)
            }
        }, completion: nil)
    }
    
    @objc open class func animateVisibilityOfViews(_ views: [UIView], hidden: Bool, duration: TimeInterval = 0.25) {
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: [], animations: {
            addKeyframesForVisibilityOfViews(views, hidden: hidden)
        }, completion: nil)
    }
    
    @objc open class func addKeyframesForVisibilityOfViews(_ views: [UIView], hidden: Bool) {
        UIView.addKeyframe(withRelativeStartTime: hidden ? 0.5 : 0, relativeDuration: 0.5, animations: {
            views.forEach {
                guard $0.isHidden != hidden else { return }
                $0.isHidden = hidden
            }
        })
        UIView.addKeyframe(withRelativeStartTime: hidden ? 0 : 0.5, relativeDuration: 0.5, animations: {
            views.forEach { $0.alpha = hidden ? 0 : 1 }
        })
    }
    
}

