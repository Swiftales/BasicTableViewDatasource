//
//  SimpleTableViewDatasource.swift
//  BasicTableViewDatasource
//
//  Created by Vishal Singh on 12/11/16.
//  Copyright © 2016 Vishal Singh. All rights reserved.
//

import UIKit


protocol TableViewCellDataRepresentable {
    
}

protocol Updatable: Equatable {
    mutating func update(fromCopy copy: Self)
}

protocol TableViewCellDecorator {
    associatedtype DataType: TableViewCellDataRepresentable
    associatedtype CellType: UITableViewCell
    static func update(tableViewCell cell: CellType, withData data: DataType)
}

class TableViewHandler<T: TableViewCellDecorator>: NSObject, UITableViewDataSource {
    
    fileprivate(set) var dataSet: [T.DataType]
    private(set) weak var tableView: UITableView!
    let reuseIdentifiers: (IndexPath) -> String
    
    init(withTableView tableView: UITableView, dataSet: [T.DataType], reuseIdentifiers: @escaping (IndexPath) -> String) {
        self.tableView = tableView
        self.dataSet = dataSet
        self.reuseIdentifiers = reuseIdentifiers
        super.init()
        self.tableView.dataSource = self
    }
    
    func reloadWithData(data: [T.DataType]) {
        dataSet = data
        tableView.reloadData()
    }
    
    func addData(data: [T.DataType], animated: Bool = true) {
        let startIndex = dataSet.count
        var indicesToAdd: [IndexPath] = []
        dataSet.append(contentsOf: data)
        if animated {
            for index in startIndex..<(data.count + startIndex) {
                indicesToAdd.append(IndexPath(row: index, section: 0))
            }
            tableView.beginUpdates()
            tableView.insertRows(at: indicesToAdd, with: .fade)
            tableView.endUpdates()
        } else {
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifiers(indexPath), for: indexPath) as? T.CellType else {
           return tableView.dequeueReusableCell(withIdentifier: reuseIdentifiers(indexPath), for: indexPath)
        }
        T.update(tableViewCell: cell, withData: dataSet[indexPath.row])
        return cell
    }
    
}


extension TableViewHandler where T.DataType: Equatable {
    
    func removeData(data: [T.DataType], animated: Bool = true) {
        var indicesToRemove: [IndexPath] = []
        for index in 0..<data.count {
            let indexToRemove = dataSet.index() { return $0 == data[index] }
            guard let _indexToRemove = indexToRemove else {
                continue
            }
            dataSet.remove(at: _indexToRemove)
            indicesToRemove.append(IndexPath(row: _indexToRemove, section: 0))
        }
        if animated {
            tableView.beginUpdates()
            tableView.deleteRows(at: indicesToRemove, with: .fade)
            tableView.endUpdates()
        } else {
            tableView.reloadData()
        }
    }
    
}

extension TableViewHandler where T.DataType: Updatable {
   
    func addData(data: [T.DataType], updateExisting: Bool, animated: Bool = true) {
        var indicesToAdd: [IndexPath] = []
        var indicesToUpdate: [IndexPath] = []
        for index in 0..<data.count {
            let startIndex = dataSet.count
            let indexToUpdate = dataSet.index() { return $0 == data[index] }
            if let _indexToUpdate = indexToUpdate {
                dataSet[_indexToUpdate].update(fromCopy: data[index])
                indicesToUpdate.append(IndexPath(row: _indexToUpdate, section: 0))
                continue
            } else {
                indicesToAdd.append(IndexPath(row: startIndex, section: 0))
                dataSet.append(data[index])
            }
        }
        if animated {
            tableView.beginUpdates()
            tableView.insertRows(at: indicesToAdd, with: .fade)
            tableView.reloadRows(at: indicesToUpdate, with: .fade)
            tableView.endUpdates()
        } else {
            tableView.reloadData()
        }
    }
}

