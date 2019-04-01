//
//  CustomAlert.swift
//  CustomActionSheet
//
//  Created by Narinder Singh on 30/03/19.
//  Copyright © 2019 Narinder Singh. All rights reserved.
//

import Foundation
import UIKit

public protocol CustomBottomSheetDelegate {
    func customSheet(actionForItemAt index: Int)
}

open class CustomBottomSheet: UIView {
    
    
   public var delegate: CustomBottomSheetDelegate?
    
    
    /// Background view
    private var dimView:UIView!
    
    
    /// ActionSheet Image
    private var ivLogo:UIImageView!
    
    
    /// Main bottom container view
    private var containerView:UIView!
    
    /// Actions view
    private var actionView: UIView!
    
    
    private var spacerView: UIView!
    
    
    /// Number of actions like: ["Report","Block","Cancel"]
   open var actionTitle:[String]!
    
    /// Colors for each item in order: [.black,.black,.gray,.red]
   open var colors:[UIColor]!
    
    ///Height for each action button
   open var buttonHeight:CGFloat! = 60
    
    
    /// Animation duration to slide the bottom view
    open var animationDuration:Double! = 0.6
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /// To dismiss the action sheet popup
   open func dismissSheet() {
        dimView.fadeOut()
        ivLogo.popOut()
        containerView.slideOut(to: .bottom, x: 0, y: self.frame.maxY, duration: animationDuration+0.4, delay: 0) { (finished) in
            
            self.delegate = nil
            self.removeFromSuperview()
        }
    }
    
    
    /// call one time to create and set basic layout for popup view
   open func setupViewElements(){
        
        //Adding Dim view for light black background
        dimView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        dimView.backgroundColor = .black
        dimView.alpha = 0.4
        self.addSubview(dimView)
        
        
        setupActionSheet()
        spacerView.roundedButton()
    }
    
    
    /// create action buttons and adjust the frame for buttons and logo
    fileprivate func setupActionSheet(){
        
        // check if titles are not nil, as atleat one action is required
        if actionTitle == nil {
            fatalError("action are required: atleast one action is required")
        }
        
        // Getting height for action view
        let containerHeight = CGFloat(actionTitle.count)*buttonHeight
        
        containerView = UIView(frame: CGRect(x: 0, y: self.frame.height-containerHeight-22, width: self.frame.width, height: containerHeight+22))
    
        
        actionView = UIView()
        actionView.frame = CGRect(x: 0, y: containerView.frame.height-containerHeight, width: self.frame.width, height: containerHeight)
        actionView.backgroundColor = .white
        

        spacerView = UIView(frame: CGRect(x: 0, y: actionView.frame.minY-22, width: self.frame.width, height: 22))
        spacerView.backgroundColor = .white
        
        
        ivLogo = UIImageView(frame: CGRect(x: self.frame.width/2-32, y: containerView.frame.origin.y-32, width: 64, height: 64))
        ivLogo.image  = #imageLiteral(resourceName: "t-honeycomb")
        ivLogo.contentMode = .scaleAspectFit
        
        // Creating and Adding action in actionview
        for (index, action) in actionTitle.enumerated() {
            let button = UIButton()
            button.frame = CGRect(x: 0.0, y: CGFloat(index)*buttonHeight, width: self.frame.width, height: buttonHeight)
            button.setTitle(action, for: .normal)
            button.setTitleColor(colors[index], for: .normal)
            button.tag = index
            button.addTarget(self, action: #selector(buttinAction(button:)), for: .touchUpInside)
            
            actionView.addSubview(button)
            if(index < actionTitle.count-1){
                let lineView = UIView(frame: CGRect(x: 0, y: button.frame.maxY, width: self.frame.width, height: 0.5))
                lineView.backgroundColor = .lightGray
                actionView.addSubview(lineView)
            }
        }
        
        containerView.addSubview(actionView)
        containerView.addSubview(spacerView)
        
        self.addSubview(containerView)
        self.addSubview(ivLogo)

        //Animate view
        containerView.bounceIn(from: .bottom, x: 0, y:  self.frame.height-containerHeight-22, duration: animationDuration, delay: 0.001) { (finished) in
            print(123)
        }

        ivLogo.popIn(fromScale: 0, duration: animationDuration-0.1, delay: 0.2) { (done) in
            
        }
    }
    
    
    
    @objc fileprivate func buttinAction(button:UIButton)  {
        print(button.tag)
        delegate?.customSheet(actionForItemAt: button.tag)
    }
    
    
}

