//
//  main.swift
//  NewYear-Countdown
//
//  Created by Philipp on 9/17/20.
//  Copyright © 2020 philipp. All rights reserved.
//

import Foundation

func errorMessage(of code:Int)
{
    switch code {
    case 1:
        print("Error: month was not an integer!")
    case 2:
        print("Error: month was greater than twelve!")
    case 3:
        print("Error: month was less or equal to zero!")
    case 4:
        print("Error: day was not an integer!")
    case 5:
        print("Error: day was less or equal to zero!")
    case 6:
        print("Error: year was not an integer!")
    case 7:
        print("Error: there are only 30 days in this month!")
    case 8:
        print("Error: February this year should only contain 28 days")
    case 9:
        print("Error: February this year should only contain 29 days")
    default:
        print("No error found!")
    }
}
while true {
    while true {
        print("Input current month as integer")
        var str = readLine()
        let month = Int(str!)
        if month == nil {
            errorMessage(of: 1)
            break
        } else if month! > 12 {
            errorMessage(of: 2)
            break
        } else if month! <= 0 {
            errorMessage(of: 3)
            break
        }
        
        print("Input current day as integer")
        str = readLine()
        let day = Int(str!)
        if day == nil {
            errorMessage(of: 4)
            break
        } else if day! <= 0 {
            errorMessage(of: 5)
            break
        }
        
        let months30 = [4,6,9,11]
        
        if months30.contains(month!) && (day! > 30) {
            errorMessage(of: 7)
            break
        }
            
        print("Input current year as integer")
        str = readLine()
        let year = Int(str!)
        if year == nil {
            errorMessage(of: 6)
            break
        }
        
        if (year! % 4 != year! / 4) && (month! == 2) && (day! > 28) {
            errorMessage(of: 8)
            break
        } else if (day! > 29) && (month! == 2) {
            errorMessage(of: 9)
        }
        
        var daysLeft = 365
        if (year! % 4 != year! / 4) && (month! < 3) {
            daysLeft += 1
        }
        
        switch month {
        case 2:
            daysLeft -=  31
        case 3:
            daysLeft = daysLeft - 31 - 28
        case 4:
            daysLeft = daysLeft - 31 - 28 - 31
        case 5:
            daysLeft = daysLeft - 31 - 28 - 31 - 30
        case 6:
            daysLeft = daysLeft - 31 - 28 - 31 - 30 - 31
        case 7:
            daysLeft = daysLeft - 31 - 28 - 31 - 30 - 31 - 30
        case 8:
            daysLeft = daysLeft - 31 - 28 - 31 - 30 - 31 - 30 - 31
        case 9:
            daysLeft = daysLeft - 31 - 28 - 31 - 30 - 31 - 30 - 31 - 31
        case 10:
            daysLeft = daysLeft - 31 - 28 - 31 - 30 - 31 - 30 - 31 - 31 - 30
        case 11:
            daysLeft = daysLeft - 31 - 28 - 31 - 30 - 31 - 30 - 31 - 31 - 30 - 31
        case 12:
            daysLeft = daysLeft - 31 - 28 - 31 - 30 - 31 - 30 - 31 - 31 - 30 - 31 - 30
        default:
            daysLeft = 0
        }
        
        daysLeft -= day!
        
        print("There are \(daysLeft) before New Years!")
        print("")
    }
    print("")
}


