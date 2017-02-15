//
//  ViewController.swift
//  collegeProfileBuilder
//
//  Created by omenconi on 2/8/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var myCollegeObject:[CollegeClass] = []
    
    // var myMovies = ["Paul Blart: Mall Cop", "The Shawshank Redemption", "Step Brothers", "Ace Ventura: Pet Detective"]
    // var movieYears = ["2009","1994","2008","1994"]
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myCollegeObject.append(CollegeClass(Name: "UIUC", NumOfStudents: "44,087", Location: "Urbana-Champaign, IL", Image: UIImage(named: "IL")!))
       myCollegeObject.append(CollegeClass(Name: "IU", NumOfStudents: "48,514", Location: "Bloomington, Indiana", Image: UIImage(named: "Indiana")!))
         myCollegeObject.append(CollegeClass(Name: "USC", NumOfStudents: "44,000", Location: "LA, California", Image: UIImage(named: "cali")!))
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Adds number of rows based on count of array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCollegeObject.count
    }
    
    // Puts data from array in table view/cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = myCollegeObject[indexPath.row].name
        cell.detailTextLabel?.text = myCollegeObject[indexPath.row].numOfStudents
        return cell
    }
    
    // Allows to swipe left to remove, then removes item from array
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete)
        {
            myCollegeObject.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    // Adds new row with UIAlert, puts typed info into array
    @IBAction func addCell(_ sender: Any) {
        let alert = UIAlertController(title: "Add Movie", message: nil, preferredStyle: .alert)
        alert.addTextField {
            (movieTextField) in movieTextField.placeholder = "Add movie here"
        }
        alert.addTextField {
            (yearTextField) in yearTextField.placeholder = "Add movie here"
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let add = UIAlertAction(title: "Add", style: .default) { (action) in
            self.myCollegeObject.append(CollegeClass(Name:(alert.textFields?[0].text)!, Location: (alert.textFields?[1].text)!))
            self.myTableView.reloadData()
        }
        alert.addAction(add)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let detailView = segue.destination as! DetailViewController
        var selectedRow = myTableView.indexPathForSelectedRow?.row
        
        detailView.classDetail = myCollegeObject[selectedRow!]
    }
    
}








