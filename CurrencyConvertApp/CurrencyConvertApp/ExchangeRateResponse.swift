//
//  ExchangeRateResponse.swift
//  CurrencyConvertApp
//
//  Created by admin on 01/02/25.
//

import SwiftUI

import Foundation

struct ExchangeRateResponse: Codable {
    let rates: [String: Double]
}
