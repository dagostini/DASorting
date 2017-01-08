//
//  DAMergeSort.swift
//  DASorting
//
//  Created by Dejan on 08/01/2017.
//  Copyright © 2017 Dejan. All rights reserved.
//

import Foundation

class DAMergeSort<T: Comparable> {
    
    public static func sort(_ items: [T]) -> [T] {
        var result = items
        var temp = result
        
        sort(original: &result, temp: &temp, low: 0, high: result.count - 1)
        
        return result
    }
    
    private static func sort(original: inout [T], temp: inout [T], low: Int, high: Int) {
        
        if high <= low { return }
        
        let mid = low + (high - low) / 2
        sort(original: &original, temp: &temp, low: low, high: mid)
        sort(original: &original, temp: &temp, low: mid + 1, high: high)
        merge(original: &original , temp: &temp, low: low, medium: mid, high: high)
    }
    
    private static func merge(original: inout [T], temp: inout [T], low: Int, medium: Int, high: Int) {
        var i = low
        var j = medium + 1
        
        for k in low...high {
            temp[k] = original[k]
        }
        
        for k in low...high {
            if i > medium {
                original[k] = temp[j]
                j += 1
            }
            else if j > high {
                original[k] = temp[i]
                i += 1
            }
            else if temp[j] < temp[i] {
                original[k] = temp[j]
                j += 1
            }
            else {
                original[k] = temp[i]
                i += 1
            }
        }
    }
}
