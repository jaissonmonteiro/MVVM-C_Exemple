//
//  DateManager.swift
//  MVVM-C_Exemple
//
//  Created by Jaisson Monteiro on 01/04/21.
//

import Foundation

class DateManager {
    
    //MARK: - Properties
    private let rawDate: String
    private let dateFormatter = DateFormatter()
    
    //MARK: - Inits
    init(rawDate: String) {
        self.rawDate = rawDate
        setupFormatter()
    }
    
    //MARK: - Setup methods
    private func setupFormatter() {
        dateFormatter.locale = Locale(identifier: "pt_BR")
    }
    
    //MARK: - Methods
    func formatted(format: String) -> String {
        guard let date = getDate() else { return "" }
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
    private func getDate() -> Date? {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter.date(from: rawDate)
    }
}
