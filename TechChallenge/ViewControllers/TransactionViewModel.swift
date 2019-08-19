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

    enum VC {
        case cv
        case tv
    }

    enum CellStyle {
        case singleLine
        case multiLine
    }

    func nextVC(for transaction: Transaction, vc: VC) -> UIViewController {
        switch vc {
            case .cv:
                return DetailViewController(transaction: transaction)
            case .tv:
                return DetailViewController(transaction: transaction)
        }
    }

    func getCellStyle(for transaction: Transaction, withStyle: CellStyle) -> CellStyle {
        switch transaction.isRecurring {
            case true:
                return .singleLine
            case false:
                return .multiLine
        }
    }
}
