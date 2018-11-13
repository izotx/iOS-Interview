//
//  ViewController.swift
//  AutolayoutFun
//
//  Created by Janusz Chudzynski on 11/6/18.
//  Copyright © 2018 izotx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   // weak var square: UIView!
    
//    override func loadView() {
//        super.loadView()
//
//        let square = UIView()
//        self.view.addSubview(square)
//        square.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addConstraints([
//            NSLayoutConstraint(item: square, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1.0, constant: 10),
//            NSLayoutConstraint(item: square, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1.0, constant: -10),
//            NSLayoutConstraint(item: square, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 10),
//            NSLayoutConstraint(item: square, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: -10),
//            ])
//       // self.square = square
//        square.backgroundColor = .yellow
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       // self.square.backgroundColor = .yellow
    }

        override func loadView() {
        super.loadView()

        setupWithAnchors()
            
//        let rectangle = UIView()
//        self.view.addSubview(rectangle)
//        rectangle.translatesAutoresizingMaskIntoConstraints = false
//
//
//        self.view.addConstraints([
//             NSLayoutConstraint(item: rectangle, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1.0, constant: 10),
//
//            NSLayoutConstraint(item: rectangle, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1.0, constant: -10),
//            NSLayoutConstraint(item: rectangle, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 10),
//            NSLayoutConstraint(item: rectangle, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: -10)
//            ]);

         
    }
    
    
    
    
    //Alternative use anchors
    func setupWithAnchors(){
        let rectangle = UIView()
        self.view.addSubview(rectangle)
        rectangle.translatesAutoresizingMaskIntoConstraints = false
        let constant:CGFloat = 10
        
        rectangle.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant:constant).isActive = true
        rectangle.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -constant).isActive = true
        rectangle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: constant).isActive = true

        rectangle.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -constant).isActive = true
        
        rectangle.backgroundColor = .yellow
        rectangle.layer.cornerRadius = 50.0
        rectangle.layer.masksToBounds = true

    }

}

