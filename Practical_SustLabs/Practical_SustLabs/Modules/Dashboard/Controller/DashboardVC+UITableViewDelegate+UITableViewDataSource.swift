//
//  DashboardVC+UITableViewDelegate+UITableViewDataSource.swift
//  Practical_SustLabs
//

import UIKit

//MARK: - UITableViewDelegate & UITableViewDataSource Extension
extension DashboardVC : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return intTemp
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.kCellDashboard, for: indexPath) as! DashboardTVC

        cell.lblDate.text = "\(indexPath.row)"

        cell.intIndex = indexPath.row

        cell.reloadCVDashboard()

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
