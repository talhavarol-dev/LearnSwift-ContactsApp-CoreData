//
//  KisiTableViewCell.swift
//  KisilerApp
//
//  Created by Talha Varol on 28.03.2022.
//

import UIKit

class KisiTableViewCell: UITableViewCell {

    @IBOutlet weak var kisiLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
