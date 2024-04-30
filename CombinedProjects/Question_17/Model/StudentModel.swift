//
//  StudentModel.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 29/04/24.
//

import Foundation

class StudentModel:NSObject{
    @objc var name:String
    @objc var department:String
    @objc var studentId:String
    @objc var sportsName:String
    @objc var dob:String
    @objc var gender:String
    @objc var sem1Grade: String
    @objc var sem2Grade: String
    @objc var sem3Grade: String
    @objc var sem4Grade: String
    @objc var sem5Grade: String
    @objc var sem6Grade: String
    @objc var address: String
    @objc var phoneNumber: String
    @objc var email: String
    @objc var guardianName: String
    @objc var guardianPhoneNumber: String
    @objc var emergencyContact: String
    @objc var bloodGroup: String
    
    init(fromDictionary dictionary: [String: Any]){
        self.name = dictionary["name"] as? String ?? ""
        self.department = dictionary["department"] as? String ?? ""
        self.studentId = dictionary["studentId"] as? String ?? ""
        self.sportsName = dictionary["sportsName"] as? String ?? ""
        self.dob = dictionary["dob"] as? String ?? ""
        self.gender = dictionary["gender"] as? String ?? ""
        self.sem1Grade = dictionary["sem1Grade"] as? String ?? ""
        self.sem2Grade = dictionary["sem2Grade"] as? String ?? ""
        self.sem3Grade = dictionary["sem3Grade"] as? String ?? ""
        self.sem4Grade = dictionary["sem4Grade"] as? String ?? ""
        self.sem5Grade = dictionary["sem5Grade"] as? String ?? ""
        self.sem6Grade = dictionary["sem6Grade"] as? String ?? ""
        self.address = dictionary["address"] as? String ?? ""
        self.phoneNumber = dictionary["phoneNumber"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.guardianName = dictionary["guardianName"] as? String ?? ""
        self.guardianPhoneNumber = dictionary["guardianPhoneNumber"] as? String ?? ""
        self.emergencyContact = dictionary["emergencyContact"] as? String ?? ""
        self.bloodGroup = dictionary["bloodGroup"] as? String ?? ""
    }
}
