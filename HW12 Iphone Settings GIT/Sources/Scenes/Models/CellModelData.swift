//
//  CellModelData.swift
//  HW12 Iphone Settings GIT
//
//  Created by 111 on 21.12.2021.
//

import Foundation
import UIKit

final class CellModelData {
    
    static var dataModelCell = ["SectionOne": [Section(options: [
                                                    .switchCell(model: SettingsOption(title: "Авиарежим",
                                                                                      image: UIImage(systemName: "airplane") ?? .add,
                                                                                      iconBackGroundColor: .systemOrange,
                                                                                      rightLabel: nil,
                                                                                      rightLabelForRightContainer: nil,
                                                                                      rightIconBackGroundColor: nil,
                                                                                      isOn: false,
                                                                                      handler: { }
                                                    )),
                                                    .rightLabelCell(model: SettingsOption(title: "Wi-Fi",
                                                                                          image: UIImage(systemName: "airplane") ?? .add,
                                                                                          iconBackGroundColor: .systemBlue,
                                                                                          rightLabel: "Не подключено",
                                                                                          rightLabelForRightContainer: nil,
                                                                                          rightIconBackGroundColor: nil,
                                                                                          isOn: nil,
                                                                                          handler: { }
                                                    )),
                                                    .rightLabelCell(model: SettingsOption(title: "Bluetooth",
                                                                                          image: UIImage(systemName: "wave.3.forward") ?? .add,
                                                                                          iconBackGroundColor: .systemBlue,
                                                                                          rightLabel: "Вкл.",
                                                                                          rightLabelForRightContainer: nil,
                                                                                          rightIconBackGroundColor: nil,
                                                                                          isOn: nil,
                                                                                          handler: { }
                                                    )),
                                                    .basicCell(model: SettingsOption(title: "Сотовая связь",
                                                                                     image: UIImage(systemName: "antenna.radiowaves.left.and.right") ?? .add,
                                                                                     iconBackGroundColor: .systemGreen,
                                                                                     rightLabel: nil,
                                                                                     rightLabelForRightContainer: nil,
                                                                                     rightIconBackGroundColor: nil,
                                                                                     isOn: nil,
                                                                                     handler: { }
                                                    )),
                                                    .basicCell(model: SettingsOption(title: "Режим модема",
                                                                                     image: UIImage(systemName: "personalhotspot") ?? .add,
                                                                                     iconBackGroundColor: .systemGreen,
                                                                                     rightLabel: nil,
                                                                                     rightLabelForRightContainer: nil,
                                                                                     rightIconBackGroundColor: nil,
                                                                                     isOn: nil,
                                                                                     handler: { }
                                                    )),
                                                    .switchCell(model: SettingsOption(title: "VPN",
                                                                                      image: UIImage(systemName: "key.icloud") ?? .add,
                                                                                      iconBackGroundColor: .systemGreen,
                                                                                      rightLabel: nil,
                                                                                      rightLabelForRightContainer: nil,
                                                                                      rightIconBackGroundColor: nil,
                                                                                      isOn: false,
                                                                                      handler: { }
                                                    ))]
                        )],
                        "SectionTwo": [Section(options: [
                                                .basicCell(model: SettingsOption(title: "Уведомления",
                                                                                 image: UIImage(systemName: "dot.square") ?? .add,
                                                                                 iconBackGroundColor: .systemRed,
                                                                                 rightLabel: nil,
                                                                                 rightLabelForRightContainer: nil,
                                                                                 rightIconBackGroundColor: nil,
                                                                                 isOn: nil,
                                                                                 handler: { }
                                                )),
                                                .basicCell(model: SettingsOption(title: "Звуки и тактильные сигналы",
                                                                                 image: UIImage(systemName: "speaker.wave.2") ?? .add,
                                                                                 iconBackGroundColor: .systemPink,
                                                                                 rightLabel: nil,
                                                                                 rightLabelForRightContainer: nil,
                                                                                 rightIconBackGroundColor: nil,
                                                                                 isOn: nil,
                                                                                 handler: { }
                                                )),
                                                .basicCell(model: SettingsOption(title: "Не беспокоить",
                                                                                 image: UIImage(systemName: "moon") ?? .add,
                                                                                 iconBackGroundColor: .purple,
                                                                                 rightLabel: nil,
                                                                                 rightLabelForRightContainer: nil,
                                                                                 rightIconBackGroundColor: nil,
                                                                                 isOn: nil,
                                                                                 handler: { }
                                                )),
                                                .basicCell(model: SettingsOption(title: "Экранное время",
                                                                                 image: UIImage(systemName: "hourglass") ?? .add,
                                                                                 iconBackGroundColor: .purple,
                                                                                 rightLabel: nil,
                                                                                 rightLabelForRightContainer: nil,
                                                                                 rightIconBackGroundColor: nil,
                                                                                 isOn: nil,
                                                                                 handler: { }
                                                ))]
                        )],
                        "SectionThree": [Section(options: [
                                                    .rightLabelCell(model: SettingsOption(title: "Основные",
                                                                                          image: UIImage(systemName: "gear") ?? .add,
                                                                                          iconBackGroundColor: .lightGray,
                                                                                          rightLabel: nil,
                                                                                          rightLabelForRightContainer: "1",
                                                                                          rightIconBackGroundColor: .systemRed,
                                                                                          isOn: nil,
                                                                                          handler: { }
                                                    )),
                                                    .basicCell(model: SettingsOption(title: "Пункт управления",
                                                                                     image: UIImage(systemName: "switch.2") ?? .add,
                                                                                     iconBackGroundColor: .lightGray,
                                                                                     rightLabel: nil,
                                                                                     rightLabelForRightContainer: nil,
                                                                                     rightIconBackGroundColor: nil,
                                                                                     isOn: nil,
                                                                                     handler: { }
                                                    )),
                                                    .basicCell(model: SettingsOption(title: "Экран и яркость",
                                                                                     image: UIImage(systemName: "textformat.size") ?? .add,
                                                                                     iconBackGroundColor: .systemBlue,
                                                                                     rightLabel: nil,
                                                                                     rightLabelForRightContainer: nil,
                                                                                     rightIconBackGroundColor: nil,
                                                                                     isOn: nil,
                                                                                     handler: { }
                                                    )),
                                                    .basicCell(model: SettingsOption(title: "Экран <Домой>",
                                                                                     image: UIImage(systemName: "switch.2") ?? .add,
                                                                                     iconBackGroundColor: .blue,
                                                                                     rightLabel: nil,
                                                                                     rightLabelForRightContainer: nil,
                                                                                     rightIconBackGroundColor: nil,
                                                                                     isOn: nil,
                                                                                     handler: { }
                                                    )),
                                                    .basicCell(model: SettingsOption(title: "Универсальный доступ",
                                                                                     image: UIImage(systemName: "person.crop.square") ?? .add,
                                                                                     iconBackGroundColor: .systemBlue,
                                                                                     rightLabel: nil,
                                                                                     rightLabelForRightContainer: nil,
                                                                                     rightIconBackGroundColor: nil,
                                                                                     isOn: nil,
                                                                                     handler: { }
                                                    ))]
                        )]]
}
