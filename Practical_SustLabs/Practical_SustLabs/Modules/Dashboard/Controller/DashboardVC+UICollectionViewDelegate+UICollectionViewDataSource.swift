//
//  DashboardVC+UICollectionViewDelegate+UICollectionViewDataSource.swift
//  Practical_SustLabs
//

import UIKit

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource & UICollectionViewLayout Extension
extension DashboardTVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return intTotalData
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.kCellDashboard, for: indexPath) as! DashboardCVC

        cell.lblHours.text = (intIndex ?? 0) == 0 ? "\(indexPath.row)" : ""

        cell.lblHours.isHidden = (intIndex ?? 0) == 0 ? false : true

        cell.vColor.isHidden = (intIndex ?? 0) == 0 ? true : false

        if arrHours?.contains(where: {$0.hour == "\(indexPath.row)"}) ?? false {

            let index = arrHours?.indices(where: {$0.hour == "\(indexPath.row)"})
            let intReadCount = arrHours?[index?[0] ?? 0].record_count ?? 0

            if intReadCount > 0 {
                let intMaxReadCount = 1000.0

                let opacity = (Double(intReadCount) / intMaxReadCount)

                cell.vColor.backgroundColor = UIColor.appGreenColor().withAlphaComponent(CGFloat(opacity))
            } else {
                cell.vColor.backgroundColor = .appGrayColor()
            }
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 34, height: 34)
    }
}
