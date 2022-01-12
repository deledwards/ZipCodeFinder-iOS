//
//    ZipCode.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import SwiftyJSON


class ZipCode : NSObject, NSCoding{

    var city : String!
    var distance : Float!
    var state : String!
    var zipCode : String!


    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        city = json["city"].stringValue
        distance = json["distance"].floatValue
        state = json["state"].stringValue
        zipCode = json["zip_code"].stringValue
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if city != nil{
            dictionary["city"] = city
        }
        if distance != nil{
            dictionary["distance"] = distance
        }
        if state != nil{
            dictionary["state"] = state
        }
        if zipCode != nil{
            dictionary["zip_code"] = zipCode
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         city = aDecoder.decodeObject(forKey: "city") as? String
         distance = aDecoder.decodeObject(forKey: "distance") as? Float
         state = aDecoder.decodeObject(forKey: "state") as? String
         zipCode = aDecoder.decodeObject(forKey: "zip_code") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if city != nil{
            aCoder.encode(city, forKey: "city")
        }
        if distance != nil{
            aCoder.encode(distance, forKey: "distance")
        }
        if state != nil{
            aCoder.encode(state, forKey: "state")
        }
        if zipCode != nil{
            aCoder.encode(zipCode, forKey: "zip_code")
        }

    }

}
