
 📱 UIKitContactsApp (Phase 2.2)

Welcome to the third lab in my iOS Swift Revision Series. This repository focuses on mastering UITableView with a senior engineering mindset—prioritizing performance, memory efficiency, and clean architecture.

 🎯 The Mission

The goal of this project is to demonstrate mastery over the most used component in iOS: the `UITableView`. Instead of using Storyboards, this app is built 100% programmatically to ensure full control over the view lifecycle and data flow.



 🏗️ Technical Architecture

 📂 Project Structure

```
UIKitContactsApp/
│
├── App/                 App & Scene Delegates (Storyboardfree setup)
├── Models/              Contact.swift (Immutable Value Types)
├── Presentation/     
│   ├── ContactsList/    ContactsListViewController & ContactCell
│   └── ContactDetail/   Detail View with Initializer Injection
└── Resources/           Assets and Constants
```



 🚀 Phase 2.2 Task List & Deliverables

 ✅ Task 1: The Model (Value Power)

  * Implemented `Contact` as a `struct` to ensure thread safety and immutability.
  * *Senior Insight:* Value types prevent unintended side effects when passing data between screens.

 ✅ Task 2: Custom Cell (Performance)

  * Created `ContactCell` entirely in code.
  * Implemented `static let reuseIdentifier` to prevent stringtyping errors.
  * Zero Logic Rule: The cell only maps data; it does not process it.

 ✅ Task 3: The List Controller (The Data Source)

  * Implemented `UITableViewDataSource`.
  * 
  * Demonstrated understanding of the Cell Reuse Mechanism to keep memory footprint low during highspeed scrolling.

 ✅ Task 4: Navigation & Initializer Injection

  * No Property Injection: Data is passed via `init(contact:)`.
  * Ensures the `ContactDetailViewController` is never in an invalid state (it always has a contact to display).



 🎤 Interview Knowledge Base

This repo contains documented answers to critical seniorlevel questions within the source code comments:

1.  Cell Recycling: Why we reuse views instead of creating new ones.
2.  Delegate vs. Datasource: Separation of user interaction and data delivery.
3.  Initializer Injection: Why it is the gold standard for testable code.
4.  Static Reuse Identifiers: Preventing runtime crashes from misspelled strings.



 🧼 Engineering Standards

  * Final Classes: Optimized for Static Dispatch.
  * Access Control: All UI elements are `private` to maintain strict encapsulation.
  * Safety First: Zero force unwraps (`!`). All dequeuing and unwrapping uses `guard let`.



 🤝 Follow the Journey

This project is part of my daily iOS Swift Revision Series on LinkedIn.

  * Author: Vidhi Rana 
  * Current Phase: 2.2 (UIKit Fundamentals)



*Built with ❤️ and UIKit.*


