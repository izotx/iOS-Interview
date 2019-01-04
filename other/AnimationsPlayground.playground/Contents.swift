//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class Animation{
    let view:UIView
    let frame:CGRect
    let duration:TimeInterval
    
    init(_ view:UIView, frame:CGRect, duration:TimeInterval) {
        self.view = view
        self.frame = frame
        self.duration = duration
        
    }
    
}


class MyViewController : UIViewController {
    var label: UILabel!
    var animations = [Animation]()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    
        
        let btn = UIButton(type: .roundedRect)
        btn.frame = CGRect(x: 150, y: 400, width: 200, height: 20)
        self.view.addSubview(btn)
        btn.addTarget(self, action: #selector(moveIt2), for: .touchUpInside)
        btn.setTitle("An", for: .normal)
        let f1 =  self.label.frame.offsetBy(dx: 10, dy: 10)
        let a1 = Animation(label, frame:f1, duration:1)
        var f2 =  f1.offsetBy(dx: 50, dy: 10)
        
        let a2 = Animation(label, frame: self.label.frame.offsetBy(dx: 50, dy: 0), duration: 1)
        
        self.animations.append(a1)
        self.animations.append(a2)
        
    }
    
    @objc func moveIt(element:UIView){
        print("Move It")
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: .calculationModeLinear, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                element.frame = element.frame.offsetBy(dx: 10, dy: 10)
            })
            
        }) { (completed) in
            print("Completed")
        }
    
    }
    
    @objc func moveIt2(){
        
        print("Move It 2 ")
        let totalDuration = self.animations.reduce(0) { (r, a) -> TimeInterval in
            return r + a.duration
        }
        
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: .calculationModeLinear, animations: {[weak self] in
            guard let weakSelf = self else {
                return
            }
            
            for (index,a) in weakSelf.animations.enumerated(){
                
                UIView.addKeyframe(withRelativeStartTime: TimeInterval(index)/totalDuration, relativeDuration: 1.0/2.0, animations: {
                        print(a.view.frame)
                        a.view.frame = a.frame
                        print(a.view.frame)

                })

            }
            
        }) { (completed) in
            
        }
        
    }
    
    
    
}


// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
