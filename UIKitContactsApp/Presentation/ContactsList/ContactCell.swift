//
//  ContactCell.swift
//  UIKitContactsApp
//
//  Created by Vidhi Rana on 02/01/26.
//
import UIKit

final class ContactCell: UITableViewCell {

    // 📌 INTERVIEW NOTE: Why static reuseIdentifier?
    /*
     Using static reuseIdentifier prevents typos
     and ensures consistent reuse registration & dequeuing.
    */
    static let reuseIdentifier = "ContactCell"

    // MARK: - UI Components
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 📌 INTERVIEW NOTE (Q4): Why not store indexPath inside the cell?
    // Cells are REUSED. A cell at row 0 might scroll off-screen and be reused for row 10.
    // If we stored `var indexPath: IndexPath` inside the cell, it would become stale/wrong
    // as soon as the user scrolls, leading to data bugs (e.g., deleting the wrong row).
    // Always let the TableView tell you the index path, never the cell.

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configuration
    
    /// Configures the cell with data.
    /// Logic is strictly limited to mapping data to UI elements.
    /*
     Cell depends on ViewModel instead of Model
     to avoid UI logic leaking into the view layer.
    */
    /*func configure(with contact: Contact) {
        nameLabel.text = contact.name
        phoneLabel.text = contact.phoneNumber
    }
    */
    func configure(with viewModel: ContactCellViewModel) {
        nameLabel.text = viewModel.displayName
        phoneLabel.text = viewModel.displayPhoneNumber
    }

    
    
    
    // MARK: - UI Setup
    
    private func setupUI() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(phoneLabel)
        
        // Standard Auto Layout Constraints
        // In a real app, we might use a UIStackView here for simpler code,
        // but explicit constraints demonstrate understanding of the layout engine.
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            phoneLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            phoneLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            phoneLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
}
