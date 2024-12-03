//
//  UIImage+Extension.swift
//  SwiftQRScanner
//
//  Created by Vinod Jagtap on 23/05/22.
//

#if os(iOS)
import Foundation
import UIKit

extension UIImage {
    func parseQR() -> String? {
        guard let image = CIImage(image: self) else {
            return nil
        }
        let detector = CIDetector(ofType: CIDetectorTypeQRCode,
                                  context: nil,
                                  options: [CIDetectorAccuracy: CIDetectorAccuracyHigh])
        let features = detector?.features(in: image) ?? []
        return features.compactMap { feature in
            return (feature as? CIQRCodeFeature)?.messageString
        }.joined()
    }
}

extension UIImage {
    static func decodeBase64ToImage(_ base64String: String) -> UIImage? {
        // Remove the "data:image/png;base64," prefix if present
        let cleanedBase64String = base64String.replacingOccurrences(of: "data:image/png;base64,", with: "")
        
        // Decode the base64 string
        guard let data = Data(base64Encoded: cleanedBase64String) else {
            return nil
        }
        
        // Convert to UIImage
        return UIImage(data: data)
    }
}
#endif
