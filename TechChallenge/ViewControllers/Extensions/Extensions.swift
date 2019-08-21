//
//  Extensions.swift
//  TechChallenge
//
//  Created by Emiko Clark on 8/16/19.
//  Copyright © 2019 Marcus. All rights reserved.
//

import Foundation

extension Date {
    func toDateFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: self)
    }
}

extension Double {
    func toCurrencyFormat(isSameBaseline: Bool) -> NSAttributedString {
        let str = numberFormatter()
        let currency = self < 0 ? "-$" + str : "$" + str
        let attString: NSMutableAttributedString = NSMutableAttributedString(string: currency)

        // make cents upperscript
        if isSameBaseline == false {
            attString.setAttributes([.baselineOffset: 5], range: NSRange(location: currency.count - 2, length:2))
        }
        return attString
    }

    func numberFormatter() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.locale = NSLocale(localeIdentifier: "en_US") as Locale
        return formatter.string(from: NSNumber(value: self))!
    }
}

extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}
