//
//  ViewController.swift
//  ARActivityIndicator
//
//  Created by ar.warraich@outlook.com on 10/31/2018.
//  Copyright (c) 2018 ar.warraich@outlook.com. All rights reserved.
//

import UIKit
import ARActivityIndicator

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showIndicator(_ sender: UIButton) {
        ARActivityIndicator.shared.showActivityIndicator()
        ARActivityIndicator.shared.hideActivityIndicator(withAnimation: true, withDelay: 3)
    }
    
}

