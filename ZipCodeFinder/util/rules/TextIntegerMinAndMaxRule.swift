//
//  TextIntegerMinAndMaxRule.swift
//  ZipCodeFinder
//
//  Created by Del Edwards on 1/15/22.
//

import Foundation
import SwiftValidator

public class TextIntegerMinAndMaxRule: Rule {
    
    private var minVal: Int
    private var maxVal: Int
    private var allowableRange: ClosedRange<Int>
    
    init(min: Int, max: Int) {
        self.minVal = min
        self.maxVal = max
        
        self.allowableRange = minVal...maxVal
    }
    
    public func validate(_ value: String) -> Bool {
        guard let myIntVal = Int(value) else {
            return false
        }
        
        if self.allowableRange.contains(myIntVal) {
            return true
        }
        return false
    }
    
    public func errorMessage() -> String {
        return "Must be between \(self.minVal) and \(self.maxVal)"
    }
    
    
}
