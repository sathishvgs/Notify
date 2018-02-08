//
//  NotifyHelper.swift
//  Notify
//
//  Created by Karthik on 1/14/18.
//

import Foundation
import PodAsset

public enum NotifyIcon: String {
    
    case closeGray
    case closeWhite
    
    var name: String {
        
        switch self {
            
        case .closeGray:
            return "close_gray"
            
        case .closeWhite:
            return "close_white"
        }
    }
    
    var icon: UIImage {
        return NotifyHelper.getImageFromBundle(name: self.name)
    }
}

public enum NotifyColor {
    
    case green
    case gray
    case red
    case orange
    case purple
    case lightBlue
    case orchid
    case salmon
    
    var color: UIColor {
        switch self {
        case .green:
            return UIColor(hexString: "#43a047")
        case .gray:
            return UIColor(hexString: "#607d8b")
        case .red:
            return UIColor(hexString: "##F44336")
        case .orange:
            return UIColor(hexString: "#ff5722")
        case .purple:
            return UIColor(hexString: "#7c4dff")
        case .lightBlue:
            return UIColor(hexString: "#29b6f6")
        case .orchid:
            return UIColor(hexString: "#6666FF")
        case .salmon:
            return UIColor(hexString: "#FF6666")
        }
    }
}

extension UIView {
    
    static func view(FromNib nib: String? = "Notify") -> UIView? {
        guard let podBundle = PodAsset.bundle(forPod: "Notify"), let nib = podBundle.loadNibNamed("Notify", owner: self, options: nil)  else{
            fatalError()
        }
        return nib.first as? UIView
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

class NotifyHelper {
    
    public static func getImageFromBundle(name: String = "Notify") -> UIImage {
        
        let podBundle = PodAsset.bundle(forPod: name)
        
        guard let image = UIImage(named: name, in: podBundle, compatibleWith: nil) else {
            return UIImage()
        }
        
        return image
    }
}


//public protocol OptionalType {
//    associatedtype Wrapped
//    var value: Wrapped? { get }
//}
//
//extension Optional: OptionalType {
//    public var value: Wrapped? {
//        return self
//    }
//    
//    @discardableResult
//    public func hasData(_ closure: (Wrapped) -> Void) -> Optional {
//        if case .some(let item) = self {
//            closure(item)
//        }
//        
//        return self
//    }
//    
//    public func otherwise(_ closure: () -> Void) {
//        if case .none = self {
//            closure()
//        }
//    }
//}



