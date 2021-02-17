//
//  DateHandling.swift
//  FutList
//
//  Created by Mateus Nobre on 02/02/21.
//  Copyright © 2021 Mateus Nobre. All rights reserved.
//

import Foundation

class DateHandling {
    
    func formatStringDateToString(inFormatString: String, outFormatString: String, dateString: String) -> String? {
    
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = inFormatString
        let matchDateOpt = dateFormatter.date(from: dateString)
        
        guard let matchDate = matchDateOpt else { return nil }
        
        dateFormatter.dateFormat = outFormatString
    
        let dateTitleString = dateFormatter.string(from: matchDate)
        
        return dateTitleString
    }

    func dateStringToWeekDay(inFormatString: String, dateString: String) -> String? {
        
        guard let date = dateStringtoDate(inFormatString: inFormatString, dateString: dateString) else { return nil }
        
        let weekNum = Calendar.current.component(.weekday, from: date)
        
        switch weekNum {
        case 1:
            return "Domingo"
        case 2:
            return "Segunda-feira"
        case 3:
            return "Terça-feira"
        case 4:
            return "Quarta-feira"
        case 5:
            return "Quinta-feira"
        case 6:
            return "Sexta-feira"
        case 7:
            return "Sábado"
        default:
            return nil
        }
    }
    
    func dateStringtoDate(inFormatString: String, dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = inFormatString
        let dateOpt = dateFormatter.date(from: dateString)
        
        return dateOpt
    }
    
    func sortDateStringDesc(dates: [String]) -> [String] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"

        var newDates = dates
        
        newDates.sort {date1Str, date2Str in
            let date1Opt = dateFormatter.date(from: date1Str)
            let date2Opt = dateFormatter.date(from: date2Str)
            
            guard let date1 = date1Opt else {return false}
            guard let date2 = date2Opt else {return false}
            
            return date2 < date1
        }
        
        return newDates
    }
    
    func sortDateStringAsc(dates: [String]) -> [String] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"

        var newDates = dates
        
        newDates.sort {date1Str, date2Str in
            let date1Opt = dateFormatter.date(from: date1Str)
            let date2Opt = dateFormatter.date(from: date2Str)
            
            guard let date1 = date1Opt else {return false}
            guard let date2 = date2Opt else {return false}
            
            return date2 > date1
        }
        
        return newDates
    }
}
