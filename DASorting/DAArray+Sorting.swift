//
//  DAArray+Sorting.swift
//  DASorting
//
//  Created by Dejan on 08/01/2017.
//  Copyright © 2017 Dejan. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    
    public func selectionSorted() -> [Element] {
        return DASelectionSort.sort(self)
    }
    
    public func insertionSorted() -> [Element] {
        return DAInsertionSort.sort(self)
    }
    
    public func shellSorted() -> [Element] {
        return DAShellSort.sort(self)
    }
    
    public func mergeSorted() -> [Element] {
        return DAMergeSort.sort(self)
    }
    
    public func quickSorted() -> [Element] {
        return DAQuickSort.sort(self)
    }
}

extension Array {
    
    public mutating func swap(itemAtIndex firstIndex: Index, withItemAtIndex secondIndex: Index) {
        
        let temp = self[firstIndex]
        self[firstIndex] = self[secondIndex]
        self[secondIndex] = temp
    }
    
    public mutating func shuffle() {
        
        for i in 0..<count {
            self.swap(itemAtIndex: i, withItemAtIndex: Array.Index(arc4random_uniform(UInt32(count))))
        }
    }
}
