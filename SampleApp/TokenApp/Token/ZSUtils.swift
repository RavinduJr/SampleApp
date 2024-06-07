import UIKit

let ZSTextEmpty = "\u{200B}"

class ZSUtils : NSObject {
   
   class func getRect(_ str: NSString, width: CGFloat, height: CGFloat, font: UIFont) -> CGRect {
      let rectangleStyle = NSMutableParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
      rectangleStyle.alignment = NSTextAlignment.center
      let rectangleFontAttributes = [NSAttributedString.Key.font: font, NSAttributedString.Key.paragraphStyle: rectangleStyle]
      return str.boundingRect(with: CGSize(width: width, height: height), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: rectangleFontAttributes, context: nil)
   }
   
   class func getRect(_ str: NSString, width: CGFloat, font: UIFont) -> CGRect {
      let rectangleStyle = NSMutableParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
      rectangleStyle.alignment = NSTextAlignment.center
      let rectangleFontAttributes = [NSAttributedString.Key.font: font, NSAttributedString.Key.paragraphStyle: rectangleStyle]
      return str.boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: rectangleFontAttributes, context: nil)
   }
   
   class func widthOfString(_ str: String, font: UIFont) -> CGFloat {
      let attrs = [NSAttributedString.Key.font: font]
      let attributedString = NSMutableAttributedString(string:str, attributes:attrs)
      return attributedString.size().width
   }
   
}

extension UIColor {
   func darkendColor(_ darkRatio: CGFloat) -> UIColor {
      var h: CGFloat = 0.0, s: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
      if (getHue(&h, saturation: &s, brightness: &b, alpha: &a)) {
         return UIColor(hue: h, saturation: s, brightness: b*darkRatio, alpha: a)
      } else {
         return self
      }
   }
}


extension String {
    subscript(value: PartialRangeUpTo<Int>) -> Substring {
        get {
            return self[..<index(startIndex, offsetBy: value.upperBound)]
        }
    }
    
    subscript(value: PartialRangeThrough<Int>) -> Substring {
        get {
            return self[...index(startIndex, offsetBy: value.upperBound)]
        }
    }
    
    subscript(value: PartialRangeFrom<Int>) -> Substring {
        get {
            return self[index(startIndex, offsetBy: value.lowerBound)...]
        }
    }
}
