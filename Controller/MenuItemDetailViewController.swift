//
//  MenuItemDetailViewController.swift
//  OrderApp
//
//  Created by Ahmed Yamany on 15/08/2022.
//

import UIKit

class MenuItemDetailViewController: UIViewController {
    // MARK: - Properties
    let menuItem: MenuItem
    
    
    init?(coder: NSCoder, menuItem: MenuItem) {
        self.menuItem = menuItem
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
}
