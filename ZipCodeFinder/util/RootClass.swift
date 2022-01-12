//
//    RootClass.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import SwiftyJSON


class RootClass : NSObject, NSCoding{

    var zipCodes : [ZipCode]!


    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        zipCodes = [ZipCode]()
        let zipCodesArray = json["zip_codes"].arrayValue
        for zipCodesJson in zipCodesArray{
            let value = ZipCode(fromJson: zipCodesJson)
            zipCodes.append(value)
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if zipCodes != nil{
            var dictionaryElements = [[String:Any]]()
            for zipCodesElement in zipCodes {
                dictionaryElements.append(zipCodesElement.toDictionary())
            }
            dictionary["zip_codes"] = dictionaryElements
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         zipCodes = aDecoder.decodeObject(forKey: "zip_codes") as? [ZipCode]

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if zipCodes != nil{
            aCoder.encode(zipCodes, forKey: "zip_codes")
        }

    }

}
