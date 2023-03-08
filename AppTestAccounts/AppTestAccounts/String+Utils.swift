//
//  String+Utils.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 8/3/23.
//

import Foundation

extension String {
    var currencyFormat: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        guard let number = formatter.number(from: self) else { return "0.0" }
        return formatter.string(from: number) ?? "0.0"
    }
}
