//
//  ViewController.swift
//  LifecycleTester
//
//  Created by Janusz Chudzynski on 11/25/18.
//  Copyright © 2018 Janusz Chudzynski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func showModal(_ sender: Any) {
        let storyboard =  UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "ModalViewController") as! ModalViewController
        
        self.present(vc, animated: true) {
            //
              print("\(#function)")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("\(#function)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
           print("\(#function)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      print("\(#function)")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       print("\(#function)")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
       print("\(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("\(#function)")
    }
    
    override func viewLayoutMarginsDidChange() {
          print("\(#function)")
    }
    
    override func viewSafeAreaInsetsDidChange() {
        print("\(#function)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("\(#function)")
    }
}

