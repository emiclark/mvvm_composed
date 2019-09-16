//
//  FeedViewModel.swift
//  TechChallenge
//
//  Created by Emiko Clark on 9/14/19.
//  Copyright © 2019 Marcus. All rights reserved.
//

import Foundation
import Xcore

class FeedViewModel: NSObject {

    var transactions = Transaction.getAll()

    var transactionCount: Int {
        return transactions.count
    }

    var transaction: Transaction {
        return transactions.first!
    }

    var transactionTile: [Int: Transaction] {
        let trTile = [0: transaction]
        return trTile
    }

    let reuseIdentifier = "myCell"
}
