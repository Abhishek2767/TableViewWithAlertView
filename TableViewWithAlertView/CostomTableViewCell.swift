//
//  CostomTableViewCell.swift
//  TableViewWithAlertView
//
//  Created by SST Mac Mini on 01/08/22.
//

import UIKit

class CostomTableViewCell: UITableViewCell {
    
    

    @IBOutlet weak var firstNameLable: UILabel!
    @IBOutlet weak var lastNameLable: UILabel!
    @IBOutlet weak var emailLable: UILabel!
    @IBOutlet weak var passwordLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        firstNameLable.text = "Abhi"
        lastNameLable.text = "Patel"
        emailLable.text = "apk2767@gmial.com"
        passwordLable.text = "abhi1234"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
