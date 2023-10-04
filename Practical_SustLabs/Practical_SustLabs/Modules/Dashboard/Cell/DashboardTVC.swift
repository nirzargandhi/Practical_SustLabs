//
//  DashboardTVC.swift
//  Practical_SustLabs
//

import UIKit

class DashboardTVC: UITableViewCell {

    //MARK: - UILabel Outlet
    @IBOutlet weak var lblDate: UILabel!

    //MARK: - UICollectionView Outlet
    @IBOutlet weak var cvDashboard: UICollectionView!

    //MARK: - NSLayoutConstraint Outlet
    @IBOutlet weak var nslcLblDateWidth: NSLayoutConstraint!

    //MARK: - Variable Declaration
    var arrHours : [Hours]?
    var intTotalData = 25 //Hours are 24 & 1 line for showing hours so Total Data count is 24 + 1 = 25
    var intIndex : Int?

    //MARK: - Cell Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    //MARK: - Set CollView Dashboard Method
    internal func setCollViewDashboard(hours : [Hours], index : Int) {

        setHoursData(hours: hours) {

            intIndex = index

            if intTotalData > 0 {
                cvDashboard.delegate = self
                cvDashboard.dataSource = self

                cvDashboard.reloadData()

                cvDashboard.isHidden = false
            } else {
                cvDashboard.isHidden = true
            }
        }
    }

    //MARK: - Set Hours Data Method
    private func setHoursData(hours : [Hours], completion : () -> ()) {

        arrHours = hours.map { dictHours -> Hours in

            if let date = Utility().datetimeFormatter(strFormat: DateAndTimeFormatString.strDateFormat_yyyyMMddHH, isTimeZoneUTC: false).date(from: dictHours.hour ?? "") {

                let hour = Utility().datetimeFormatter(strFormat: DateAndTimeFormatString.strDateFormat_HH, isTimeZoneUTC: false).string(from: date)
                let intMaxReadCount = 1000.0
                let opacity = (Double(dictHours.record_count ?? 0) / intMaxReadCount)

                return Hours(hour: hour, record_count: dictHours.record_count ?? 0, intHour: Int(hour) ?? 0, opacity: opacity)
            } else {
                return Hours(hour: "", record_count: 0, intHour: 0, opacity: 0.0)
            }
        }

        arrHours = arrHours?.sorted(by: {$0.intHour ?? 0 < $1.intHour ?? 0})

        completion()
    }
}
