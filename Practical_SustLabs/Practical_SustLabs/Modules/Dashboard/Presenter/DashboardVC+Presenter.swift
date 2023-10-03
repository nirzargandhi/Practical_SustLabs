//
//  DashboardVC+Presenter.swift
//  Practical_SustLabs
//

import Foundation

//MARK: - DashboardVCPresenterDelegate Protocol
protocol DashboardVCPresenterDelegate : AnyObject {
    func setupUI(dashboardData : [DashboardModel])
}

//MARK: - DashboardVC Presenter
class DashboardVCPresenter {

    //MARK: - Variable Declaration
    weak var objDashboardVCPresenterDelegate : DashboardVCPresenterDelegate?

    //MARK: - Init Method
    init(view : DashboardVCPresenterDelegate) {
        self.objDashboardVCPresenterDelegate = view
    }

    //MARK: - Load JSON Method
    internal func loadJson(filename fileName: String) {

        var dashboardData : [DashboardModel]?

        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()

                dashboardData = try decoder.decode([DashboardModel].self, from: data)
            } catch {
                Utility().dynamicToastMessage(strMessage: "Error: \(error)")
            }
        } else {
            Utility().dynamicToastMessage(strMessage: AlertMessage.msgJsonFileLoadError)
        }

        setupData(dashboardData: dashboardData ?? [])
    }

    //MARK: - Setup Data Method
    private func setupData(dashboardData : [DashboardModel]) {

        var arrDashboardData = dashboardData

        if arrDashboardData.count > 0 {

            let dictDashboard = DashboardModel(hours: [], day: "hrs")

            var arrTemp = [DashboardModel]()
            arrTemp.append(dictDashboard)
            arrTemp.append(contentsOf: arrDashboardData)

            arrDashboardData = arrTemp
        }

        objDashboardVCPresenterDelegate?.setupUI(dashboardData: arrDashboardData)
    }
}

