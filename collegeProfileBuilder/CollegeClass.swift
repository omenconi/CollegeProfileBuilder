//
//  CollegeClass.swift
//  collegeProfileBuilder
//
//  Created by omenconi on 2/9/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class CollegeClass: NSObject
{
        
        var name = ""
        var numOfStudents = ""
        var location = ""
        var image = UIImage(named: "default")
        var website = ""
        
    init(Name:String, NumOfStudents:String, Location:String, Image:UIImage, Website:String)
        {
            name = Name
            numOfStudents = NumOfStudents
            location = Location
            image = Image
            website = Website
        }
    
    
    init(Name:String, Location:String, Website:String)
        {
           name = Name
           location = Location
           website = Website 
        }
}
