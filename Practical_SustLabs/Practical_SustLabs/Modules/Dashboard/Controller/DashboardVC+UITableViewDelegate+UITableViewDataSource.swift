//
//  DashboardVC+UITableViewDelegate+UITableViewDataSource.swift
//  Practical_SustLabs
//

import UIKit

//MARK: - UITableViewDelegate & UITableViewDataSource Extension
extension DashboardVC : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDashboard?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.kCellDashboard, for: indexPath) as! DashboardTVC

        if indexPath.row == 0 {
            cell.lblDate.text = arrDashboard?[indexPath.row].day ?? ""
        } else {
            if let date = Utility().datetimeFormatter(strFormat: DateAndTimeFormatString.strDateFormat_yyyyMMdd, isTimeZoneUTC: false).date(from: arrDashboard?[indexPath.row].day ?? "") {
                cell.lblDate.text = Utility().datetimeFormatter(strFormat: DateAndTimeFormatString.strDateFormat_dd, isTimeZoneUTC: false).string(from: date)
            } else {
                cell.lblDate.text = ""
            }
        }

        cell.setCollViewDashboard(hours: arrDashboard?[indexPath.row].hours ?? [], index: indexPath.row)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}
