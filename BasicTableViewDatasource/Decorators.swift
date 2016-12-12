//
//  Decorators.swift
//  BasicTableViewDatasource
//
//  Created by Vishal Singh on 12/12/16.
//  Copyright © 2016 Vishal Singh. All rights reserved.
//

import UIKit


struct HorizontalDecorator: TableViewCellDecorator {
    
    static func update(tableViewCell cell: ThreeLabelTableViewCell, withData data: Person) {
        cell.stackView.layoutMargins = UIEdgeInsets(top: 0, left: cell.stackView.spacing, bottom: 0, right: cell.stackView.spacing)
        cell.stackView.isLayoutMarginsRelativeArrangement = true
        cell.toggle(VIPTheme: data.isVIP)
        cell.stackView.axis = .horizontal
        cell.firstLabel.text = data.firstName
        cell.secondLabel.text = data.lastName
        cell.thirdLabel.text = String(data.age)
    }
    
}

struct VerticalDecorator: TableViewCellDecorator {
    
    static func update(tableViewCell cell: ThreeLabelTableViewCell, withData data: Person) {
        cell.stackView.layoutMargins = UIEdgeInsets(top: cell.stackView.spacing, left: 0, bottom: cell.stackView.spacing, right: 0)
        cell.stackView.isLayoutMarginsRelativeArrangement = true
        cell.toggle(VIPTheme: data.isVIP)
        cell.stackView.axis = .vertical
        cell.firstLabel.text = data.firstName
        cell.secondLabel.text = data.lastName
        cell.thirdLabel.text = String(data.age)
    }
    
}

extension ThreeLabelTableViewCell {
    
    func toggle(VIPTheme isVIP: Bool) {
        firstLabel.textColor = isVIP ? UIColor.VIP : UIColor.commonMan
        secondLabel.textColor = isVIP ? UIColor.VIP : UIColor.commonMan
        thirdLabel.textColor = isVIP ? UIColor.VIP : UIColor.commonMan
        firstLabel.font = isVIP ? UIFont.VIP : UIFont.commonMan
        secondLabel.font = isVIP ? UIFont.VIP : UIFont.commonMan
        thirdLabel.font = isVIP ? UIFont.VIP : UIFont.commonMan
    }
    
}
