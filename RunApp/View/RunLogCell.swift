//
//  RunLogCell.swift
//  RunApp
//
//  Created by Can Haskan on 26.11.2025.
//

import UIKit

class RunLogCell: UITableViewCell {

    
    @IBOutlet weak var runDurationLbl: UILabel!
    @IBOutlet weak var totalDistanceLbl: UILabel!
    @IBOutlet weak var averageSpeedLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configre(run: Run) {
        runDurationLbl.text = run.duration.formatTimeDurationToString()
        totalDistanceLbl.text = "\(run.distance.roundedNumber(to: 2)) km"
        averageSpeedLbl.text = run.speed.formatTimeDurationToString()
        dateLbl.text = run.date.getDateString()
    }


}
