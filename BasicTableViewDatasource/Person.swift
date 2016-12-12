//
//  Person.swift
//  BasicTableViewDatasource
//
//  Created by Vishal Singh on 12/12/16.
//  Copyright © 2016 Vishal Singh. All rights reserved.
//

import Foundation

struct Person {
    let firstName: String
    let lastName: String
    var age: Int
    var isVIP: Bool
}

extension Person: TableViewCellDataRepresentable {
    
}

extension Person: Updatable {
    
    mutating func update(fromCopy copy: Person) {
        age = copy.age
        isVIP = copy.isVIP
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return (lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName)
    }
}
