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
    
    public mutating func swapItems(itemAtIndex firstIndex: Index, withItemAtIndex secondIndex: Index) {
        
        if firstIndex != secondIndex {
            swap(&self[firstIndex], &self[secondIndex])
        }
    }
    
    public mutating func shuffle() {
        
        for i in 0..<count {
            self.swapItems(itemAtIndex: i, withItemAtIndex: Array.Index(arc4random_uniform(UInt32(count))))
        }
    }
}
