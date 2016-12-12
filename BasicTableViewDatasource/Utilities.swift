//
//  Utilities.swift
//  BasicTableViewDatasource
//
//  Created by Vishal Singh on 12/12/16.
//  Copyright © 2016 Vishal Singh. All rights reserved.
//

import UIKit


extension UIColor {
    static let VIP = UIColor.init(colorLiteralRed: 255/255, green: 215/255, blue: 0, alpha: 1)
    static let commonMan = UIColor.black
}

extension UIFont {
    static let VIP = UIFont.boldSystemFont(ofSize: 17)
    static let commonMan = UIFont.systemFont(ofSize: 17)
}


let vishal = Person(firstName: "Vishal Singh", lastName: "Panwar", age: 28, isVIP: false)
let vishalVIP = Person(firstName: "Vishal Singh", lastName: "Panwar", age: 28, isVIP: true)
let bruce = Person(firstName: "Bruce", lastName: "Wayne", age: 35, isVIP: true)
let john = Person(firstName: "John", lastName: "Cena", age: 30, isVIP: true)
let tony = Person(firstName: "Tony", lastName: "Stark", age: 35, isVIP: true)
let peter = Person(firstName: "Peter", lastName: "Parker", age: 20, isVIP: true)
let clark = Person(firstName: "Clark", lastName: "Kent", age: 120, isVIP: false)
let harry = Person(firstName: "Harry", lastName: "Porter", age: 18, isVIP: false)
let natasha = Person(firstName: "Natasha", lastName: "Romanova", age: 30, isVIP: true)
