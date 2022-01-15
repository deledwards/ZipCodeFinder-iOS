//
//  NumericTextRule.swift
//  ZipCodeFinder
//
//  Created by Del Edwards on 1/15/22.
//

import Foundation
import SwiftValidator


//public class NumericTextRule: CharacterSetRule
public class NumericTextRule: Rule {
    /// NSCharacter that hold set of valid characters to hold
//    private let characterSet: CharacterSet
    /// String that holds error message
    private var message: String
    
    private var myIntRange: ClosedRange = 48...57
    private var myIntSet: Set<Int>?
    
    /**
     Initializes a `CharacterSetRule` object to verify that field has valid set of characters.
     
     - parameter characterSet: NSCharacterSet that holds group of valid characters.
     - parameter message: String of error message.
     - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public init( message: String = "Enter valid numbers") {
        //self.characterSet = CharacterSet.numericCharacterSet
        self.message = message
        self.myIntSet = Set(myIntRange)
    }
    
    /**
     Used to validate field.
     
     - parameter value: String to checked for validation.
     - returns: Boolean value. True if validation is successful; False if validation fails.
     */
    public func validate(_ value: String) -> Bool {
        for uni in value.unicodeScalars {
            if !(myIntSet?.contains(Int(uni.value)))!{
                return false
            }
        }
        return true
    }
    
    /**
     Displays error message when field fails validation.
     
     - returns: String of error message.
     */
    public func errorMessage() -> String {
        return message
    }
}




//{
//
//    /**
//     Initializes an `AlphaRule` object to verify that a field has valid set of alpha characters.
//
//     - parameter message: String of error message.
//     - returns: An initialized object, or nil if an object could not be created for some reason.
//     */
//    public init(message: String = "Enter valid alphabetic characters") {
//        super.init(characterSet: CharacterSet.numericCharacterSet, message: message)
//    }
//}
//
//extension CharacterSet {
//    static var numericCharacterSet: CharacterSet {
//        return CharacterSet(charactersIn: "0123456789").union(.alphanumerics)
//    }
//}
