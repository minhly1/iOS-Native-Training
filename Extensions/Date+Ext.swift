//
//  Date+Ext.swift
//  iOS-Native-Training
//
//  Created by MIN on 12/12/25.
//

import Foundation

extension Date {

    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
