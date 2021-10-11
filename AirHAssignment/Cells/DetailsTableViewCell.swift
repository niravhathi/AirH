//
//  DetailsTableViewCell.swift
//  AirHAssignment
//
//  Created by Nirav Hathi on 10/11/21.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var labelDetails: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    let keys: [String] = ["flightnr","date","aircraftType","tail","departure","destination","timeDepart", "timeArrive","dutyID","dutyCode","captain","firstOfficer","flightAttendant"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func bind(duty : Duty?, index: Int) {
        var valueString = "N/A"

        switch index {
        case 0:
            valueString = duty?.value(forKey: keys[0]) as! String == "" ? "N/A" : duty?.value(forKey: keys[0]) as! String
        case 1:
            valueString = duty?.value(forKey: keys[1]) as! String == "" ? "N/A" : duty?.value(forKey: keys[1]) as! String
        case 2:
            valueString = duty?.value(forKey: keys[2]) as! String == "" ? "N/A" : duty?.value(forKey: keys[2]) as! String
        case 3:
            valueString = duty?.value(forKey: keys[3]) as! String == "" ? "N/A" : duty?.value(forKey: keys[3]) as! String
        case 4:
            valueString = duty?.value(forKey: keys[4]) as! String == "" ? "N/A" : duty?.value(forKey: keys[4]) as! String
        case 5:
            valueString = duty?.value(forKey: keys[5]) as! String == "" ? "N/A" : duty?.value(forKey: keys[5]) as! String
        case 6:
            valueString = duty?.value(forKey: keys[6]) as! String == "" ? "N/A" : duty?.value(forKey: keys[6]) as! String
        case 7:
            valueString = duty?.value(forKey: keys[7]) as! String == "" ? "N/A" : duty?.value(forKey: keys[7]) as! String
        case 8:
            valueString = duty?.value(forKey: keys[8]) as! String == "" ? "N/A" : duty?.value(forKey: keys[8]) as! String
        case 9:
            valueString = duty?.value(forKey: keys[9]) as! String == "" ? "N/A" : duty?.value(forKey: keys[9]) as! String
        case 10:
            valueString = duty?.value(forKey: keys[10]) as! String == "" ? "N/A" : duty?.value(forKey: keys[10]) as! String
        case 11:
            valueString = duty?.value(forKey: keys[11]) as! String == "" ? "N/A" : duty?.value(forKey: keys[11]) as! String
        case 12:
            valueString = duty?.value(forKey: keys[12]) as! String == "" ? "N/A" : duty?.value(forKey: keys[12]) as! String
        default:
            valueString = "N/A"
        }
        self.labelTitle.text = keys[index].firstUppercased
        self.labelDetails.text = valueString
    }
    
    
}
extension StringProtocol {
    var firstUppercased: String { return prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { return prefix(1).capitalized + dropFirst() }
}
