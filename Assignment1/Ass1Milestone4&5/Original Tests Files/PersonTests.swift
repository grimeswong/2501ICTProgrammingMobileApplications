//
//  PersonTests.swift
//  PersonTests
//
//  Created by Rene Hexel on 2/03/2016.
//  Copyright © 2016 Rene Hexel. All rights reserved.
//

import UIKit
import XCTest
@testable import ContactList

class PersonTests: XCTestCase {
    
    let someYearOfBirth = 1984
    var someAge: Int {
        let todaysDate = NSDate()
        let calendar =  NSCalendar.currentCalendar()
        let currentYear = calendar.component(.Year, fromDate: todaysDate)
        return currentYear - someYearOfBirth
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: - Tests
    
    ///
    /// simple tests for year of birth
    ///
    func testYearOfBirth() {
        let person1 = Person(firstName: "Some", lastName: "Name")
        XCTAssertNil(person1.yearOfBirth)
        
        let person2 = Person(firstName: "Other", lastName: "Person", yearOfBirth: someYearOfBirth)
        XCTAssertNotNil(person2.yearOfBirth)
        XCTAssertEqual(person2.yearOfBirth!, someYearOfBirth)
    }
    
    ///
    /// make sure that age is (re)implemented as an Int!
    ///
    func testThatAgeIsAnImplicitlyUnwrappedOptional() {
        let person = Person(firstName: "Some", lastName: "Name")
        XCTAssertNil(person.age)
        let someAge = 20
        person.age = someAge
        XCTAssertNotNil(person.age)
        let age: Int = person.age
        XCTAssertEqual(age, someAge)
    }
    
    ///
    /// make sure that age is correctly calculated from a given year of birth
    ///
    func testThatAgeWillBeCalculatedFromYearOfBirth() {
        let yearOfBirth = 1980
        let person = Person(firstName: "Some", lastName: "Name", yearOfBirth: yearOfBirth)
        let currentYear = NSCalendar.currentCalendar().component(.Year, fromDate: NSDate())
        let expectedAge = currentYear - yearOfBirth
        XCTAssertEqual(person.age, expectedAge)
        // now change yob and make sure age changes as well
        person.yearOfBirth = yearOfBirth + 1
        XCTAssertEqual(person.age, expectedAge - 1)
    }
    
    ///
    /// make sure that year of birth is correctly calculated from a given age
    ///
    func testThatYearOfBirthIsCalculatedFromAge() {
        let age = 20
        let person = Person(firstName: "Some", lastName: "Name", age: 20)
        let currentYear = NSCalendar.currentCalendar().component(.Year, fromDate: NSDate())
        let expectedYearOfBirth = currentYear - age
        XCTAssertNotNil(person.yearOfBirth)
        XCTAssertEqual(person.yearOfBirth!, expectedYearOfBirth)
        // now change age and make sure yob changes as well
        person.age = age - 1
        XCTAssertNotNil(person.yearOfBirth)
        XCTAssertEqual(person.yearOfBirth!, expectedYearOfBirth + 1)
    }
    
    func testFirstName() {
        let firstNameToTest = "Peter"
        let person = Person(firstName: firstNameToTest, lastName: "SomeLastName", age: someAge)
        XCTAssertEqual(person.firstName, firstNameToTest)
    }
    
    func testLastName() {
        let lastNameToTest = "Jones"
        let person = Person(firstName: "SomeFirstName", lastName: lastNameToTest, age: someAge)
        XCTAssertEqual(person.lastName, lastNameToTest)
    }
    
    func testMiddleName() {
        let middleNameToTest = "Frances"
        let person = Person(firstName: "SomeFirstName", lastName: "SomeLastName", age: someAge, middleName: middleNameToTest)
        XCTAssertNotNil(person.middleName)
        XCTAssertEqual(person.middleName!, middleNameToTest)
    }
    
    func testAge() {
        let ageToTest = 20
        let person = Person(firstName: "SomeFirstName", lastName: "SomeLastName", age: ageToTest)
        XCTAssertEqual(person.age, ageToTest)
    }
    
    func testSettersAndGetters() {
        let firstNames = ["Anne", "Lin Wah", "David"]
        let lastNames = ["Billington", "Topor", "Nguyen"]
        let middleNames = ["Ellis", "William", "Mary"]
        let ages = [18, 20, 25, 79]
        
        let person = Person(firstName: "", lastName: "", age: someAge)
        
        for first in firstNames {
            person.firstName = first
            
            for last in lastNames {
                person.lastName = last
                
                for middle in middleNames {
                    person.middleName = middle
                    
                    for age in ages {
                        person.age = age
                        
                        XCTAssertEqual(person.firstName, first)
                        XCTAssertEqual(person.middleName!, middle)
                        XCTAssertEqual(person.lastName, last)
                        XCTAssertEqual(person.age, age)
                    }
                }
            }
        }
    }
    
    func testFullName() {
        let firstNameToTest = "Peter"
        let middleNameToTest = "Frances"
        let lastNameToTest = "Jones"
        let person = Person(firstName: firstNameToTest, lastName: lastNameToTest, age: 0, middleName: middleNameToTest)
        
        XCTAssertEqual(person.fullName(), "\(firstNameToTest) \(middleNameToTest) \(lastNameToTest)")
    }
    
    func testFullNameWithoutMiddleName() {
        let firstNameToTest = "Rene"
        let lastNameToTest = "Hexel"
        let person = Person(firstName: firstNameToTest, lastName: lastNameToTest, age: 0, middleName: nil)
        
        XCTAssertEqual(person.fullName(), "\(firstNameToTest) \(lastNameToTest)")
    }
    
}
