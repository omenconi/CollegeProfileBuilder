//
//  DetailViewController.swift
//  collegeProfileBuilder
//
//  Created by omenconi on 2/9/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
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
        imagePicker.delegate = self

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
  
//allows user to select new image from camera roll or through the camera 
    
    let imagePicker = UIImagePickerController()
    
    @IBAction func cameraButtonTapped(_ sender: Any)
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        {
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            present (imagePicker, animated: true, completion: nil)
        }
            
        else
        {
            getPhotoLibrary()
        }

    }
    
    @IBAction func libraryButtonTapped(_ sender: Any)
    {
         getPhotoLibrary()
    }
    
    
    func getPhotoLibrary()
    {
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        imagePicker.dismiss(animated: true)
        {
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.collegeImage.image = selectedImage
        }
    }
}
