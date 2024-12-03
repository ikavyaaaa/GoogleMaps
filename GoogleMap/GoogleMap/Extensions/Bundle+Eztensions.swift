//
//  Bundle+Eztensions.swift
//  ePrice-Label
//
//  Created by Kavya Krishna K. on 28/02/24.
//

import class Foundation.Bundle

private class BundleFinder {}

extension Foundation.Bundle {
    static var _module: Bundle = {
        let bundleName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String

        let candidates = [
            Bundle.main.resourceURL,

            Bundle(for: BundleFinder.self).resourceURL,

            // For command-line tools.
            Bundle.main.bundleURL,
        ]

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        // This should be a fallback for Carthage.
        return Bundle(for: AddOutletVC.self)
    }()
}

