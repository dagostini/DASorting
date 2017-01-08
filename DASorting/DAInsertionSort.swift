//
//  DAInsertionSort.swift
//  DASorting
//
//  Created by Dejan on 08/01/2017.
//  Copyright © 2017 Dejan. All rights reserved.
//

import Foundation

class DAInsertionSort<T: Comparable> {
    
    public static func sort(_ items: [T]) -> [T] {
        var result = items
        
        let length = result.count
        
        for i in 1..<length {
            for j in stride(from: i, to: 0, by: -1) where result[j] < result[j - 1] {
                result.swap(itemAtIndex: j, withItemAtIndex: j - 1)
            }
        }
        
        return result
    }
}
