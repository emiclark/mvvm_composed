//
//  TransactionTableViewDataSource.swift
//  TechChallenge
//
//  Created by Emiko Clark on 8/18/19.
//  Copyright © 2019 Marcus. All rights reserved.
//

import UIKit
import SDWebImage

class TransactionTableViewDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {

    let viewModel = TransactionViewModel()
    var navigationController: UINavigationController?
    var reuseidentifier: String {
        return "cellId"
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.transactionsCount
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseidentifier, for: indexPath) as! CustomTableViewCell
        let transaction = viewModel.transactions[indexPath.row]

        cell.recurringSwitch.addTarget(self, action: #selector(switchChanged(sender:)), for: .valueChanged)
        if let logoUrlString = transaction.logoUrl {
            cell.logoImageView.sd_setImage(with: URL(string: logoUrlString), placeholderImage: UIImage(named: "placeholder.png"))
        }
        cell.configure(with: transaction)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController(transaction: viewModel.transactions[indexPath.row])
        navigationController?.pushViewController(detailViewController, animated: true)
    }

//    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
//        return false
//    }

    // MARK:- Helper functions
    @objc private func switchChanged(sender: UISwitch) {
        switch sender.isOn {
        case true:
            viewModel.transactions[sender.tag].isRecurring = true
        case false:
            viewModel.transactions[sender.tag].isRecurring = false
        }
    }
}
