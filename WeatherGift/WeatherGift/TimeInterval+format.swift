//
//  TimeInterval+format.swift
//  WeatherGift
//
//  Created by Molly Soja on 10/22/19.
//  Copyright © 2019 Molly Soja. All rights reserved.
//

import Foundation



extension TimeInterval {
    func format(timeZone: String, dateFormatter: DateFormatter) -> String {
        let usableDate = Date(timeIntervalSince1970: self)
        dateFormatter.timeZone = TimeZone(identifier: timeZone)
        let dateString = dateFormatter.string(from: usableDate)
        return dateString
    }
}
