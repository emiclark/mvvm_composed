//
//  TransactionViewModel.swift
//  TechChallenge
//
//  Created by Emiko Clark on 8/16/19.
//  Copyright © 2019 Marcus. All rights reserved.
//

import UIKit

final class TransactionViewModel: NSObject {
    var transactions = Transaction.getAll()

    var transactionsCount: Int {
        return transactions.count
    }

    var amountSum: Double {
        get {
            var sum: Double = 1.0
            for transaction in transactions {
                sum += transaction.amount
            }
            print(sum, index)
            return sum > 0.0 ? sum : 0.0
        }
    }

    func sumAmount() -> String {
        let amount = amountSum.toCurrencyFormat(isSameBaseline: true)
        let labelText = String(format: "Total amount for all transactions is %@".localized(), amount.string)
        return labelText
    }
}



