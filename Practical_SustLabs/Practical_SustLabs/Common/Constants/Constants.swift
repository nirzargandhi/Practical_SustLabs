//
//  Constants.swift
//  Practical_SustLabs
//

import UIKit

//MARK: - StoryBoard Identifier's
enum AllStoryBoard {

    static let Main = UIStoryboard(name: "Main", bundle: nil)
}

//MARK: - ViewController Names
enum ViewControllerName {

    static let kDashboardVC = "DashboardVC"
}

//MARK: - Cell Identifiers
enum CellIdentifiers {

    static let kCellDashboard = "CellDashboard"
}

//MARK: - Message's
enum AlertMessage {

    static let msgError = "Oops! That didn't work. Please try later :("
    static let msgJsonFileLoadError = "JSON file cannot be loaded"
}

//MARK: - DateTime Format
enum DateAndTimeFormatString {

    static let strDateFormat_yyyyMMdd = "yyyyMMdd"
    static let strDateFormat_yyyyMMddHH = "yyyyMMddHH"
    static let strDateFormat_dd = "dd"
    static let strDateFormat_HH = "HH"
}

//MARK: - Fonts
enum Fonts {

    static let InterBold16 = UIFont(name: "Inter-Bold", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .bold)
    static let InterRegular16 = UIFont(name: "Inter-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .regular)
    static let InterRegular14 = UIFont(name: "Inter-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .regular)
}

