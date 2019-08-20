//
//  TransactionCollectionViewDataSource
//  TechChallenge
//
//  Created by Emiko Clark on 8/16/19.
//  Copyright © 2019 Marcus. All rights reserved.
//

import UIKit
import SDWebImage

final class TransactionCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var navigationCtlr: UINavigationController? = nil
    private let viewModel = TransactionViewModel()
    var reuseidentifier: String {
        return "cellId"
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.transactions.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseidentifier, for: indexPath) as! CustomCollectionViewCell
        let transaction = viewModel.transactions[indexPath.row]
        cell.configure(with: transaction)

        guard let urlString = transaction.logoUrl,
            let url = URL(string: urlString) else { return cell }
        cell.logoImageView.sd_setImage(with: url)

        cell.recurringSwitch.addTarget(self, action: #selector(switchChanged(sender:)), for: .valueChanged)

        cell.configure(with: transaction)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.frame.width, height: 150)
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let transaction = viewModel.transactions[indexPath.row]
        let detailVC = TransactionDetailViewController(transaction: transaction)
        navigationCtlr?.pushViewController(detailVC, animated: true)
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
