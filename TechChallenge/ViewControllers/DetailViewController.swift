//
//  DetailViewController.swift
//  TechChallenge
//
//  Created by Emiko Clark on 8/18/19.
//  Copyright © 2019 Marcus. All rights reserved.

import UIKit
import SnapKit
import SDWebImage

final class DetailViewController: UIViewController {
    var indexPath: IndexPath = [0,0]
//    var cellNeedsUpdate: Bool = false

    //MARK:- Properties
    var viewModel: TransactionViewModel?
    private let transaction: Transaction
    private var font = UIFont.systemFont(ofSize: 15)
    private var offset = 30

    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = font
        return label
    }()

    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = font
        return label
    }()

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = font
        return label
    }()

    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var stackview: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [dateLabel, amountLabel, categoryLabel])
        stackview.axis = .vertical
        stackview.distribution = .fill
        stackview.spacing = 17
        return stackview
    }()

    // recurring
    private lazy var nonRecurringLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = font
        label.text = "Non-Recurring"
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
        label.font = font
        label.text = "Recurring"
        return label
    }()

    private lazy var recurringStackview: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [nonRecurringLabel, recurringSwitch, isRecurringLabel])
        stackview.axis = .horizontal
        stackview.distribution = .fill
        return stackview
    }()

    // Initializer
    init(transaction: Transaction) {
        self.transaction = transaction
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK:- Load view
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .white
        view.backgroundColor = .white
        recurringSwitch.addTarget(self, action: #selector(switchChanged(sender:)), for: .valueChanged)
        setupViews(for: transaction)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationItem.title = transaction.name
    }

    // MARK:- Setup views
    private func setupViews(for transaction: Transaction) {
        // add views
        view.addSubview(logoImageView)
        view.addSubview(stackview)

        if transaction.isRecurring == false {
            stackview.addArrangedSubview(recurringStackview)
        }

        // add constraints
        logoImageView.snp.makeConstraints { make in
            make.left.top.equalTo(view).offset(offset).multipliedBy(2.0)
            make.size.equalTo(100)
        }

        if let logoUrlString = transaction.logoUrl {
            logoImageView.sd_setImage(with: URL(string: logoUrlString), placeholderImage: UIImage(named: "placeholder.png"))
        }

        stackview.snp.makeConstraints { make in
            make.left.equalTo(logoImageView.snp.right).offset(offset)
            make.right.equalToSuperview()
            make.top.equalTo(logoImageView)
        }

        // set values
        categoryLabel.text = transaction.category.capitalized
        amountLabel.attributedText = transaction.amount.toCurrencyFormat()
        dateLabel.text = transaction.date.toDateFormat()
    }

    @objc private func switchChanged(sender: UISwitch) {
        guard let viewModel = viewModel else { return }

        if viewModel.transactions[viewModel.indexPath.row].isRecurring == true {
            viewModel.transactions[viewModel.indexPath.row].isRecurring = false
        } else {
            viewModel.transactions[viewModel.indexPath.row].isRecurring = true
        }

        viewModel.cellNeedsUpdate = true
        print(viewModel.indexPath,  viewModel.transactions[viewModel.indexPath.row].isRecurring as Any)
    }
}

