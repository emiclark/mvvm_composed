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

    //FIXME:- redraw single cell
    var indexPath: IndexPath = [-1,0]
    var cellNeedsUpdate: Bool = false

//    func needsToRedrawCell(for index: Int, is value: Bool) {
//        indexPathRow = indexPathRow == 0 ? 0 : index - 1
//        transactions[indexPathRow].isRecurring = value
//        cellNeedsUpdate = value
//    }
}
