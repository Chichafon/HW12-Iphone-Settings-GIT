//
//  ViewController.swift
//  HW12 Iphone Settings GIT
//
//  Created by 111 on 20.12.2021.
//

import UIKit

class ViewController: UIViewController {
    private lazy var models = Section.configurateCells()


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

extension ViewController: UITableViewDataSource {

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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsRightLabelOptionCell.identifier,
                                                           for: indexPath) as? SettingsRightLabelOptionCell else {

                return UITableViewCell()
            }

            cell.configure(with: model)

            return cell
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
}

extension ViewController: UITableViewDelegate {

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
}
