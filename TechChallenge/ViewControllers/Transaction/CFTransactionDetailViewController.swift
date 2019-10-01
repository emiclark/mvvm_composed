//
//  CFTransactionDetailViewController.swift
//  TechChallenge
//
//  Created by Emiko Clark on 9/30/19.
//  Copyright © 2019 Marcus. All rights reserved.
//

import UIKit
import Xcore
import SnapKit

class CFTransactionDetailViewController:  UIViewController {
    private var transaction: Transaction
    private var fontSize = UIFont.systemFont(ofSize: 15)

    init(transaction: Transaction) {
        self.transaction = transaction
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let nameLabel = UILabel().apply {
        $0.textColor = .darkGray
    }

    private let accountNameLabel = UILabel().apply {
        $0.textColor = .lightGray
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = transaction.name
        setup()
    }

    private func setup() {
        view.addSubview(nameLabel)
        view.addSubview(accountNameLabel)

        nameLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        accountNameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.centerX.equalTo(nameLabel)
        }

        configure()
    }

    private func configure() {
        accountNameLabel.text = transaction.accountName
        nameLabel.text = transaction.name
    }
}
