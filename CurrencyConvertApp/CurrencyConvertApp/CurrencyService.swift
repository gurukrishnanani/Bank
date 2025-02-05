//
//  CurrencyService.swift
//  CurrencyConvertApp
//
//  Created by admin on 01/02/25.
//

import Foundation
import Combine

class CurrencyService {
    static let shared = CurrencyService()
    private var cancellables = Set<AnyCancellable>()
    
    func fetchExchangeRates(baseCurrency: String) -> AnyPublisher<[String: Double], Error> {
        let urlString = "https://open.er-api.com/v6/latest/\(baseCurrency)?apikey=YOUR_API_KEY"
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: ExchangeRateResponse.self, decoder: JSONDecoder())
            .map { $0.rates }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
