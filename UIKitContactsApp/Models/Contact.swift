//
//  Contact.swift
//  UIKitContactsApp
//
//  Created by Vidhi Rana on 02/01/26.
//

import Foundation

// MARK: - Contact Model

/// Represents a single contact in the application.
///
/// 📌 INTERVIEW NOTE: Why a struct?
/*
 Using a struct here because:
 - Value types are safer
 - They don’t share mutable state
 - Thread safe
*/
struct Contact {
    let name: String
    let phoneNumber: String
}
