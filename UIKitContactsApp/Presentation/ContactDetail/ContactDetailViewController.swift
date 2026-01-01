//
//  ContactDetailViewController.swift
//  UIKitContactsApp
//
//  Created by Vidhi Rana on 02/01/26.
//
import UIKit

final class ContactDetailViewController: UIViewController {

    // MARK: - Properties
    
    private let contact: Contact

    // MARK: - UI Components
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializer
    
    // 📌 INTERVIEW NOTE (Q5): Why use initializer injection?
    // 1. Safety: It guarantees the controller CANNOT exist without the data it needs.
    // 2. Immutability: We can make `contact` a `let` constant.
    // 3. Testing: It makes unit testing easier as we don't need to trigger side-effects to set data.
    init(contact: Contact) {
        self.contact = contact
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureData()
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Details"
        
        view.addSubview(nameLabel)
        view.addSubview(phoneLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            
            phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            phoneLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func configureData() {
        nameLabel.text = contact.name
        phoneLabel.text = contact.phoneNumber
    }
}
