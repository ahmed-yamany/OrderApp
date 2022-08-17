//
//  CategoryTableViewController.swift
//  OrderApp
//
//  Created by Ahmed Yamany on 15/08/2022.
//

import UIKit
typealias Category = String

@MainActor
class CategoryTableViewController: UITableViewController {
    // MARK: - Properties
    var categories: [Category] = []
    
    
    // MARK: - Views
    override func viewDidLoad() {
        super.viewDidLoad()

        Task{
            do{
                let categories = try await MenuController.shared.featchCategoris()
                updateUI(with: categories)
                
            }catch{
                displayError(error, title: "Faild to Featch Categories")
            }
        }
    }
    
    // MARK: IBActions
    
    @IBSegueAction func showMenu(_ coder: NSCoder, sender: UITableViewCell?) -> MenuTableViewController? {
        guard let cell = sender, let indexPath = tableView.indexPath(for: cell) else{return nil}
        
        let category = categories[indexPath.row]
        
        return MenuTableViewController(coder: coder, category: category)
    }
    
    // MARK: Helper Functions
    func updateUI(with categories: [Category]){
        self.categories = categories
        self.tableView.reloadData()
    }
    func displayError(_ error: Error, title: String){
        guard let _ = viewIfLoaded?.window else{return}
        
        let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
        present(alert, animated: true)
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoriesCell", for: indexPath)

        // Configure the cell...
        configureCell(cell, forCategoryAt: indexPath)

        return cell
    }
    
    func configureCell(_ cell: UITableViewCell, forCategoryAt indexPath: IndexPath){
        let categorie = categories[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = categorie.capitalized
        cell.contentConfiguration = content
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
