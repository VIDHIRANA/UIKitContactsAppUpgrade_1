//
//  ContactCellViewModel.swift
//  UIKitContactsApp
//
//  Created by Vidhi Rana on 02/01/26.
//
import Foundation

/*
 📌 MVVM - ContactCellViewModel
 ViewModel prepares data for display.
 The cell does not know about the raw model, only what it needs to render.
*/

struct ContactCellViewModel {

    private let contact: Contact

    init(contact: Contact) {
        self.contact = contact
    }

    // Formatting logic lives here instead of the Cell or ViewController
    var displayName: String {
        contact.name
    }

    var displayPhoneNumber: String {
        contact.phoneNumber
    }
}
