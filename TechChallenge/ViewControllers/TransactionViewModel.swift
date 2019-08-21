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
}



