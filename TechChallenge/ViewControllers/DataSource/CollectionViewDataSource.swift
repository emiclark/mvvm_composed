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
        return cell
    }

}

extension CollectionViewDataSource: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let transaction = viewModel.transactions[indexPath.row]

    }

}
