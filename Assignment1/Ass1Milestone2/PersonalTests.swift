//
//  PersonalTests.swift
//  PersonalTests
//
//  Created by Rene Hexel on 3/03/2016.
//  Copyright © 2016 Rene Hexel. All rights reserved.
//

import XCTest
@testable import Personal

class PersonalTests: XCTestCase {

    let someYearOfBirth = 1984
    var someAge: Int {
        let currentYear = NSCalendar.currentCalendar().component(NSCalendarUnit.Year, fromDate: NSDate())
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
