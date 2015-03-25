//
//  Member.swift
//  CardTilt
//
//  Created by Ray Fix on 6/25/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import Foundation

class Member {
    let imageName:String?
    let name:String?
    let lastname:String?
    let birthPlace:String?
    let status_message:String?
    let profession:String?
    let telephone:String?
    let email:String?
    let password:String?
    let state:String?
    let avatar:String?
    let user_id:String?
    let address:String?
    let accepted:String?
    let category:String?
    let gender:String?
    let city:String?
    let country:String?
    let mobilephone:String?
    let workplace:String?
    let followed_by:String?
    let lastTimeRegistered:String?

    
    init(dictionary:NSDictionary) {
        name = dictionary["name"]    as? String
        lastname = dictionary["lastname"]    as? String
        status_message = dictionary["status_message"]    as? String
        city = dictionary["city"]    as? String
        profession = dictionary["profession"]    as? String
        avatar = dictionary["avatar"]    as? String
        followed_by = dictionary["followed_by"]    as? String
        state = dictionary["state"]    as? String
        accepted = dictionary["accepted"]    as? String
        birthPlace = dictionary["birthPlace"]    as? String
        telephone = dictionary["telephone"]    as? String
        user_id = dictionary["user_id"]    as? String
        address = dictionary["address"]    as? String
        category = dictionary["category"]    as? String
        gender = dictionary["gender"]    as? String
        country = dictionary["country"]    as? String
        mobilephone = dictionary["mobilephone"]    as? String
        workplace = dictionary["workplace"]    as? String
        lastTimeRegistered = dictionary["lastTimeRegistered"]    as? String
        // fixup the about text to add newlines
//        var unescapedAbout = dictionary["about"] as String
//        about = unescapedAbout.stringByReplacingOccurrencesOfString("\\n", withString:"\n", options:nil, range:nil)        
    }
    
    class func loadMembersFromFile(path:String) -> [Member]
    {
        var members:[Member] = []
        
        var error:NSError? = nil
        if let data = NSData(contentsOfFile: path, options:nil, error:&error) {
            if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error:&error) as? NSDictionary {
                if let team = json["contacts"] as? NSArray {
                    for obj:AnyObject in team {
                        let memberDictionary = obj as NSDictionary
                        let member = Member(dictionary: memberDictionary)
                        members.append(member)
                    }
                }
            }
        }
        return members
    }
}
