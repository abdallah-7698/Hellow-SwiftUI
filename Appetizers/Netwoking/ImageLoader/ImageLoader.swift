//
//  ImageLoader.swift
//  Appetizers
//
//  Created by Abdallah on 08/04/2025.
//

import SwiftUI

public class ImageLoader<T>: ObservableObject {
    @Published public var data: T?
    
    public init() {}
    
    public func load(from stringURL: String, transformer: @escaping (Data) -> T?) {
        
        guard let url = URL(string: stringURL) else { return }
        
        if let cachedData = ImageCache.shared.object(forKey: url.absoluteString as NSString) as? T {
            self.data = cachedData
            return
        }
        
        Task {
            do {
                let (fetchedData, _) = try await URLSession.shared.data(from: url)
                
                if let transformedData = transformer(fetchedData) {
                    await MainActor.run {
                        self.data = transformedData
                    }
                    
                    ImageCache.shared.setObject((transformedData as AnyObject) as! UIImage, forKey: url.absoluteString as NSString)
                }
            } catch {  return }
        }
        
    }
    
}
