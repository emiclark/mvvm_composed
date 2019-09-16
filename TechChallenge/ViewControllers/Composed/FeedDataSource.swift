//
//  FeedDataSource.swift
//  TechChallenge
//
//  Created by Emiko Clark on 9/14/19.
//  Copyright © 2019 Marcus. All rights reserved.
//

import UIKit
import Xcore

class FeedDataSource: XCCollectionViewDataSource {
    let feedViewModel = FeedViewModel()

    var isTileEnabled = true
    var isShadowEnabled = true

    lazy var sectionCount = 1

    override init(collectionView: UICollectionView) {
        super.init(collectionView: collectionView)
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
//        return feedViewModel.transactions.count
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath.with(globalSection)) as CustomCollectionViewCell

        let transaction = feedViewModel.transactions[0]
        cell.configure(with: transaction)
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, headerAttributesForSectionAt section: Int) -> (enabled: Bool, size: CGSize?) {
        return (true, nil)
    }

    override func collectionView(_ collectionView: UICollectionView, footerAttributesForSectionAt section: Int) -> (enabled: Bool, size: CGSize?) {
        return (false, nil)
    }
}
