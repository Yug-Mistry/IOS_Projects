//
//  StudentModel.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 29/04/24.
//

import Foundation

// MARK: - StudentModel

class StudentModel: NSObject {
    
    // MARK: - Properties
    
    // Student's name
    @objc var name: String
    // Department of the student
    @objc var department: String
    // Student's ID
    @objc var studentId: String
    // Student's sports name
    @objc var sportsName: String
    // Student's date of birth
    @objc var dob: String
    // Student's gender
    @objc var gender: String
    // Grades for semester 1 to semester 6
    @objc var sem1Grade: String
    @objc var sem2Grade: String
    @objc var sem3Grade: String
    @objc var sem4Grade: String
    @objc var sem5Grade: String
    @objc var sem6Grade: String
    // Student's address
    @objc var address: String
    // Student's phone number
    @objc var phoneNumber: String
    // Student's email address
    @objc var email: String
    // Guardian's name
    @objc var guardianName: String
    // Guardian's phone number
    @objc var guardianPhoneNumber: String
    // Emergency contact number
    @objc var emergencyContact: String
    // Student's blood group
    @objc var bloodGroup: String
    
    // MARK: - Initialization
    
    init(fromDictionary dictionary: [String: Any]) {
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
