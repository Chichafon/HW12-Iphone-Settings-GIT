//
//  SwitchTableViewCell.swift
//  HW12 Iphone Settings GIT
//
//  Created by 111 on 20.12.2021.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    static var identifier = "SwitchTableViewCell"

    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1

        return label
    }()

    private let mySwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.onTintColor = .systemBlue

        return mySwitch
    }()

    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true

        return view
    }()

    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(mySwitch)
        contentView.clipsToBounds = true
        accessoryType = .none

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 15,
                                     y: 6,
                                     width:size,
                                     height: size)

        let imageSize: CGFloat = size / 1.5
        iconImageView.frame = CGRect(x: (size - imageSize) / 2,
                                     y: (size - imageSize) / 2,
                                     width: imageSize,
                                     height: imageSize)
        imageView?.center = iconContainer.center

        mySwitch.sizeToFit()
        mySwitch.frame = CGRect(x: contentView.frame.size.width - mySwitch.frame.size.width - 20,
                                y: (contentView.frame.size.height - mySwitch.frame.size.height) / 2,
                                width: mySwitch.frame.size.width,
                                height: mySwitch.frame.size.height)

        label.frame = CGRect(
            x: 25 + iconContainer.frame.size.width,
            y: 0,
            width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
            height: contentView.frame.size.height)
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        label.text = nil
        iconImageView.image = nil
        iconContainer.backgroundColor = nil
        mySwitch.isOn = false
    }

    public func configure(with model: SettingsSwitchOption) {
        label.text = model.title
        iconImageView.image = model.image
        iconContainer.backgroundColor = model.iconBackGroundColor
        mySwitch.isOn = model.isOn
    }
}
