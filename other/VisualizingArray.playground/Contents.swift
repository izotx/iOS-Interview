//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class Animation{
    let delay:TimeInterval
    let dx:CGFloat
    let dy:CGFloat
    let duration:TimeInterval
    let view:UIView

    init(delay:TimeInterval, dx:CGFloat, dy:CGFloat, duration:TimeInterval, view:UIView) {
        self.delay = delay
        self.dx = dx
        self.dy = dy
        self.duration = duration
        self.view = view
    }
}



class MyViewController : UIViewController {
    var visualizer:ArrayVisualizer<Int>!
    let a = [3,2,0,8,5,10,6]
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        self.view = view
        visualizer = ArrayVisualizer(frame: CGRect(x: 0, y: 0, width: 380, height: 50))
        self.view.addSubview(visualizer)
        visualizer.visualizeArray(a)

        let button = UIButton()
        button.frame = CGRect(x: 150, y: 200, width: 25, height: 25)
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(buttonPressed), for: UIControl.Event.touchUpInside)
        button.setTitle("8", for: .normal)
        button.backgroundColor = .blue

    }

    
    @objc func buttonPressed(){
        
        let targetIndex = Int(arc4random_uniform(UInt32(a.count)))
        let currentIndex = Int(arc4random_uniform(UInt32(a.count)))
        print("Random Index \(currentIndex) target index \(targetIndex)")
        
//        visualizer.resetAnimations()
//        visualizer.moveToIndex(2, 6)
//        visualizer.animateChanges()
        
        visualizer.resetAnimations()
        visualizer.moveToIndex(8, 1)
        visualizer.animateChanges()
        
     }
}


class ArrayElement:UILabel{
    var selected:Bool = false{
        didSet{
            styleIt()
        }
    }
    
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

        if(selected){
            self.backgroundColor = UIColor.blue
            self.alpha = 0.8
            self.textColor = .white
        }
        else{
            self.backgroundColor = UIColor.clear
            self.alpha = 1
            self.textColor = .black
        }

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
    
    
    func moveToIndex(_ value:Int, _ currentIndex:Int, _ targetIndex:Int){
        
        guard let element = getElement(value) else{
           return
        }
        
        //select
        selectElement(element: element)
        //move down
        moveVertically(element, false)
        //move horizontally
        
        moveHorizontally(element, targetIndex - currentIndex)
//        //move elements to make space
//        //check if we are moving right or left
        if targetIndex > currentIndex{ //Shift elements to the left
            for i in currentIndex + 1 ... targetIndex{
                let el = self.arrayElements[i]
                moveHorizontally(el, -1)
            }
        }
        else{
            for i in targetIndex ..< currentIndex{
                let el = self.arrayElements[i]
                print(el.text)
                moveHorizontally(el, 1)
            }
        }

        //move up
        moveVertically(element, true)

        //Deselect
        selectElement(element: element)
        
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
    
    
    func selectElement(element:ArrayElement){
        element.selected = !element.selected
    }
    
    func selectElement(_ value:Value){
        
        self.arrayElements.map { (arrayElement) -> ArrayElement in
            arrayElement.selected = false
            return arrayElement
        }
        
        let list = self.arrayElements.filter { (arrayElement) -> Bool in
            return arrayElement.text == "\(value)"
        }
        
        if let element = list.first{
            element.selected = !element.selected
          
        }
    }
    

    func moveVertically(_ element:ArrayElement, _ up:Bool){
        let offsetY =  up ? -element.frame.height : element.frame.height
        animations.append(Animation(delay: 0, dx: 0, dy: offsetY, duration: 1, view: element))
    }

    func moveHorizontally(_ element:ArrayElement, _ index:Int ) -> Void{
        animations.append(Animation(delay: 0, dx: CGFloat(index) * element.frame.width, dy: 0, duration: 1, view: element))
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
                  animation.view.frame = animation.view.frame.offsetBy(dx: animation.dx, dy: animation.dy)

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
