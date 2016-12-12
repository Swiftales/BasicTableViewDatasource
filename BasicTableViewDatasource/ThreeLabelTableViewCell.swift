//
//  ThreeLabelTableViewCell.swift
//  BasicTableViewDatasource
//
//  Created by Vishal Singh on 12/11/16.
//  Copyright © 2016 Vishal Singh. All rights reserved.
//

import UIKit

class ThreeLabelTableViewCell: UITableViewCell {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
