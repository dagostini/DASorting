//
//  DAShellSort.swift
//  DASorting
//
//  Created by Dejan on 08/01/2017.
//  Copyright © 2017 Dejan. All rights reserved.
//

import Foundation

class DAShellSort<T:Comparable> {
    
    public static func sort(_ items: [T]) -> [T] {
        var result = items
        
        let length = result.count
        var h = 1
        
        while h < length / 3 {
            h = 3 * h + 1
        }
        
        while h >= 1 {
            for i in h..<length {
                for j in stride(from: i, to: h - 1, by: -h) where result[j] < result[j - h] {
                    result.swapItems(itemAtIndex: j, withItemAtIndex: j - h)
                }
            }
            h /= 3
        }
        
        return result
    }
}
