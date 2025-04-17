//
//  ImageCache.swift
//  Appetizers
//
//  Created by Abdallah on 08/04/2025.
//

import UIKit

class ImageCache {
    static let shared = ImageCache()
    
    private let cache = NSCache<NSString, AnyObject>()
    private let maxCacheSize = 50*1024*1024 // 50MB limit
    
    private init() {
        cache.totalCostLimit = maxCacheSize
    }
    
    func setObject(_ object: AnyObject, forKey key: NSString) {
        cache.setObject(object, forKey: key)
    }
    
    func object(forKey key: NSString) -> AnyObject? {
        return cache.object(forKey: key)
    }
    
}
