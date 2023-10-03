//
//  DashboardVC.swift
//  Practical_SustLabs
//

import UIKit

class DashboardVC: UIViewController {

    //MARK: - UITableView Outlet
    @IBOutlet weak var tblDashboard: UITableView!

    //MARK: - UILabel Outlet
    @IBOutlet weak var lblNoData: UILabel!

    //MARK: - Variable Declaration
    var arrDashboard : [DashboardModel]?
    lazy var objDashboardVCPresenter = DashboardVCPresenter(view: self)

    //MARK: - ViewController Method
    override func viewDidLoad() {
        super.viewDidLoad()

        initialization()

        objDashboardVCPresenter.loadJson(filename: "JsonData")
    }

    //MARK: - Initialization Method
    private func initialization() {

        hideNavigationBar(isTabbar: false)

        if #available(iOS 15.0, *) {
            tblDashboard.sectionHeaderTopPadding = 0.0
            tblDashboard.tableHeaderView = UIView()
        }

        tblDashboard.tableFooterView = UIView()
    }
}
