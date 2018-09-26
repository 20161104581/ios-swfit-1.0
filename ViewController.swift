//
//  ViewController.swift
//  ios swfit
//
//  Created by 20161104581 on 2018/9/26.
//  Copyright © 2018年 20161104581. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var clmx: UITextField!
    
    @IBOutlet weak var clmy: UITextField!
    
    
    @IBOutlet weak var clmz: UITextField!
    
    
    @IBAction func text(_ sender: Any) {
     clmz.text = "\(Int(clmx.text!)! + Int(clmy.text!)!)"
    }
    
    @IBAction func pdd(_ sender: Any) {
    clmz.text = "\(Int(clmx.text!)! - Int(clmy.text!)!)"
        
    }
    
    @IBAction func chec(_ sender: Any) {
    clmz.text = "\(Int(clmx.text!)! * Int(clmy.text!)!)"
        
    }
    
    @IBAction func cf(_ sender: Any) {
    clmz.text = "\(Int(clmx.text!)! / Int(clmy.text!)!)"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

