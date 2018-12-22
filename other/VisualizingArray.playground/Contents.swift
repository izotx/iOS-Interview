//: A UIKit based Playground for presenting user interface

/**
    Algorithm
    Observe Changes to array
    Visualize
*/

import UIKit
import PlaygroundSupport
class Theme{
    static let selectedBackgroundColor:UIColor = .blue
    static let unselectedBackgroundColor:UIColor  = .clear
    static let selectedFontColor:UIColor = .white
    static let unselectedFontColor:UIColor  = .black
    
}



class Animation{
    let delay:TimeInterval
    let dx:[CGFloat]
    let dy:[CGFloat]
    let duration:TimeInterval
    let views:[UIView]
    var colors:[UIColor]?

    init(delay:TimeInterval, dx:[CGFloat], dy:[CGFloat], duration:TimeInterval, views:[UIView]) {
        self.delay = delay
        self.dx = dx
        self.dy = dy
        self.duration = duration
        self.views = views
    }
    
    convenience init(delay:TimeInterval, dx:[CGFloat], dy:[CGFloat], duration:TimeInterval, views:[UIView],colors:[UIColor]) {
        self.init(delay: delay, dx: dx, dy: dy, duration: duration, views: views )
        self.colors = colors
    }
}



class MyViewController : UIViewController {
    var visualizer:ArrayVisualizer<Int>!
    var button:UIButton!
    var button1:UIButton!
    
    let a = [3,2,0,8,5,10,6]
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        self.view = view
        visualizer = ArrayVisualizer(frame: CGRect(x: 0, y: 0, width: 380, height: 50))
        self.view.addSubview(visualizer)
        visualizer.visualizeArray(a)

        button = UIButton()
        button.frame = CGRect(x: 150, y: 200, width: 25, height: 25)
        button1 = UIButton()
        button1.frame = CGRect(x: 150, y: 400, width: 25, height: 25)
        
        self.view.addSubview(button)
        self.view.addSubview(button1)

        
        button.addTarget(self, action: #selector(buttonPressed), for: UIControl.Event.touchUpInside)
        button.setTitle("8", for: .normal)
        button1.setTitle("1", for: .normal)
        button.backgroundColor = .blue
        button.backgroundColor = .red
    }
    
    override func viewDidLoad() {
//        UIView.animate(withDuration: 4) {
//            self.button.backgroundColor = UIColor.red
//        }
    
//        UIView.animateKeyframes(withDuration: 5, delay: 0, options: .calculationModeLinear, animations: {
//           let fr = self.button.frame
//           let fr1  = self.button1.frame
//            
//            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/2.0, animations: {
//                self.button.frame = .zero
//                self.button.backgroundColor = .red
//                self.button1.backgroundColor = .black
//                self.button1.frame = fr
//            })
//            UIView.addKeyframe(withRelativeStartTime: 1/2.0, relativeDuration: 1/2.0, animations: {
//                self.button.frame = fr
//                self.button.backgroundColor = .blue
//                self.button1.frame = fr1 
//            })
//            
//            
//        }) { (completed) in
//            
//        }
    
    }

    
    @objc func buttonPressed(){
        
        let targetIndex = Int(arc4random_uniform(UInt32(a.count)))
        let currentIndex = Int(arc4random_uniform(UInt32(a.count)))
        print("Random Index \(currentIndex) target index \(targetIndex)")
        
//        visualizer.resetAnimations()
//        visualizer.moveToIndex(2, 6)
//        visualizer.animateChanges()
        
        visualizer.resetAnimations()
        visualizer.swapElements(3, 6, index1: 0, index2: 6 )
        visualizer.swapElements(2, 10, index1: 1, index2: 5 )
        visualizer.animateChanges()
        
     }
}


class ArrayElement:UILabel{
//    var selected:Bool = false{
//        didSet{
//            styleIt()
//        }
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        styleIt()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func styleIt(){
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
        self.textAlignment = .center

//        if(selected){
//            self.backgroundColor = UIColor.blue
//            self.alpha = 0.8
//            self.textColor = .white
//        }
//        else{
//            self.backgroundColor = UIColor.clear
//            self.alpha = 1
//            self.textColor = .black
//        }
    }
}

class ArrayVisualizer<Value:Comparable>:UIView{
    let width:CGFloat = 25;
    let height:CGFloat = 25;
    var arrayElements = [ArrayElement]()
    var animations = [Animation]()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    func getElement(_ value:Int)->ArrayElement?{
        let list = self.arrayElements.filter { (arrayElement) -> Bool in
            return arrayElement.text == "\(value)"
        }
        
        return list.first
    }
    
    func moveToIndex(_ value:Int, _ targetIndex:Int){
        guard let element = getElement(value) else{
            return
        }
        
        //check current index
        if let index = arrayElements.firstIndex(of: element)
        {
            moveToIndex(value, index, targetIndex)
        }
    }
    
    
    func swapElements(_ value1:Int, _ value2:Int, index1:Int, index2:Int){
        
        //move elements down
        guard let element1 = getElement(value1), let element2 = getElement(value2) else{
            return
        }
        
        //select
        selectElements([element1,element2], [true,true])
        //move down
        moveVertically([element1,element2], false)
        moveHorizontally([element1,element2], [(index2 - index1),(index1 - index2)])
        moveVertically([element1,element2], true)
        
        //make sure that internal model is in check
        self.arrayElements.swapAt(index1, index2)
        
        //Deselect
        selectElements([element1,element2], [false,false])
        
        
    }
    
    func moveToIndex(_ value:Int, _ currentIndex:Int, _ targetIndex:Int){
        
        guard let element = getElement(value) else{
           return
        }
        
        //select
        selectElements([element],[true])
        //move down
        moveVertically([element], false)
        //move horizontally
        
        moveHorizontally([element], [targetIndex - currentIndex])
//        //move elements to make space
//        //check if we are moving right or left
        if targetIndex > currentIndex{ //Shift elements to the left
            for i in currentIndex + 1 ... targetIndex{
                let el = self.arrayElements[i]
                moveHorizontally([el], [-1])
            }
        }
        else{
            for i in targetIndex ..< currentIndex{
                let el = self.arrayElements[i]
                print(el.text)
                moveHorizontally([el], [1])
            }
        }

        //move up
        moveVertically([element], true)

        //Deselect
        selectElements([element],[true])
        
        //remove and insert (cleanup internal data model)
        let r = arrayElements.remove(at: currentIndex)
        if(targetIndex == arrayElements.count){
            arrayElements.append(r)
        }
        else{
            arrayElements.insert(r, at: targetIndex)
        }


    }

    func styleIt(){
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 0.5
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func resetAnimations(){
        self.animations.removeAll()
    }
    
    func visualizeArray(_ array:Array<Value>){
        //Divide space into number of
        
        for (index,element) in array.enumerated(){
            let frame = CGRect(x: CGFloat(index) * width, y: 20, width: width, height: height)
            let label = ArrayElement(frame: frame)
            label.text = "\(element)"
            self.addSubview(label)
            self.arrayElements.append(label)
        }
    }
    
    

    func selectElements(_ elements:[ArrayElement], _ selected:[Bool]){
        
        var colors = [UIColor]()
    
        for (index,element) in elements.enumerated(){
            if selected[index]{
                colors.append(Theme.selectedBackgroundColor)
            }
            else{
                colors.append(Theme.unselectedBackgroundColor)
            }
        }
        
        var offset = Array(repeating: CGFloat(0), count: elements.count)
        
        animations.append(Animation(delay: 0, dx: offset, dy: offset, duration: 1, views: elements, colors: colors))
        
    }
    
    func selectElement(_ value:Value){
        
        self.arrayElements.map { (arrayElement) -> ArrayElement in
//            arrayElement.selected = false
            return arrayElement
        }
        
        let list = self.arrayElements.filter { (arrayElement) -> Bool in
            return arrayElement.text == "\(value)"
        }
        
//        if let element = list.first{
////            element.selected = !element.selected
//
//        }
    }
    

    func moveVertically(_ elements:[ArrayElement], _ up:Bool){

        var dx = [CGFloat]()
        var dy = [CGFloat]()
        
        
        for element in elements{
            let offsetY =  up ? -element.frame.height : element.frame.height
            dy.append(offsetY)
            dx.append(0)
        }
        
        animations.append(Animation(delay: 0, dx: dx, dy: dy, duration: 1, views: elements))
    }

    func moveHorizontally(_ elements:[ArrayElement], _ offset:[Int] ) -> Void{
        var dx = [CGFloat]()
        var dy = [CGFloat]()
        
        for (index,element) in elements.enumerated(){
            dy.append(0)
            dx.append(CGFloat(offset[index]) * element.frame.width)
        }
        
        animations.append(Animation(delay: 0, dx: dx, dy: dy, duration: 1, views: elements))
    }
    

    
    func animateChanges(){
        let totalDuration = animations.reduce(0) { (result, animation) -> TimeInterval in
                return result + animation.duration
        }
        
        UIView.animateKeyframes(withDuration: totalDuration, delay: 0, options: .calculationModeLinear, animations: { [weak self] in
            var currentTime:TimeInterval = 0
            guard let weakself = self else{
                return
            }
            for animation in weakself.animations{
                
                let relativeDuration = animation.duration / totalDuration
                let elapsedTime = currentTime / totalDuration
               
                
                UIView.addKeyframe(withRelativeStartTime: elapsedTime , relativeDuration: relativeDuration, animations: {
                    print("Relative Duration: \(relativeDuration)")
                    print("Current Time: \(currentTime)")
                    for (index, view) in animation.views.enumerated(){
                       view.frame = view.frame.offsetBy(dx: animation.dx[index], dy: animation.dy[index])
                    
                        if let colors = animation.colors{
                            print("a")
                            if let v = view as? ArrayElement{
                              if colors[index] == Theme.selectedBackgroundColor
                              {
                                v.backgroundColor = Theme.selectedBackgroundColor
                                v.textColor = Theme.selectedFontColor
                              }
                              else{
                                v.backgroundColor = Theme.unselectedBackgroundColor
                                v.textColor = Theme.unselectedFontColor
                                }
                            }
                        }
                    }
                })
                currentTime = currentTime + animation.duration
            }
        }) { (completed) in
            if completed{
                
            }
        }
    }
}


// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
