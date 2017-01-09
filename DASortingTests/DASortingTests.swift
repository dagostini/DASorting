//
//  DASortingTests.swift
//  DASortingTests
//
//  Created by Dejan on 08/01/2017.
//  Copyright © 2017 Dejan. All rights reserved.
//

import XCTest
@testable import DASorting

class DASortingTests: XCTestCase {
    
    func testSelectionSort_IntArray() {
        let originalArray = [4, 1, 2, 6, 9, 10, 7, 8, 5, 3]
        let sortedArray = originalArray.selectionSorted()
        
        XCTAssertEqual(originalArray.sorted(), sortedArray)
    }
    
    func testInsertionSort_IntArray() {
        let originalArray = [4, 1, 2, 6, 9, 10, 7, 8, 5, 3]
        let sortedArray = originalArray.insertionSortedSwaps()
        
        XCTAssertEqual(originalArray.sorted(), sortedArray)
    }
    
    func testInsertionSortWithShifting_IntArray() {
        let originalArray = [4, 1, 2, 6, 9, 10, 7, 8, 5, 3]
        let sortedArray = originalArray.insertionSortedShifts()
        
        XCTAssertEqual(originalArray.sorted(), sortedArray)
    }
    
    func testShellSort_IntArray() {
        let originalArray = [4, 1, 2, 6, 9, 10, 7, 8, 5, 3]
        let sortedArray = originalArray.shellSorted()
        
        XCTAssertEqual(originalArray.sorted(), sortedArray)
    }
    
    func testMergeSort_IntArray() {
        let originalArray = [4, 1, 2, 6, 9, 10, 7, 8, 5, 3]
        let sortedArray = originalArray.mergeSorted()
        
        XCTAssertEqual(originalArray.sorted(), sortedArray)
    }
    
    func testQuickSort_IntArray() {
        let originalArray = [4, 1, 2, 6, 9, 10, 7, 8, 5, 3]
        let sortedArray = originalArray.quickSorted()
        
        XCTAssertEqual(originalArray.sorted(), sortedArray)
    }
    
    func testPerformance() {
        runTestWithMaxItems(maxItems: 1_000)
        runTestWithMaxItems(maxItems: 5_000)
        runTestWithMaxItems(maxItems: 10_000)
        runTestWithMaxItems(maxItems: 100_000)
    }
    
    private func runTestWithMaxItems(maxItems: Int) {
        
        print("Running sort performance tests for \(maxItems) items")
        
        // Selection Sort
        var originalArray = randomIntArray(maxElements: maxItems)
        var stopwatch = Stopwatch()
        _ = originalArray.selectionSorted()
        print("=============================================")
        print("Selection Sort")
        stopwatch.printElapsedTime()
        
        // Insertion Sort
        originalArray = randomIntArray(maxElements: maxItems)
        stopwatch = Stopwatch()
        _ = originalArray.insertionSortedShifts()
        print("=============================================")
        print("Insertion Sort")
        stopwatch.printElapsedTime()
        
        // Shell Sort
        originalArray = randomIntArray(maxElements: maxItems)
        stopwatch = Stopwatch()
        _ = originalArray.shellSorted()
        print("=============================================")
        print("Shell Sort")
        stopwatch.printElapsedTime()
        
        // Merge Sort
        originalArray = randomIntArray(maxElements: maxItems)
        stopwatch = Stopwatch()
        _ = originalArray.mergeSorted()
        print("=============================================")
        print("Merge Sort")
        stopwatch.printElapsedTime()
        
        // Quick Sort
        originalArray = randomIntArray(maxElements: maxItems)
        stopwatch = Stopwatch()
        _ = originalArray.quickSorted()
        print("=============================================")
        print("Quick Sort")
        stopwatch.printElapsedTime()
        
        // Native Array Sort
        originalArray = randomIntArray(maxElements: maxItems)
        stopwatch = Stopwatch()
        _ = originalArray.sorted()
        print("=============================================")
        print("Native Sort")
        stopwatch.printElapsedTime()
    }
    
    private func randomIntArray(maxElements: Int) -> [Int] {
        
        var result: [Int] = []
        
        for i in 0..<maxElements {
            result.append(i)
        }
        result.shuffle()
        
        return result
    }
}

private class Stopwatch {
    private var date = Date()
    var elapsedTime: TimeInterval {
        return NSDate().timeIntervalSince(date)
    }
    
    func printElapsedTime() {
        print("Elapsed Time (seconds): ", elapsedTime)
    }
}
