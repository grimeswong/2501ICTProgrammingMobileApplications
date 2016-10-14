//
//  ContactListEntryTests.swift
//  ContactList
//
//  Created by Rene Hexel on 8/03/2016.
//  Copyright (c) 2016 Rene Hexel. All rights reserved.
//

import UIKit
import XCTest
@testable import ContactList

class ContactListEntryTests: XCTestCase {

    let someAddress = "N44_2.34"
    let somePhone = "x55041"
    let someYearOfBirth = 1994
    var someAge: Int {
        let currentYear = NSCalendar.currentCalendar().component(.Year, fromDate: NSDate())
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

    // MARK: - Tests new to ContactListEntry's

    ///
    /// test the address and phoneNumber properties
    ///
    func testAddress() {
        let entry1 = ContactListEntry(firstName: "Some", lastName: "Name")
        XCTAssertNil(entry1.address)

        let entry2 = ContactListEntry(firstName: "Other", lastName: "Entry", yearOfBirth: nil, middleName: nil, address: someAddress)
        XCTAssertNotNil(entry2.address)
        XCTAssertEqual(entry2.address!, someAddress)

        let expectedAddress = "Nathan"
        entry1.address = expectedAddress
        XCTAssertNotNil(entry1.address)
        XCTAssertEqual(entry1.address!, expectedAddress)
    }

    func testPhoneNumber() {
        let entry1 = ContactListEntry(firstName: "Some", lastName: "Name")
        XCTAssertNil(entry1.phoneNumber)

        let entry2 = ContactListEntry(firstName: "Other", lastName: "Entry", yearOfBirth: nil, middleName: nil, address: nil, phoneNumber: somePhone)
        XCTAssertNotNil(entry2.phoneNumber)
        XCTAssertEqual(entry2.phoneNumber!, somePhone)

        let expectedPhoneNumber = "(07) 3735 7111"
        entry1.address = expectedPhoneNumber
        XCTAssertNotNil(entry1.address)
        XCTAssertEqual(entry1.address!, expectedPhoneNumber)
    }
    
    // MARK: - Tests for Person
    ///
    /// All the tests below are from the Person class tests.
    /// They simply test that ContactListEntry objects behave
    /// exactly like ContactListEntry objects (i.e., their superclass)
    ///
    func testYearOfBirth() {
        let entry1 = ContactListEntry(firstName: "Some", lastName: "Name")
        XCTAssertNil(entry1.yearOfBirth)

        let entry2 = ContactListEntry(firstName: "Other", lastName: "Entry", yearOfBirth: someYearOfBirth)
        XCTAssertNotNil(entry2.yearOfBirth)
        XCTAssertEqual(entry2.yearOfBirth!, someYearOfBirth)
    }

    func testThatAgeIsAnImplicitlyUnwrappedOptional() {
        let person = ContactListEntry(firstName: "Some", lastName: "Name")
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
        let person = ContactListEntry(firstName: "Some", lastName: "Name", yearOfBirth: yearOfBirth)
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
        let person = ContactListEntry(firstName: "Some", lastName: "Name")
        let currentYear = NSCalendar.currentCalendar().component(.Year, fromDate: NSDate())
        let expectedYearOfBirth = currentYear - age
        XCTAssertNil(person.yearOfBirth)
        person.age = age
        XCTAssertNotNil(person.yearOfBirth)
        XCTAssertEqual(person.yearOfBirth!, expectedYearOfBirth)
        // now change age and make sure yob changes as well
        person.age = age - 1
        XCTAssertNotNil(person.yearOfBirth)
        XCTAssertEqual(person.yearOfBirth!, expectedYearOfBirth + 1)
    }

    func testFirstName() {
        let firstNameToTest = "Peter"
        let person = ContactListEntry(firstName: firstNameToTest, lastName: "SomeLastName")
        XCTAssertEqual(person.firstName, firstNameToTest)
    }

    func testLastName() {
        let lastNameToTest = "Jones"
        let person = ContactListEntry(firstName: "SomeFirstName", lastName: lastNameToTest)
        XCTAssertEqual(person.lastName, lastNameToTest)
    }

    func testMiddleName() {
        let middleNameToTest = "Frances"
        let person = ContactListEntry(firstName: "SomeFirstName", lastName: "SomeLastName", yearOfBirth: nil, middleName: middleNameToTest)
        XCTAssertNotNil(person.middleName)
        XCTAssertEqual(person.middleName!, middleNameToTest)
    }

    func testAge() {
        let ageToTest = 20
        let person = ContactListEntry(firstName: "SomeFirstName", lastName: "SomeLastName")
        person.age = ageToTest
        XCTAssertEqual(person.age, ageToTest)
    }

    func testSettersAndGetters() {
        let firstNames = ["Anne", "Lin Wah", "David"]
        let lastNames = ["Billington", "Topor", "Nguyen"]
        let middleNames = ["Ellis", "William", "Mary"]
        let ages = [18, 20, 25, 79]

        let person = ContactListEntry(firstName: "", lastName: "")

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
        let person = ContactListEntry(firstName: firstNameToTest, lastName: lastNameToTest, yearOfBirth: nil, middleName: middleNameToTest)

        XCTAssertEqual(person.fullName(), "\(firstNameToTest) \(middleNameToTest) \(lastNameToTest)")
    }

    func testFullNameWithoutMiddleName() {
        let firstNameToTest = "Rene"
        let lastNameToTest = "Hexel"
        let person = ContactListEntry(firstName: firstNameToTest, lastName: lastNameToTest)
        XCTAssertNil(person.middleName)
        XCTAssertEqual(person.fullName(), "\(firstNameToTest) \(lastNameToTest)")
    }

}
