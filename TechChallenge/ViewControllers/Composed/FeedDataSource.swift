//
//  FeedDataSource.swift
//  TechChallenge
//
//  Created by Emiko Clark on 9/14/19.
//  Copyright © 2019 Marcus. All rights reserved.
//

import Xcore
import SDWebImage

class FeedDataSource: XCCollectionViewDataSource {
    let feedViewModel = FeedViewModel()
    var isTileEnabled = true
    var isShadowEnabled = true

    lazy var sectionCount = 1

    override init(collectionView: UICollectionView) {
        super.init(collectionView: collectionView)
        globalSection = 0
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedViewModel.transactions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath.with(globalSection)) as CustomCollectionViewCell

        let transaction = feedViewModel.transactions[indexPath.row]
        cell.configure(with: transaction)

        guard let urlString = transaction.logoUrl,
            let url = URL(string: urlString) else { return cell }
        cell.logoImageView.sd_setImage(with: url)

        cell.recurringSwitch.addTarget(self, action: #selector(switchChanged(sender:)), for: .valueChanged)

        return cell
    }

    @objc private func switchChanged(sender: UISwitch) {
        switch sender.isOn {
        case true:
            feedViewModel.transactions[sender.tag].isRecurring = true
        case false:
            feedViewModel.transactions[sender.tag].isRecurring = false
        }
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = CFTransactionDetailViewController(transaction: feedViewModel.transactions[indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
    }

}
