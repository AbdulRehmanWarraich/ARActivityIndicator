//
//  ARActivityIndicator.swift
//  ARActivityIndicator
//
//  Created by AbdulRehman Warraich on 11/1/18.
//

import Foundation

//MARK:- MBActivityIndicator Class
public class ARActivityIndicator {
    
    // MARK:- Shared Instance
    public static let shared = ARActivityIndicator()
    
    // MARK:- Properties
    private var container: UIView = UIView()
    private var loadingView: UIView = UIView()
    private var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    private let containerViewTag = 92119211
    
    private var loaderCount = 0
    
    // MARK:- Constructor
    private init() {
        
        container.tag = self.containerViewTag
        container.frame = UIScreen.main.bounds
        container.center = UIScreen.main.bounds.center
        
        container.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = container.center
        loadingView.backgroundColor = UIColor.black
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40);
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        activityIndicator.center = CGPoint(x:loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2);
        
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
    }
    
    
    /**
     Show customized activity indicator.
     
     - parameter withAnimation: show with animation or not. Bydefault it's true.
     
     - returns: void.
     */
    public func showActivityIndicator(withAnimation : Bool = true, withDelay delay: TimeInterval = 0) {
        
        if let window = UIApplication.shared.keyWindow {
            
            loaderCount = loaderCount + 1
            
            if window.viewWithTag(self.containerViewTag) == nil {
                window.addSubview(container)
            }
            
            window.bringSubviewToFront(container)
            
            if(withAnimation) {
                self.container.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
                self.container.alpha = 1
                
                UIView.animate(withDuration: 0.3, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 4, options: .curveEaseInOut, animations: {
                    
                    self.container.transform = .identity
                    
                }, completion:nil)
                
            } else {
                
                self.container.alpha = 1
                self.container.transform = .identity
            }
            
            self.activityIndicator.startAnimating()
        }
    }
    
    
    /**
     Hide activity indicator.
     
     - parameter withAnimation: Hide with animation or not. Bydefault it's true.
     
     - returns: void.
     */
    public func hideActivityIndicator(withAnimation: Bool = true, withDelay delay: TimeInterval = 0) {
        
        self.loaderCount = loaderCount - 1
        
        if (loaderCount <= 0) {
            self.loaderCount = 0
            
            if(withAnimation) { //With Animation
                UIView.animate(withDuration: 0.3, delay: delay, usingSpringWithDamping: 1, initialSpringVelocity: 8, options: .curveEaseIn, animations: {
                    self.container.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
                    self.container.alpha = 0
                    
                }, completion: { (isCompleted) in
                    
                    if isCompleted {
                        self.activityIndicator.stopAnimating()
                        self.container.removeFromSuperview()
                        self.container.transform = .identity
                    }
                })
                
            } else { // WithOut Animation
                self.container.alpha = 0
                self.activityIndicator.stopAnimating()
                self.container.removeFromSuperview()
            }
        }
    }
    
    /**
     Hide all activity indicators.
     
     - returns: void.
     */
    public func removeAllActivityIndicator() {
        
        self.loaderCount = 0
        self.hideActivityIndicator()
        
        UIApplication.shared.keyWindow?.subviews.forEach({ (aView) in
            
            // If found in window subview then remove
            if aView.tag == self.containerViewTag {
                
                if let activityIndicator = (aView.subviews.first ?? UIView()).subviews.first as? UIActivityIndicatorView {
                    activityIndicator.stopAnimating()
                }
                aView.removeFromSuperview()
            }
        })
    }
}



// MARK:- CGRect extension -

extension CGRect {
    var x: CGFloat {
        get {
            return self.origin.x
        }
        set {
            self.origin.x = newValue
        }
    }
    
    var y: CGFloat {
        get {
            return self.origin.y
        }
        
        set {
            self.origin.y = newValue
        }
    }
    
    var center: CGPoint {
        return CGPoint(x: self.x + self.width / 2, y: self.y + self.height / 2)
    }
}
