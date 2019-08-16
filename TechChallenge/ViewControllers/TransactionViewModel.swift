//
//  TransactionViewModel.swift
//  TechChallenge
//
//  Created by Emiko Clark on 8/16/19.
//  Copyright © 2019 Marcus. All rights reserved.
//

import Foundation

class TransactionViewModel: NSObject {
    private let transactions = Transaction.getAll()
}
