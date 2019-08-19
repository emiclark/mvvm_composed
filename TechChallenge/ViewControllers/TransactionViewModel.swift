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

    func title(for vc: VC) -> String {
        switch vc {
            case .tv:
                return "All Transactions-TV"
            case .cv:
                return "All Transactions-CV"
        }
    }
}



