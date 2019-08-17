//
//  CollectionViewDataSource.swift
//  TechChallenge
//
//  Created by Emiko Clark on 8/16/19.
//  Copyright © 2019 Marcus. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewDataSource: UICollectionViewFlowLayout, UICollectionViewDataSource {

    let reuseIdentifier = "cellId"
    let viewModel = TransactionViewModel()


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.transactions.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCollectionViewCell
        let transaction = viewModel.transactions[indexPath.row]
        cell.configure(with: transaction)

        guard let urlString = transaction.logoUrl,
            let url = URL(string: urlString) else { return cell }
        cell.logoImageView.sd_setImage(with: url)

        // FIXME:- set recurring switch when tapped
        cell.recurringSwitch.addTarget(self, action: #selector(switchChanged(sender:)), for: .valueChanged)

        cell.configure(with: transaction)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    @objc private func switchChanged(sender: UISwitch) {
        switch sender.isOn {
        case true:
            viewModel.transactions[sender.tag].isRecurring = true
        case false:
            viewModel.transactions[sender.tag].isRecurring = false
        }
    }
}

extension CollectionViewDataSource: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
