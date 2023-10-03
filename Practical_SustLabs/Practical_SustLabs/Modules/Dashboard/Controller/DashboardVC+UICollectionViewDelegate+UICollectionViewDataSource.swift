//
//  DashboardVC+UICollectionViewDelegate+UICollectionViewDataSource.swift
//  Practical_SustLabs
//

import UIKit

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource & UICollectionViewLayout Extension
extension DashboardTVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return intTemp
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.kCellDashboard, for: indexPath) as! DashboardCVC

        cell.lblHours.text = intIndex == 0 ? "\(indexPath.row)" : ""

        cell.lblHours.isHidden = intIndex == 0 ? false : true

        cell.vColor.isHidden = intIndex == 0 ? true : false

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 34, height: 34)
    }
}
