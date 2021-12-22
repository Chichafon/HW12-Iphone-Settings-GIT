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
        label.numberOfLines = Metrics.labelNumberOfLines

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
        view.layer.cornerRadius = Metrics.iconContainerCornerRadius
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

        let size: CGFloat = contentView.frame.size.height - Metrics.sizeLeadingPosition
        iconContainer.frame = CGRect(x: Metrics.iconContainerXframe,
                                     y: Metrics.iconContainerYframe,
                                     width:size,
                                     height: size)

        let imageSize: CGFloat = size / Metrics.imageSizeConfigurationRatio
        iconImageView.frame = CGRect(x: (size - imageSize) / Metrics.iconImageViewFrameRatio,
                                     y: (size - imageSize) / Metrics.iconImageViewFrameRatio,
                                     width: imageSize,
                                     height: imageSize)
        imageView?.center = iconContainer.center

        mySwitch.sizeToFit()
        mySwitch.frame = CGRect(x: contentView.frame.size.width - mySwitch.frame.size.width - Metrics.mySwitchXframe,
                                y: (contentView.frame.size.height - mySwitch.frame.size.height) / Metrics.mySwitchYframe,
                                width: mySwitch.frame.size.width,
                                height: mySwitch.frame.size.height)

        label.frame = CGRect(
            x: Metrics.labelXframe + iconContainer.frame.size.width,
            y: 0,
            width: (contentView.frame.size.width - Metrics.labelFrameWidthPosition) - iconContainer.frame.size.width,
            height: contentView.frame.size.height)
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        label.text = nil
        iconImageView.image = nil
        iconContainer.backgroundColor = nil
        mySwitch.isOn = false
    }

    public func configure(with model: SettingsOption) {
        label.text = model.title
        iconImageView.image = model.image
        iconContainer.backgroundColor = model.iconBackGroundColor
        mySwitch.isOn = model.isOn ?? false
    }
}

extension SwitchTableViewCell: UITableViewDelegate {
    enum Metrics {
        static let iconContainerCornerRadius: CGFloat = 8
        static let labelNumberOfLines = 1
        static let imageSizeConfigurationRatio: CGFloat = 1.5
        static let iconImageViewFrameRatio: CGFloat = 2
        static let sizeLeadingPosition: CGFloat = 12
        static let labelFrameWidthPosition: CGFloat = 20
        static let labelXframe: CGFloat = 25
        static let iconContainerXframe: CGFloat = 15
        static let iconContainerYframe: CGFloat = 6
        static let mySwitchXframe: CGFloat = 20
        static let mySwitchYframe: CGFloat = 2
    }
}
