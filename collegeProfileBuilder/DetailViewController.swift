//
//  DetailViewController.swift
//  collegeProfileBuilder
//
//  Created by omenconi on 2/9/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController
{

    var collegeInfo:CollegeClass!
    
    @IBOutlet weak var collegeName: UITextField!
    @IBOutlet weak var collegeNum: UITextField!
    @IBOutlet weak var collegeLoc: UITextField!
    @IBOutlet weak var collegeImage: UIImageView!
    @IBOutlet weak var collegeWebsite: UITextField!
    
    var urlString = URL(string: "")
    
    
    override func viewDidLoad()
    {
        collegeName.text = collegeInfo.name
        collegeNum.text = collegeInfo.numOfStudents
        collegeLoc.text = collegeInfo.location
        collegeImage.image = collegeInfo.image
        collegeWebsite.text = collegeInfo.website
        urlString = URL(string: collegeInfo.website)
        super.viewDidLoad()

    }

    @IBAction func saveButton(_ sender: Any)
    {
        collegeInfo.name = collegeName.text!
        collegeInfo.numOfStudents = collegeNum.text!
        collegeInfo.location = collegeLoc.text!
        collegeInfo.image = collegeImage.image 
    }
    
    @IBAction func openWebsite(_ sender: Any)
    {
         UIApplication.shared.openURL(urlString!)
    }
  

}
