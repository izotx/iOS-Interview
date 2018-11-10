//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        super.loadView()

        let view1 = UIView()
        view1.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
 
        view1.addConstraints([
            NSLayoutConstraint(item: view1, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 10),
            NSLayoutConstraint(item: view1, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: -10),
            NSLayoutConstraint(item: view1, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 10),
            NSLayoutConstraint(item: view1, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: -10)
        ]);
        
        self.view.addSubview(view1)
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false 
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        label.backgroundColor = .red
        
        view1.addSubview(label)
    }

    
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
