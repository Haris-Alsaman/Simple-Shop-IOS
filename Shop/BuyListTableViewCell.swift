//
//  BuyListTableViewCell.swift
//  Shop
//
//  Created by haris on 3.03.2023.
//

import UIKit

class BuyListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lapName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func setupCell(name : String){
        lapName.text = name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
