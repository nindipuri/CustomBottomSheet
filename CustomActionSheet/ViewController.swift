//
//  ViewController.swift
//  CustomActionSheet
//
//  Created by Narinder Singh on 29/03/19.
//  Copyright © 2019 Narinder Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
     var actionSheet: CustomBottomSheet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        actionSheet = CustomBottomSheet(frame: view.frame)
        actionSheet.colors = [.red,.black,.black,.black]
        actionSheet.actionTitle = ["Block","Report","Unfriend","Cancel"]
        actionSheet.delegate = self
        actionSheet.buttonHeight = 64
        actionSheet.animationDuration = 0.7
        
        view.addSubview(actionSheet)
        actionSheet.setupViewElements()
    }

}

extension ViewController: CustomBottomSheetDelegate{
    
    func customSheet(actionForItemAt index: Int) {
        
        switch index {
            
        case 0:
            print(index)

            break
            
        default:
            actionSheet.dismissSheet()
            break
        }
        
    }
}

