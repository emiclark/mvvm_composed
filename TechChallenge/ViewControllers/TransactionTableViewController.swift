//
//  TransactionTableViewController.swift
//  TechChallenge
//
//  Created by Zeeshan Mian on 4/24/18.
//  Copyright © 2018 Marcus. All rights reserved.
//

import UIKit
import SnapKit

final class TransactionTableViewController: UIViewController {

    private let datasource = TransactionTableViewDataSource()
    private let reuseIdentifier = "cellId"
    private let viewModel = TransactionViewModel()

    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.isScrollEnabled = true
        tv.alwaysBounceVertical = true
        tv.showsVerticalScrollIndicator = true
        tv.register(CustomTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tv.backgroundColor = .white
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = datasource
        tableView.delegate = datasource
        view.backgroundColor = .white
        navigationItem.title = "All Transactions"
        datasource.navigationController = navigationController
        setupViews()
    }

    private func setupViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
