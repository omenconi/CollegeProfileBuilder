//
//  ViewController.swift
//  collegeProfileBuilder
//
//  Created by omenconi on 2/8/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    @IBOutlet weak var myTableView: UITableView!
    
    var myCollegeObject:[CollegeClass] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myCollegeObject.append(CollegeClass(Name: "UIUC", NumOfStudents: "44,087", Location: "Urbana-Champaign, IL", Image: UIImage(named: "IL")!, Website: "http://illinois.edu/"))
        myCollegeObject.append(CollegeClass(Name: "IU", NumOfStudents: "48,514", Location: "Bloomington, Indiana", Image: UIImage(named: "Indiana")!, Website: "https://www.indiana.edu/"))
        myCollegeObject.append(CollegeClass(Name: "USC", NumOfStudents: "44,000", Location: "LA, California", Image: UIImage(named: "cali")!, Website: "http://www.usc.edu/"))
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Adds number of rows based on count of array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
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
        let alert = UIAlertController(title: "Add College", message: nil, preferredStyle: .alert)
        
        alert.addTextField
            {
            (collegeName) in collegeName.placeholder = "Add college name here" 
            }
    
        alert.addTextField
        {
            (collegeNum) in collegeNum.placeholder = "Add number of students here"
        }
        
        alert.addTextField
        {
                (collegeLoc) in collegeLoc.placeholder = "Add location of college here"
         }
        
        alert.addTextField
        {
                    (collegeWebsite) in collegeWebsite.placeholder = "Add website here"
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let add = UIAlertAction(title: "Add", style: .default)
            
        { (action) in self.myCollegeObject.append(CollegeClass(Name:(alert.textFields?[0].text)!,
            //NumOfStudents: (alert.textFields?[1].text)!, 
            Location: (alert.textFields?[1].text)!, Website: (alert.textFields?[2].text)!))
            
            self.myTableView.reloadData()
        }
        
        alert.addAction(add)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let detailView = segue.destination as! DetailViewController
        let selectedRow = myTableView.indexPathForSelectedRow?.row
        
        detailView.collegeInfo = myCollegeObject[selectedRow!] 
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        myTableView.reloadData()
    }
    
    
}
