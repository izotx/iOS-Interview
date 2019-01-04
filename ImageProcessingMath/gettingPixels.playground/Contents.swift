import UIKit
import CoreGraphics

var str = "Hello, playground"
let img = UIImage(named: "firewodd.jpg")!
let cgImage = img.cgImage!

let pixelData = CGDataProvider(data: cgImage.dataProvider!.data!)!.data!

//Array of pixels, depending on the color scheme
var data = CFDataGetBytePtr(pixelData)!
//for i in 0..<Int(img.size.width)*4{
//    print(data[i])
//    if(data[i]%4 != 0){
//      // data[i] = 5
//    }
//}


func changePixel(_ img:UIImage,_ x:Int, _ y:Int)->UIImage?{
    let cgimage = img.cgImage!
    let width = cgimage.width
    let height = cgimage.height

    let pixels = malloc(height * width * 4)!
    
    //Color space
    let colorSpaceRef = CGColorSpaceCreateDeviceRGB()
    let context = CGContext.init(data: pixels, width: width, height: height, bitsPerComponent: 8, bytesPerRow: 4 * width, space: colorSpaceRef, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)

    for y in 0..<height{
        for x in 0..<width{
            _ = (width * y + x) * 4
//            pixels[index] = pixels[index] / 2  // R
//            pixels[index + 1]// G
//            pixels[index + 2]// B
        }
    }
    
    let imageRef = CGContext.makeImage(context!)
    free(pixels)
    return UIImage(cgImage: imageRef as! CGImage)
    }
   

//    let bitmap = CGBitmapContextCreate(pixels,width,height,8,4 * width,colorSpaceRef, CGImageAlphaInfo.premultipliedLast.rawValue)
    
    //kCGImageAlphaPremultipliedLast
    
}
