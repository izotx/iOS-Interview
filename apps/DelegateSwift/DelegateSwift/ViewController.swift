//
//  ViewController.swift
//  DelegateSwift
//
//  Created by Janusz Chudzynski on 11/26/18.
//  Copyright © 2018 Janusz Chudzynski. All rights reserved.
//

import UIKit

protocol TapProtocol:class {
    func buttonTapped()
}

class ViewController: UIViewController {
    weak var delegate:TapProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func buttonTapped(_ sender: Any) {
        self.delegate?.buttonTapped()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

