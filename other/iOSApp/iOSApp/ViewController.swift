//
//  ViewController.swift
//  iOSApp
//
//  Created by Janusz Local Admin on 11/8/18.
//  Copyright © 2018 izotx. All rights reserved.
//

import UIKit

class ViewController : UIViewController {
    weak var label:UILabel!
    var xcon:NSLayoutConstraint!
    var ycon:NSLayoutConstraint!
    
    @IBAction func animate(_ sender: Any) {
        self.xcon.constant = 30
        self.ycon.constant = 30
//        self?.ycon.constant = 50
//        self?.xcon.constant = 50
        
        UIView.animate(withDuration: 1, animations: {
            [weak self] in
            self?.view.layoutIfNeeded()

        }) { (completed) in
            
        }
        
//
//        UIView.animate(withDuration: 4) {[weak self] in
//            self?.ycon.constant = 50
//            self?.xcon.constant = 50
//        }
    
    }
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .white
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        //        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        label.backgroundColor = UIColor.clear
        xcon = label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ycon = label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        xcon.isActive = true
        ycon.isActive = true
        
        
        self.label = label
        
        //        self.view = view
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
}

