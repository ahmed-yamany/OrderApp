//
//  Order.swift
//  OrderApp
//
//  Created by Ahmed Yamany on 15/08/2022.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
 
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
