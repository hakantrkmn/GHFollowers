//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Hakan Türkmen on 2.01.2024.
//

import Foundation


extension Date
{
    func convertMonthYearFormat() -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: self)
    }
}
