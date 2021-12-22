//
//  SettingTableViewCell.swift
//  HW12 Iphone Settings GIT
//
//  Created by 111 on 20.12.2021.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    static var identifier = "SettingTableViewCell"

    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = Metrics.labelNumberOfLines

        return label
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
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let size: CGFloat = contentView.frame.size.height - Metrics.sizeLeadingPosition
        iconContainer.frame = CGRect(x: Metrics.iconContainerXframe,
                                     y: Metrics.iconContainerYframe,
                                     width: size,
                                     height: size)

        let imageSize: CGFloat = size / Metrics.imageSizeConfigurationRatio
        iconImageView.frame = CGRect(x: (size - imageSize) / Metrics.imageViewFrameRatio,
                                     y: (size - imageSize) / Metrics.imageViewFrameRatio,
                                     width: imageSize,
                                     height: imageSize)
        imageView?.center = iconContainer.center

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
    }

    public func configure(with model: SettingsOption) {
        label.text = model.title
        iconImageView.image = model.image
        iconContainer.backgroundColor = model.iconBackGroundColor
    }
}

extension SettingTableViewCell: UITableViewDelegate {
    enum Metrics {
        static let iconContainerCornerRadius: CGFloat = 8
        static let labelNumberOfLines = 1
        static let imageSizeConfigurationRatio: CGFloat = 1.5
        static let imageViewFrameRatio: CGFloat = 2
        static let sizeLeadingPosition: CGFloat = 12
        static let labelFrameWidthPosition: CGFloat = 20
        static let labelXframe: CGFloat = 25
        static let iconContainerXframe: CGFloat = 15
        static let iconContainerYframe: CGFloat = 6
    }
}


