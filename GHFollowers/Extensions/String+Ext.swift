//
//  String+Ext.swift
//  GHFollowers
//
//  Created by Hakan Türkmen on 2.01.2024.
//

import Foundation

extension String
{
    func converToDate() -> Date?
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "tr")
        dateFormatter.timeZone = .current
        return dateFormatter.date(from: self)
    }
    
    func convertToDisplayFormat() -> String
    {
        guard let date = self.converToDate() else {return "N/A"}
        return date.convertMonthYearFormat()
    }
}
