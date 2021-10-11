//
//  Duty.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on October 11, 2021

import Foundation
import SwiftyJSON
import RealmSwift

class Duty : Object{

    @objc dynamic var aircraftType : String!
    @objc dynamic var captain : String!
    @objc dynamic var date : String!
    @objc dynamic var departure : String!
    @objc dynamic var destination : String!
    @objc dynamic var dutyCode : String!
    @objc dynamic var dutyID : String!
    @objc dynamic var firstOfficer : String!
    @objc dynamic var flightAttendant : String!
    @objc dynamic var flightnr : String!
    @objc dynamic var tail : String!
    @objc dynamic var timeArrive : String!
    @objc dynamic var timeDepart : String!
    //var data: NSData?

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
//	init(fromJson json: JSON!){
//		if json.isEmpty{
//			return
//		}
//        aircraftType = json["Aircraft Type"].stringValue
//        captain = json["Captain"].stringValue
//        date = json["Date"].stringValue
//        departure = json["Departure"].stringValue
//        destination = json["Destination"].stringValue
//        dutyCode = json["DutyCode"].stringValue
//        dutyID = json["DutyID"].stringValue
//        firstOfficer = json["First Officer"].stringValue
//        flightAttendant = json["Flight Attendant"].stringValue
//        flightnr = json["Flightnr"].stringValue
//        tail = json["Tail"].stringValue
//        timeArrive = json["Time_Arrive"].stringValue
//        timeDepart = json["Time_Depart"].stringValue
//	}

    static func with(json: JSON) -> List<Duty> {
        let duties = List<Duty>()
        for obj in json.arrayValue {
            let duty =  Duty()
            if obj["Aircraft Type"].exists() {
                duty.aircraftType = obj["Aircraft Type"].string ?? ""
            }
            if obj["Captain"].exists() {
                duty.captain = obj["Captain"].string ?? ""
            }
            if obj["Date"].exists() {
                duty.date = obj["Date"].string ?? ""
            }
            if obj["Departure"].exists() {
                duty.departure = obj["Departure"].string ?? ""
            }
            if obj["Destination"].exists() {
                duty.destination = obj["Destination"].string ?? ""
            }
            if obj["DutyCode"].exists() {
                duty.dutyCode = obj["DutyCode"].string ?? ""
            }
            if obj["DutyID"].exists() {
                duty.dutyID = obj["DutyID"].string ?? ""
            }
            if obj["First Officer"].exists() {
                duty.firstOfficer = obj["First Officer"].string ?? ""
            }
            if obj["Flight Attendant"].exists() {
                duty.flightAttendant = obj["Flight Attendant"].string ?? ""
            }
            if obj["Flightnr"].exists() {
                duty.flightnr = obj["Flightnr"].string ?? ""
            }
            if obj["Tail"].exists() {
                duty.tail = obj["Tail"].string ?? ""
            }
            if obj["Time_Arrive"].exists() {
                duty.timeArrive = obj["Time_Arrive"].string ?? ""
            }
            if obj["Time_Depart"].exists() {
                duty.timeDepart = obj["Time_Depart"].string ?? ""
            }
            duties.append(duty)
            
        }
        return duties
    }

}
