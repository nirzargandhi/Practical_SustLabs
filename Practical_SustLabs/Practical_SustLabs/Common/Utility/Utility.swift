//
//  Utility.swift
//  Practical_SustLabs
//

import Foundation
import UIKit

//MARK: - Variable Declaration
let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height

let appDelegate = UIApplication.shared.delegate as? AppDelegate

//MARK: - Utility Struct
struct Utility {

    //MARK: - Dynamic Toast Message
    func dynamicToastMessage(strImage : String = "ic_info", strMessage : String) {

        guard let window = appDelegate?.window else {
            return
        }

        guard strMessage != "" else {
            return
        }

        mainThread {
            let imgvIcon = UIImageView()
            imgvIcon.contentMode = .scaleAspectFit
            imgvIcon.image = UIImage(named: strImage)
            imgvIcon.tintColor = .appToastMessageFontColor()
            imgvIcon.translatesAutoresizingMaskIntoConstraints = false
            imgvIcon.widthAnchor.constraint(equalToConstant: 16.0).isActive = true
            imgvIcon.heightAnchor.constraint(equalToConstant: 16.0).isActive = true

            let lblMessage = UILabel()
            lblMessage.backgroundColor = .clear
            lblMessage.numberOfLines = 0
            lblMessage.lineBreakMode = .byWordWrapping
            lblMessage.font = Fonts.InterRegular14
            lblMessage.textAlignment = .natural
            lblMessage.textColor = .appToastMessageFontColor()
            lblMessage.text = strMessage
            lblMessage.translatesAutoresizingMaskIntoConstraints = false

            let vMessage = UIView()
            vMessage.frame = CGRect.zero
            vMessage.layer.cornerRadius = 5
            vMessage.clipsToBounds = true
            vMessage.backgroundColor = .appToastMessageBgColor()

            let labelSizeWithFixedWith = CGSize(width: ScreenWidth - 72.0, height: CGFloat.greatestFiniteMagnitude)
            let exactLabelsize = lblMessage.sizeThatFits(labelSizeWithFixedWith)
            lblMessage.frame = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: exactLabelsize)

            let sizeLblMessage : CGSize = lblMessage.intrinsicContentSize
            vMessage.frame = CGRect(x: 8.0, y: window.safeAreaInsets.top + 24.0, width: ScreenWidth - 16.0, height: lblMessage.frame.height + sizeLblMessage.height + 8.0)

            vMessage.addSubview(imgvIcon)
            vMessage.addSubview(lblMessage)

            NSLayoutConstraint.activate([
                imgvIcon.topAnchor.constraint(equalTo: vMessage.topAnchor, constant: 14),
                imgvIcon.leadingAnchor.constraint(equalTo: vMessage.leadingAnchor, constant: 16),

                lblMessage.topAnchor.constraint(equalTo: vMessage.topAnchor, constant: 12),
                lblMessage.leadingAnchor.constraint(equalTo: vMessage.leadingAnchor, constant: 40),
                lblMessage.trailingAnchor.constraint(equalTo: vMessage.trailingAnchor, constant: -16),
                lblMessage.bottomAnchor.constraint(equalTo: vMessage.bottomAnchor, constant: -12),
            ])

            window.addSubview(vMessage)

            UIView.animate(withDuration: 3.0, delay: 0, options: .curveEaseIn, animations: {
                vMessage.alpha = 1
            }, completion: nil)

            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double((Int64)(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC), execute: {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                    vMessage.alpha = 0
                }, completion: { finished in
                    vMessage.removeFromSuperview()
                })
            })
        }
    }

    //MARK: -  Date Formatter Method
    func datetimeFormatter(strFormat : String, isTimeZoneUTC : Bool) -> DateFormatter {

        var dateFormatter: DateFormatter?

        if dateFormatter == nil {
            dateFormatter = DateFormatter()
            dateFormatter?.timeZone = isTimeZoneUTC ? TimeZone(abbreviation: "UTC") : TimeZone.current
            dateFormatter?.dateFormat = strFormat
        }

        return dateFormatter!
    }

    //MARK: - Set Root DashboardVC Method
    func setRootDashboardVC() {
        let objDashboardVC = AllStoryBoard.Main.instantiateViewController(withIdentifier: ViewControllerName.kDashboardVC) as? DashboardVC
        let navigationViewController = UINavigationController(rootViewController: objDashboardVC!)
        appDelegate?.window?.rootViewController = navigationViewController
        appDelegate?.window?.makeKeyAndVisible()
    }
}

//MARK: - Main Thread Method
func mainThread(_ completion: @escaping () -> ()) {

    DispatchQueue.main.async {
        completion()
    }
}

//MARK: - Platform
struct Platform {

    static var isSimulator: Bool {
        return TARGET_OS_SIMULATOR != 0
    }
}

