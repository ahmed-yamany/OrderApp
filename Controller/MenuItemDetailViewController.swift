//
//  MenuItemDetailViewController.swift
//  OrderApp
//
//  Created by Ahmed Yamany on 15/08/2022.
//

import UIKit

class MenuItemDetailViewController: UIViewController {
    // MARK: - IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var detailsLbl: UILabel!
    @IBOutlet weak var addToOrderBtn: UIButton!
    
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
        updateUI()
    }
    
    
    // MARK: IBActions
    
    @IBAction func addToOrderTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1,
               options: [], animations: {
                self.addToOrderBtn.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
                self.addToOrderBtn.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: nil)
        
        MenuController.shared.order.menuItems.append(menuItem)
    }
    
    // MARK: Helper Functions
    func updateUI(){
        nameLbl.text = menuItem.name
        priceLbl.text = menuItem.price.formatted(.currency(code: "egp"))
        detailsLbl.text = menuItem.detailText
    }
    

    
}
