//
//  RecordTableViewCell.swift
//  PatientRecord
//
//  Created by Harvin Shibu on 21/11/22.
//

import UIKit

class RecordTableViewCell: UITableViewCell {

    @IBOutlet weak var nameTv: UILabel!
    @IBOutlet weak var idTv: UILabel!
    
    func setCellText(pModel: PatientModel){
        nameTv.text = pModel.name
        idTv.text = pModel.id
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
