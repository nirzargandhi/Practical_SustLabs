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

    //MARK: - Variable Declaration
    var intIndex = 0
    var intTemp = 9

    //MARK: - Cell Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    //MARK: - Reload CVDashboard Method
    internal func reloadCVDashboard() {

        cvDashboard.delegate = self
        cvDashboard.dataSource = self

        cvDashboard.reloadData()
    }
}
