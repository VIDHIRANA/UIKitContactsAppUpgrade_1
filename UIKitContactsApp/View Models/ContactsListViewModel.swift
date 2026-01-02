//
//  ContactsListViewModel.swift
//  UIKitContactsApp
//
//  Created by Vidhi Rana on 02/01/26.
//

import Foundation

/*
 📌 MVVM - ContactsListViewModel
 ViewModel owns data and business logic.
 ViewController only asks for what it needs.
*/

final class ContactsListViewModel {

    // MARK: - Properties
    
    // Using private(set) allows the VC to read but not modify the data directly
    private(set) var contacts: [Contact] = []

    // Helper for TableView DataSource
    var numberOfContacts: Int {
        contacts.count
    }

    // MARK: - Actions
    
    func loadContacts() {
        // In Phase 2.6, this will be a network call.
        // For now, it simulates fetching data.
        contacts = [
            Contact(name: "Alice Johnson", phoneNumber: "(555) 123-4567"),
            Contact(name: "Bob Smith", phoneNumber: "(555) 987-6543"),
            Contact(name: "Charlie Brown", phoneNumber: "(555) 555-5555"),
            Contact(name: "Diana Prince", phoneNumber: "(555) 111-2222"),
            Contact(name: "Evan Wright", phoneNumber: "(555) 333-4444"),
            Contact(name: "Fiona Gallagher", phoneNumber: "(555) 777-8888"),
            Contact(name: "George Martin", phoneNumber: "(555) 999-0000")
        ]
    }

    // Factory method to create Cell ViewModels
    func cellViewModel(at index: Int) -> ContactCellViewModel {
        ContactCellViewModel(contact: contacts[index])
    }

    // Helper for navigation to detail screen
    func contact(at index: Int) -> Contact {
        contacts[index]
    }
    
    // MARK: - 🎤 INTERVIEW QUESTIONS (MVVM)
    
    /*
     1️⃣ Why ViewModel should not import UIKit?
     Answer: To keep business logic UI-agnostic and testable. If you can run the ViewModel
     in a unit test without loading a simulator/window, your architecture is decoupled.
     
     2️⃣ Why ViewController should not format data?
     Answer: Formatting (e.g., date conversion, currency) belongs to ViewModel to keep
     ViewControllers lightweight and maintainable (Avoiding "Massive View Controller").
     
     3️⃣ Who owns the data in MVVM?
     Answer: ViewModel owns the data and exposes it safely to the View/ViewController.
     
     4️⃣ Why is MVVM better for testing?
     Answer: ViewModels can be tested by asserting outputs based on inputs without
     needing to mock the UI rendering or UIKit lifecycle.
    */
}
