//
//  DASelectionSort.swift
//  DASorting
//
//  Created by Dejan on 08/01/2017.
//  Copyright © 2017 Dejan. All rights reserved.
//

import Foundation

class DASelectionSort<T: Comparable> {
    
    public static func sort(_ items: [T]) -> [T] {
        var result = items
        
        let length = result.count
        
        for i in 0..<length {
            var minIndex = i
            for j in i+1..<length {
                if result[j] < result[minIndex] {
                    minIndex = j
                }
            }
            result.swapItems(itemAtIndex: i, withItemAtIndex: minIndex)
        }
        
        return result
    }
}
