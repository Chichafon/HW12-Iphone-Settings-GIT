//
//  CellModel.swift
//  HW12 Iphone Settings GIT
//
//  Created by 111 on 20.12.2021.
//

import Foundation
import UIKit

enum CellType {
    case basicCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
    case rightLabelCell(model: SettingsRightLabelOption)
}

struct Section {
    let options: [CellType]
}

struct SettingsRightLabelOption {
    let title: String?
    let image: UIImage?
    let iconBackGroundColor: UIColor
    let rightLabel: String?
    let rightLabelForRightContainer: String?
    let rightIconBackGroundColor: UIColor?
    let handler: (() -> Void)
}

struct SettingsSwitchOption {
    let title: String?
    let image: UIImage?
    let iconBackGroundColor: UIColor
    var isOn: Bool
    let handler: (() -> Void)
}

struct SettingsOption {
    let title: String?
    let image: UIImage?
    let iconBackGroundColor: UIColor
    let handler: (() -> Void)
}
