//
//  Project.swift
//  contaktme
//
//  Created by Riyad Anabtawi on 2/28/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

import Foundation

@objc public class Project {
    let name:String?
    let postedDate:String?
    let projectDetails:String?
    let projectImage:String?
    let status:String?
    let currentApplicants:String?
    
    init(dictionary:NSDictionary) {
        name = dictionary["name"]    as? String
       postedDate = dictionary["date_created"]    as? String
        projectDetails = dictionary["details"]    as? String
        projectImage = dictionary["image"]    as? String
        status = dictionary["status"]    as? String
        currentApplicants = dictionary["applicants"]    as? String
        // fixup the about text to add newlines
        //        var unescapedAbout = dictionary["about"] as String
        //        about = unescapedAbout.stringByReplacingOccurrencesOfString("\\n", withString:"\n", options:nil, range:nil)
    }
    
 func loadMembersFromFile(path:String) -> [Project]
    {
        var members:[Project] = []
        let path = NSBundle.mainBundle().pathForResource("Projects", ofType: "json")
        var error:NSError? = nil
        if let data = NSData(contentsOfFile: path!, options:nil, error:&error) {
            if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error:&error) as? NSDictionary {
                if let team = json["projects"] as? NSArray {
                    for obj:AnyObject in team {
                        let memberDictionary = obj as NSDictionary
                        let member = Project(dictionary: memberDictionary)
                        members.append(member)
                    }
                }
            }
        }
        return members
    }
}
