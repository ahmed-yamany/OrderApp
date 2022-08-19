//
//  OrderConfirmationViewController.swift
//  OrderApp
//
//  Created by Ahmed Yamany on 17/08/2022.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
    
    @IBOutlet weak var orderconfirmationLabel: UILabel!
    
        let minutesToPrepare: Int
        init?(coder: NSCoder, minutesToPrepare: Int) {
            self.minutesToPrepare = minutesToPrepare
            super.init(coder: coder)
        }
    
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        orderconfirmationLabel.text = "Thank you for your order! Your wait time is approximately \(minutesToPrepare) minutes."

        // Do any additional setup after loading the view.
    }
    

    @IBAction func dismissToOrderBtn(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    
}
