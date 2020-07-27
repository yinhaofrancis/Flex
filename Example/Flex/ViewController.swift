//
//  ViewController.swift
//  Flex
//
//  Created by yinhaofrancis on 07/23/2020.
//  Copyright (c) 2020 yinhaofrancis. All rights reserved.
//

import UIKit
import Flex
class ViewController: UIViewController {
    @IBOutlet weak var l: FlexView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for i in 0...50 {
            let a = UIView.nib(name:"fg")!
            a.layoutIfNeeded()
            l.addSubview(a)
        }
        l.containerAlign = .trailing
        l.layout()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

