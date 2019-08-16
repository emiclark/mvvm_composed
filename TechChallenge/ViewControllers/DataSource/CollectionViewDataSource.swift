//
//  CollectionViewDataSource.swift
//  TechChallenge
//
//  Created by Emiko Clark on 8/16/19.
//  Copyright © 2019 Marcus. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewDataSource: UICollectionViewDataSource {

    let viewModel = TransactionViewModel(transactions: <#T##[Transaction]#>)

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }

}
