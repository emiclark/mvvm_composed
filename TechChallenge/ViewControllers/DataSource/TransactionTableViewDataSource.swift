//
//  TransactionTableViewDataSource.swift
//  TechChallenge
//
//  Created by Emiko Clark on 8/18/19.
//  Copyright © 2019 Marcus. All rights reserved.
//

import UIKit
import SDWebImage

final class TransactionTableViewDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {

    var viewModel: TransactionViewModel?
    var navigationController: UINavigationController?
    var reuseidentifier: String {
        return "cellId"
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0}
        return viewModel.transactionsCount
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: reuseidentifier, for: indexPath) as! CustomTableViewCell

        // switch state changed
        cell.recurringSwitch.addTarget(self, action: #selector(switchChanged(sender:)), for: .valueChanged)

        // load image
        guard let viewModel = viewModel else { return cell}
        let transaction = viewModel.transactions[indexPath.row]

        if let logoUrlString = transaction.logoUrl {
            cell.logoImageView.sd_setImage(with: URL(string: logoUrlString), placeholderImage: UIImage(named: "placeholder.png"))
        }
        cell.configure(with: transaction)

        // if isRecurring = true, then draw single line cell, and force redraw cell
        if transaction.isRecurring {
            viewModel.indexPath = indexPath
            viewModel.cellNeedsUpdate = true
        }
        return cell
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let transaction = viewModel?.transactions[indexPath.row],
            let viewModel = viewModel else { return }
        viewModel.indexPath = indexPath
        let vc = DetailViewController(transaction: transaction)
        vc.viewModel = viewModel
        navigationController?.pushViewController(vc, animated: true)
    }

    // MARK:- Helper functions

    //FIXME:- redraw single cell if recurring switch is switched on the detailVC

    @objc private func switchChanged(sender: UISwitch) {
        switch sender.isOn {
        case true:
            viewModel?.transactions[sender.tag].isRecurring = true
            viewModel?.cellNeedsUpdate = true
        case false:
            viewModel?.transactions[sender.tag].isRecurring = false
        }
    }
}
