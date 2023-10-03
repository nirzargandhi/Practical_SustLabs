//
//  DashboardVC+DashboardVCPresenterDelegate.swift
//  Practical_SustLabs
//

//MARK: - DashboardVCPresenterDelegate Extension
extension DashboardVC : DashboardVCPresenterDelegate {

    func setupUI(dashboardData: [DashboardModel]) {

        arrDashboard = dashboardData

        if arrDashboard?.count ?? 0 > 0 {
            tblDashboard.reloadData()

            tblDashboard.isHidden = false
            lblNoData.isHidden = true
        } else {
            lblNoData.isHidden = false
            tblDashboard.isHidden = true
        }
    }
}
