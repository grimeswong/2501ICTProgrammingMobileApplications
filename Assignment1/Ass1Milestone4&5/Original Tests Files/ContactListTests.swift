//
//  ContactListTests.swift
//  ContactListTests
//
//  Created by Rene Hexel on 8/03/2016.
//  Copyright © 2016 Rene Hexel. All rights reserved.
//

import XCTest
@testable import ContactList

class ContactListTests: XCTestCase {

   

    // MARK: - Tests

    ///
    /// test that initially, the contact list is empty
    ///
    func testEmptyContactList() {
        let list = ContactList()
        XCTAssertEqual(list.entries.count, 0)
    }

    ///
    /// test that entries can be added
    ///
    func testAddingContactListEntries() {
        let list = ContactList()
        let entry = ContactListEntry(firstName: "First", lastName: "Entry")
        list.entries.append(entry)
        XCTAssertEqual(list.entries.count, 1)
        XCTAssertTrue(list.entries[0] === entry)
    }


    ///
    /// test that entries can be inserted
    ///
    func testInsertingContactListEntries() {
        let list = ContactList()
        let entry1 = ContactListEntry(firstName: "First", lastName: "Entry")
        list.entries.append(entry1)
        XCTAssertEqual(list.entries.count, 1)
        XCTAssertTrue(list.entries[0] === entry1)

        let entry2 = ContactListEntry(firstName: "Second", lastName: "Entry")
        list.entries.insert(entry2, atIndex: 0)
        XCTAssertEqual(list.entries.count, 2)
        XCTAssertTrue(list.entries[0] === entry2)
        XCTAssertTrue(list.entries[1] === entry1)

        let entry3 = ContactListEntry(firstName: "Third", lastName: "Entry")
        list.entries.insert(entry3, atIndex: 1)
        XCTAssertEqual(list.entries.count, 3)
        XCTAssertTrue(list.entries[0] === entry2)
        XCTAssertTrue(list.entries[1] === entry3)
        XCTAssertTrue(list.entries[2] === entry1)
    }



    ///
    /// test that entries can be removed
    ///
    func testRemovingContactListEntries() {
        let list = ContactList()
        let entry1 = ContactListEntry(firstName: "First", lastName: "Entry")
        list.entries.append(entry1)
        XCTAssertEqual(list.entries.count, 1)
        XCTAssertTrue(list.entries[0] === entry1)

        let entry2 = ContactListEntry(firstName: "Second", lastName: "Entry")
        list.entries.insert(entry2, atIndex: 0)
        XCTAssertEqual(list.entries.count, 2)
        XCTAssertTrue(list.entries[0] === entry2)
        XCTAssertTrue(list.entries[1] === entry1)

        let entry3 = ContactListEntry(firstName: "Third", lastName: "Entry")
        list.entries.insert(entry3, atIndex: 1)
        XCTAssertEqual(list.entries.count, 3)
        XCTAssertTrue(list.entries[0] === entry2)
        XCTAssertTrue(list.entries[1] === entry3)
        XCTAssertTrue(list.entries[2] === entry1)

        let removedEntry2 = list.entries.removeAtIndex(0)
        XCTAssertTrue(removedEntry2 === entry2)
        XCTAssertEqual(list.entries.count, 2)
        XCTAssertTrue(list.entries[0] === entry3)
        XCTAssertTrue(list.entries[1] === entry1)

        let removedEntry1 = list.entries.removeAtIndex(1)
        XCTAssertTrue(removedEntry1 === entry1)
        XCTAssertEqual(list.entries.count, 1)
        XCTAssertTrue(list.entries[0] === entry3)

        let removedEntry3 = list.entries.removeAtIndex(0)
        XCTAssertTrue(removedEntry3 === entry3)
        XCTAssertEqual(list.entries.count, 0)
    }
    
}
