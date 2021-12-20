//
//  ViewController.swift
//  HW12 Iphone Settings GIT
//
//  Created by 111 on 20.12.2021.
//

import UIKit

class ViewController: UIViewController {
    private lazy var models = [Section]()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SettingTableViewCell.self,
                           forCellReuseIdentifier: SettingTableViewCell.identifier)
        tableView.register(SwitchTableViewCell.self,
                           forCellReuseIdentifier: SwitchTableViewCell.identifier)
        tableView.register(SettingsRightLabelOptionCell.self,
                           forCellReuseIdentifier: SettingsRightLabelOptionCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        view.backgroundColor = .white
        title = "Настройки"
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        view.addSubview(tableView)
    }

    private func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func configure() -> [Section] {
        models.append(Section(options: [
                                        .switchCell(model: SettingsSwitchOption(title: "Авиарежим",
                                                                                image: UIImage(systemName: "airplane") ?? .add,
                                                                                iconBackGroundColor: .systemOrange,
                                                                                isOn: false) {
                                        }),
                                        .rightLabelCell(model: SettingsRightLabelOption(title: "Wi-Fi",
                                                                         image: UIImage(systemName: "wifi") ?? .add,
                                                                         iconBackGroundColor: .systemBlue,
                                                                         rightLabel: "Не подключено", rightLabelForRightContainer: " ",
                                                                         rightIconBackGroundColor: .none) {
                                        }),
                                        .rightLabelCell(model: SettingsRightLabelOption(title: "Bluetooth",
                                                                         image: UIImage(systemName: "wave.3.forward") ?? .add,
                                                                         iconBackGroundColor: .systemBlue,
                                                                         rightLabel: "Вкл.", rightLabelForRightContainer: " ",
                                                                         rightIconBackGroundColor: .none) {
                                        }),
                                        .basicCell(model: SettingsOption(title: "Сотовая связь",
                                                                         image: UIImage(systemName: "antenna.radiowaves.left.and.right") ?? .add,
                                                                         iconBackGroundColor: .systemGreen) {
                                        }),
                                        .basicCell(model: SettingsOption(title: "Режим модема",
                                                                         image: UIImage(systemName: "personalhotspot") ?? .add,
                                                                         iconBackGroundColor: .systemGreen) {
                                        }),
                                        .switchCell(model: SettingsSwitchOption(title: "VPN",
                                                                                image: UIImage(systemName: "key.icloud") ?? .add,
                                                                                iconBackGroundColor: .systemBlue,
                                                                                isOn: false) {
                                        }
                                        )])
        );
        models.append(Section(options: [
                                .basicCell(model: SettingsOption(title: "Уведомления",
                                                                 image: UIImage(systemName: "dot.square") ?? .add,
                                                                 iconBackGroundColor: .systemRed) {
                                }),
                                .basicCell(model: SettingsOption(title: "Звуки и тактильные сигналы",
                                                                 image: UIImage(systemName: "speaker.wave.2") ?? .add,
                                                                 iconBackGroundColor: .systemPink) {
                                }),
                                .basicCell(model: SettingsOption(title: "Не беспокоить",
                                                                 image: UIImage(systemName: "moon") ?? .add,
                                                                 iconBackGroundColor: .purple) {
                                }),
                                .basicCell(model: SettingsOption(title: "Экранное время",
                                                                 image: UIImage(systemName: "hourglass") ?? .add,
                                                                 iconBackGroundColor: .purple) {
                                }
                                )])
        );
        models.append(Section(options: [
                                .rightLabelCell(model: SettingsRightLabelOption(title: "Основные",
                                                                 image: UIImage(systemName: "gear") ?? .add,
                                                                 iconBackGroundColor: .lightGray,
                                                                 rightLabel: " ",
                                                                 rightLabelForRightContainer: "1",
                                                                 rightIconBackGroundColor: .systemRed) {
                                }),
                                .basicCell(model: SettingsOption(title: "Пункт управления",
                                                                 image: UIImage(systemName: "switch.2") ?? .add,
                                                                 iconBackGroundColor: .lightGray) {
                                }),
                                .basicCell(model: SettingsOption(title: "Экран и яркость",
                                                                 image: UIImage(systemName: "textformat.size") ?? .add,
                                                                 iconBackGroundColor: .systemBlue) {
                                }),
                                .basicCell(model: SettingsOption(title: "Экран <Домой>",
                                                                 image: UIImage(systemName: "switch.2") ?? .add,
                                                                 iconBackGroundColor: .blue) {
                                }),
                                .basicCell(model: SettingsOption(title: "Универсальный доступ",
                                                                 image: UIImage(systemName: "person.crop.square") ?? .add,
                                                                 iconBackGroundColor: .systemBlue) {
                                }
                                )])
        )

        return models
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]

        switch model.self {
        case .basicCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier,
                                                           for: indexPath) as? SettingTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)

            return cell

        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier,
                                                           for: indexPath) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)

            return cell

        case .rightLabelCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsRightLabelOptionCell.identifier, for: indexPath) as? SettingsRightLabelOptionCell else {

                return UITableViewCell()
            }

            cell.configure(with: model)

            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .basicCell(let model):
            model.handler()
            print("Нажата ячейка <<\(model.title ?? "Отсутствует")>>")
        case .switchCell(let model):
            model.handler()
            print("Нажата ячейка <<\(model.title ?? "Отсутствует")>>")
        case .rightLabelCell(let model):
            model.handler()
            print("Нажата ячейка <<\(model.title ?? "Отсутствует")>>")
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
}
