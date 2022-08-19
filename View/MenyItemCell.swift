//
//  MenyItemCell.swift
//  OrderApp
//
//  Created by Ahmed Yamany on 19/08/2022.
//

import UIKit
 
class MenuItemCell: UITableViewCell {
    var itemName: String? = nil
    {
        didSet {
            if oldValue != itemName {
                setNeedsUpdateConfiguration()
            }
        }
    }
    var price: Double? = nil
    {
        didSet {
            if oldValue != price {
                setNeedsUpdateConfiguration()
            }
        }
    }
    var image: UIImage? = nil
    {
        didSet {
            if oldValue != image {
                setNeedsUpdateConfiguration()
            }
        }
    }
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        var content = defaultContentConfiguration().updated(for: state)
        content.text = itemName
        content.secondaryText = price?.formatted(.currency(code: "egp"))
        if let image = image {
            content.image = image
        }else{
            content.image = UIImage(systemName: "photo.on.rectangle")

        }
        
        contentConfiguration = content
    }
}
