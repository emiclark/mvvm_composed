//
//  CustomCollectionViewCell.swift
//  TechChallenge
//
//  Created by Emiko Clark on 8/16/19.
//  Copyright © 2019 Marcus. All rights reserved.
//

import UIKit
import SnapKit

final class CustomCollectionViewCell: UICollectionViewCell {
    //MARK:- Properties
    private let offset = 10
    private let fontsize: CGFloat = 15
    private var isRecurring: Bool = false
    private let imageHeight = 20

    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var accountNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: fontsize)
        return label
    }()

    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: fontsize)
        return label
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .boldSystemFont(ofSize: fontsize)
        return label
    }()

    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: fontsize)
        return label
    }()

    private lazy var separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()

    private lazy var nonRecurringLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: fontsize)
        return label
    }()

    var recurringSwitch: UISwitch = {
        let `switch` = UISwitch()
        `switch`.transform = CGAffineTransform(scaleX: 0.60, y: 0.60)
        return `switch`
    }()

    private lazy var isRecurringLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: fontsize)
        return label
    }()

    private lazy var recurringStackview: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [nonRecurringLabel, recurringSwitch, isRecurringLabel])
        stackview.axis = .horizontal
        stackview.distribution = .fill
        return stackview
    }()

    private lazy var centerStackview: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [nameLabel, categoryLabel, accountNameLabel, recurringStackview])
        stackview.axis = .vertical
        stackview.distribution = .fillEqually
        return stackview
    }()

    //MARK:- initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        // add views
        contentView.addSubview(logoImageView)
        contentView.addSubview(centerStackview)
        contentView.addSubview(amountLabel)
        contentView.addSubview(separator)

        // add constraints
        logoImageView.snp.makeConstraints { make in
            make.left.top.equalTo(contentView).offset(offset)
            make.height.width.equalTo(imageHeight)
        }

        centerStackview.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(offset)
            make.left.equalTo(logoImageView.snp.right).offset(offset).multipliedBy(1.75)
            make.right.equalTo(amountLabel.snp.left)
            make.bottom.equalTo(contentView).offset(-offset - 3)
        }

        amountLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(offset)
            make.right.equalToSuperview().offset(-offset)
            make.width.equalTo(60)
        }

        separator.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }

    func configure(with transaction: Transaction) {
        amountLabel.attributedText = transaction.amount.toCurrencyFormat(isSameBaseline: false)
        categoryLabel.text = transaction.category.capitalized
        nameLabel.text = transaction.name
        accountNameLabel.text = transaction.accountName
        nonRecurringLabel.text = "Non-Recurring"
        isRecurringLabel.text = "Recurring"
        isRecurring = transaction.isRecurring
        setSwitchIdentifier(for: transaction.id)
        configureCellWithSwitch(switchValue: transaction.isRecurring)
    }

    //MARK:- Helper functions
    private func setSwitchIdentifier(for id: String) {
        guard let id = Int(id) else { return }
        switch id {
        case 0:
            recurringSwitch.tag = 0
        default:
            recurringSwitch.tag = id - 1
        }
    }

    private func configureCellWithSwitch(switchValue:Bool) {
        isRecurring ? recurringSwitch.setOn(true, animated: true)
            : recurringSwitch.setOn(false, animated: true)
    }
}
