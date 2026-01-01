//
//  ContactsListViewController.swift
//  UIKitContactsApp
//
//  Created by Vidhi Rana on 02/01/26.
//

import UIKit

// 📌 INTERVIEW NOTE: Why final?
// `final` prevents inheritance. This improves compile-time performance (static dispatch)
// and clearly signals that this class is not designed to be subclassed.
final class ContactsListViewController: UIViewController {

    // MARK: - UI Components
    
    private let tableView = UITableView()
    
    // MARK: - Data
    
    private var contacts: [Contact] = []

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        loadContacts()
    }

    // MARK: - Setup
    
    private func setupUI() {
        title = "Contacts"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // Constraints to fill the screen
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Register the custom cell
        tableView.register(ContactCell.self, forCellReuseIdentifier: ContactCell.reuseIdentifier)
        
        // Assign Delegates
        tableView.dataSource = self
        tableView.delegate = self
        
        // Remove empty cell separators at the bottom
        tableView.tableFooterView = UIView()
    }
    
    private func loadContacts() {
        // 📌 INTERVIEW NOTE: Why hardcoded data is acceptable here.
        /*
         Using hardcoded sample data for UI development
         before connecting to any backend.
         This speeds up UI work and avoids dependence on network.
        */
        contacts = [
            Contact(name: "Alice Johnson", phoneNumber: "(555) 123-4567"),
            Contact(name: "Bob Smith", phoneNumber: "(555) 987-6543"),
            Contact(name: "Charlie Brown", phoneNumber: "(555) 555-5555"),
            Contact(name: "Diana Prince", phoneNumber: "(555) 111-2222"),
            Contact(name: "Evan Wright", phoneNumber: "(555) 333-4444"),
            Contact(name: "Fiona Gallagher", phoneNumber: "(555) 777-8888"),
            Contact(name: "George Martin", phoneNumber: "(555) 999-0000"),
            Contact(name: "Hannah Montana", phoneNumber: "(555) 234-5678"),
            Contact(name: "Ian Somerhalder", phoneNumber: "(555) 876-5432"),
            Contact(name: "Julia Roberts", phoneNumber: "(555) 432-1098")
        ]
        
        // Reload data on main thread (though not strictly necessary for hardcoded data, it's good habit)
        tableView.reloadData()
    }
}


// UITableViewDataSource supplies the data.
// UITableViewDelegate handles user interaction events.

// MARK: - UITableViewDataSource

// 📌 INTERVIEW NOTE (Q3): Difference between Delegate & DataSource?
// DataSource = "DATA". It answers: How many rows? What cell goes here? (Passive)
// Delegate = "ACTION/APPEARANCE". It handles: Did user tap row? How tall is the row? (Active)
extension ContactsListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 📌 INTERVIEW NOTE (Q1): Why UITableView reuses cells?
        /*
         Dequeuing cells reuses memory instead of creating new ones,
         improving performance drastically.
        */
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ContactCell.reuseIdentifier,
            for: indexPath
        ) as? ContactCell else {
            // 📌 INTERVIEW NOTE (Q2): What happens if reuseIdentifier is wrong?
            // If the ID is unregistered, the app crashes with NSInternalInconsistencyException.
            // If we fail to cast (as? ContactCell), we return a default cell to prevent a crash,
            // but the UI will look broken (blank row).
            return UITableViewCell()
        }

        let contact = contacts[indexPath.row]
        cell.configure(with: contact)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ContactsListViewController: UITableViewDelegate {
   
    /*
     Using initializer injection ensures required data
     is provided when the view controller is created.
    */

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Deselect the row for a nice animation effect
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedContact = contacts[indexPath.row]
        
        // Navigate to Detail Screen
        let detailVC = ContactDetailViewController(contact: selectedContact)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
