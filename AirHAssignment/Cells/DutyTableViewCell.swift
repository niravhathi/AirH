//
//  DutyTableViewCell.swift
//  AirHAssignment
//
//  Created by Nirav Hathi on 10/11/21.
//

import UIKit
import FontAwesome_swift
enum Icon {
    case FLIGHT
    case OFF
    case POSITIONING
    case Standby
    case LAYOVER

    var image: UIImage {
        switch self {
        case .FLIGHT, .POSITIONING, .OFF: return UIImage.fontAwesomeIcon(name: .plane, style: .solid, textColor: .black, size: CGSize(width: 32, height: 32))
        case .Standby: return UIImage.fontAwesomeIcon(name: .stickyNote, style: .solid, textColor: .black, size: CGSize(width: 32, height: 32))
        case .LAYOVER: return UIImage.fontAwesomeIcon(name: .suitcase, style: .solid, textColor: .black, size: CGSize(width: 32, height: 32))
        }
    }
}
class DutyTableViewCell: UITableViewCell {

    @IBOutlet weak var labelMatchCrew: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelDutyCode: UILabel!
    @IBOutlet weak var imageDuty: UIImageView!
    @IBOutlet weak var labelLocation: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bind(duty : Duty?) {
        self.selectionStyle = .none
        labelTime.text = (duty?.timeDepart ?? "") + " - " + (duty?.timeArrive ?? "")
        labelLocation.text = (duty?.departure ?? "") + " - " + (duty?.destination ?? "")
        imageDuty.image = duty?.dutyCode == "FLIGHT" ? Icon.FLIGHT.image : Icon.Standby.image
        labelDutyCode.text = duty?.dutyCode
        labelMatchCrew.text =  duty?.flightAttendant
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
