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
        
        init(Name:String, NumOfStudents:String, Location:String, Image:UIImage)
        {
            name = Name
            numOfStudents = NumOfStudents
            location = Location
            image = Image
        }
        
        init(Name:String, Location:String)
        {
            name = Name
            location = Location
        }
}
