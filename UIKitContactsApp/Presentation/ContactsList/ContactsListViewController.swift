//
//  ContactsListViewController.swift
//  UIKitContactsApp
//
//  Created by Vidhi Rana on 02/01/26.
//

import UIKit


final class ContactsListViewController: UIViewController {

    // MARK: - UI Components
    
    private let tableView = UITableView()
    
    // MARK: - Data
    
    private var contacts: [Contact] = []
    
    // MARK: - View Model
    // add the new property of View Model

    private let viewModel = ContactsListViewModel()


    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        // changed loadContact() to  viewModel.loadContacts()
        viewModel.loadContacts()
        tableView.reloadData()
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
        viewModel.numberOfContacts
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ContactCell.reuseIdentifier,
                for: indexPath
            ) as? ContactCell else {
                return UITableViewCell()
        }

        let CellViewModel = viewModel.cellViewModel(at: indexPath.row)
        cell.configure(with: CellViewModel)
        return cell
    }
    /* 📌 Notice:
     
     ViewController never touches Contact for UI

     Clean separation achieved */
}


// MARK: - UITableViewDelegate

extension ContactsListViewController: UITableViewDelegate {
   
    /* Navigation (STAYS SAME, BUT CLEANER)
     📌 ViewController handles navigation, not ViewModel
     (important UIKit convention).
     */

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {

        let contact = viewModel.contact(at: indexPath.row)
        let detailVC = ContactDetailViewController(contact: contact)
        navigationController?.pushViewController(detailVC, animated: true)
    }

}
