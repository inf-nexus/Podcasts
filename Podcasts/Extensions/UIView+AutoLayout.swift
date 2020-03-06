//
//  UIView+AutoLayout.swift
//  Project10
//
//  Created by Jacob Contreras on 2/28/20.
//  Copyright © 2020 Jacob Contreras. All rights reserved.
//

import UIKit

extension UIView {
    
    enum guide {
        case margins, safeArea
    }
    
    @discardableResult
    func anchorTop(to anchor: NSLayoutYAxisAnchor, padding: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: anchor, constant: padding).isActive = true
        
        return self
    }
    
    @discardableResult
    func anchorBottom(to anchor: NSLayoutYAxisAnchor, padding: CGFloat = 0) -> UIView {
           translatesAutoresizingMaskIntoConstraints = false
           bottomAnchor.constraint(equalTo: anchor, constant: -padding).isActive = true
           
           return self
       }
    
    @discardableResult
    func anchorLeading(to anchor: NSLayoutXAxisAnchor, padding: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: anchor, constant: padding).isActive = true
        
        return self
    }
    
    @discardableResult
    func anchorTrailing(to anchor: NSLayoutXAxisAnchor, padding: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        trailingAnchor.constraint(equalTo: anchor, constant: -padding).isActive = true
        
        return self
    }
    
    @discardableResult
    func anchorCenterX(to anchor: NSLayoutXAxisAnchor, padding: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: anchor, constant: padding).isActive = true
        
        return self
    }
    
    @discardableResult
    func anchorCenterY(to anchor: NSLayoutYAxisAnchor, padding: CGFloat = 0) -> UIView {
          translatesAutoresizingMaskIntoConstraints = false
          centerYAnchor.constraint(equalTo: anchor, constant: padding).isActive = true
          
          return self
      }
    
    @discardableResult
    func setWidth(to width: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        
        return self
    }
    
    @discardableResult
    func anchorWidth(to anchor: NSLayoutDimension, scale: CGFloat = 1, padding: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: anchor, multiplier: scale, constant: padding).isActive = true
            
        return self
    }
    
    @discardableResult
    func anchorHeight(to anchor: NSLayoutDimension, scale: CGFloat = 1, padding: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: anchor, multiplier: scale, constant: padding).isActive = true
            
        return self
    }
    
    @discardableResult
    func setHeight(_ width: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: width).isActive = true
        
        return self
    }
    
    @discardableResult
    func fillSuperview(paddingTop: CGFloat = 0, paddingLeft: CGFloat = 0, paddingRight: CGFloat = 0, paddingBottom: CGFloat = 0, layoutGuide: guide? = nil) -> UIView {
        guard let superview = superview else { return self }
        translatesAutoresizingMaskIntoConstraints = false
        
        if let layoutGuide = layoutGuide {
            let _layoutGuide: UILayoutGuide
            
            switch layoutGuide {
            case .margins:
                _layoutGuide = superview.layoutMarginsGuide
                break
            case .safeArea:
                _layoutGuide = superview.safeAreaLayoutGuide
                break
            }
            
            NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: _layoutGuide.topAnchor, constant: paddingTop),
                bottomAnchor.constraint(equalTo: _layoutGuide.bottomAnchor, constant: -paddingBottom),
                leadingAnchor.constraint(equalTo: _layoutGuide.leadingAnchor, constant: paddingLeft),
                trailingAnchor.constraint(equalTo: _layoutGuide.trailingAnchor, constant: -paddingRight),
                
            ])
            
        } else {
            
            NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: superview.topAnchor, constant: paddingTop),
                bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -paddingBottom),
                leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: paddingLeft),
                trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -paddingRight),
                
            ])
            
        }
        
        return self
        
    }
    
    @discardableResult
    func centerVertically() -> UIView {
        
        guard let superview = superview else { return self }
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
        
        return self
    }
    
    @discardableResult
    func centerHorizontally() -> UIView {
        guard let superview = superview else { return self }

        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        
        return self
    }
}
