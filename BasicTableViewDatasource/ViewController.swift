//
//  ViewController.swift
//  BasicTableViewDatasource
//
//  Created by Vishal Singh on 12/11/16.
//  Copyright © 2016 Vishal Singh. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var persons = [vishal, john, peter, clark, bruce]

    private lazy var tableViewDatasource: TableViewHandler<HorizontalDecorator> = {
        let tableHander = TableViewHandler<HorizontalDecorator>(withTableView: self.tableView, dataSet: self.persons, reuseIdentifiers: { _ in return "CellID" })
        return tableHander
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Persons"
        setUpTableView()
    }
    
    private func setUpTableView() {
        tableView.register(UINib.init(nibName: "ThreeLabelTableViewCell", bundle: nil), forCellReuseIdentifier: "CellID")
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.dataSource = tableViewDatasource
    }
    
    @IBAction func addClicked(_ sender: Any) {
        tableViewDatasource.addData(data: [vishalVIP, tony, bruce, harry, natasha], updateExisting: true)
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        tableViewDatasource.removeData(data: [vishal, tony, harry, natasha])
    }
}

