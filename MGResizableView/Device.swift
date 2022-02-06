import CoreGraphics

enum Device: CaseIterable {
    case iPhone5
    case iPhone8
    case iPhone12Mini
    case iPhone12Pro
    case iPhone12ProMax
    case iPadAir
    case iPadPro11Inch
    case iPadPro12_9Inch
    
    var size: CGSize {
        switch self {
        case .iPhone5:          return CGSize(width: 320, height: 568)
        case .iPhone8:          return CGSize(width: 375, height: 667)
        case .iPhone12Mini:     return CGSize(width: 360, height: 780)
        case .iPhone12Pro:      return CGSize(width: 390, height: 844)
        case .iPhone12ProMax:   return CGSize(width: 428, height: 926)
        case .iPadAir:          return CGSize(width: 820, height: 1180)
        case .iPadPro11Inch:    return CGSize(width: 834, height: 1194)
        case .iPadPro12_9Inch:  return CGSize(width: 1024, height: 1366)
        }
    }
    
    var title: String {
        switch self {
        case .iPhone5:          return "iPhone5"
        case .iPhone8:          return "iPhone8"
        case .iPhone12Mini:     return "iPhone12Mini"
        case .iPhone12Pro:      return "iPhone12Pro"
        case .iPhone12ProMax:   return "iPhone12ProMax"
        case .iPadAir:          return "iPadAir"
        case .iPadPro11Inch:    return "iPadPro11Inch"
        case .iPadPro12_9Inch:  return "iPadPro12_9Inch"
        }
    }
}
