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

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension CollectionViewDataSource: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
