//
//  DAQuickSort.swift
//  DASorting
//
//  Created by Dejan on 08/01/2017.
//  Copyright © 2017 Dejan. All rights reserved.
//

import Foundation

class DAQuickSort<T: Comparable> {
    
    public static func sort(_ items: [T]) -> [T] {
        var result = items
        result.shuffle()
        
        sort(original: &result, low: 0, high: result.count - 1)
        
        return result
    }
    
    private static func sort(original: inout [T], low: Int, high: Int) {
        
        if high <= low { return }
        
        let j = partition(original: &original , low: low, high: high)
        sort(original: &original, low: low, high: j - 1)
        sort(original: &original, low: j + 1, high: high)
    }
    
    private static func partition(original: inout [T], low: Int, high: Int) -> Int {
        var i = low
        var j = high + 1
        let v = original[low]
        
        while true {
            i += 1
            while original[i] < v {
                i += 1
                if i == high {
                    break
                }
            }
            
            j -= 1
            while v < original[j] {
                j -= 1
                if j == low {
                    break
                }
            }
            
            if i >= j {
                break
            }
            
            original.swapItems(itemAtIndex: i, withItemAtIndex: j)
        }
        
        original.swapItems(itemAtIndex: low, withItemAtIndex: j)
        
        return j
    }
}
