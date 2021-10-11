//
//  Duties.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on October 11, 2021

import Foundation
import SwiftyJSON
import RealmSwift

class Duties : Object{

    var duty = List<Duty>()
    @objc dynamic var id = 0
	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
    override class func primaryKey() -> String {
        return "id"
    }
    
    static func with(json: JSON) -> Duties {
        if json.isEmpty{
            return Duties()
        }
        let duties = Duties()
        if json["id"].exists() {
            duties.id = json["id"].intValue
        } else {
            duties.id = 0
        }
        let dutyArray = Duty.with(json: json)
        duties.duty = dutyArray
        return duties
    }
}
