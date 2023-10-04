//
//  DashboardCVC.swift
//  Practical_SustLabs
//

import UIKit

class DashboardCVC: UICollectionViewCell {

    //MARK: - UILabel Outlet
    @IBOutlet weak var lblHours: UILabel!

    //MARK: - UIView Outlet
    @IBOutlet weak var vColor: UIView!

    //MARK: - Set View Opacity Method
    internal func setViewOpacity(arrHours : [Hours], intIndex : Int) {

        for i in 0..<arrHours.count {
            if arrHours[i].intHour == intIndex {
                if arrHours[i].record_count ?? 0 > 0 {
                    vColor.backgroundColor = UIColor.appGreenColor().withAlphaComponent(CGFloat(arrHours[i].opacity ?? 0.0))
                } else {
                    vColor.backgroundColor = .appGrayColor()
                }
            }
        }
    }
}
