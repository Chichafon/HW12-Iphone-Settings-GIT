//
//  SettingsRightLabelOptionCell.swift
//  HW12 Iphone Settings GIT
//
//  Created by 111 on 20.12.2021.
//

import UIKit

class SettingsRightLabelOptionCell: UITableViewCell {
    static var identifier = "SettingsRightLabelOption"

    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = Metrics.labelNumberOfLines

        return label
    }()

    private let iconContainer: UIView = {
        let iconContainer = UIView()
        iconContainer.clipsToBounds = true
        iconContainer.layer.cornerRadius = Metrics.iconContainerCornerRadius
        iconContainer.layer.masksToBounds = true

        return iconContainer
    }()

    private let rightIconContainer: UIView = {
        let rightIconContrainer = UIView()
        rightIconContrainer.clipsToBounds = true
        rightIconContrainer.layer.cornerRadius = Metrics.rightIconContainerCornerRadius
        rightIconContrainer.layer.masksToBounds = true

        return rightIconContrainer
    }()

    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    private let rightLabel: UILabel = {
        let rightLabel = UILabel()

        return rightLabel
    }()

    private let rightLabelForRightContainer: UILabel = {
        let rightLabelForRightContainer = UILabel()
        rightLabelForRightContainer.textColor = .white

        return rightLabelForRightContainer
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(rightLabel)
        contentView.addSubview(rightIconContainer)
        rightIconContainer.addSubview(rightLabelForRightContainer)
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
        iconImageView.frame = CGRect(x: (size - imageSize) / Metrics.iconImageViewFrameRatio,
                                     y: (size - imageSize) / Metrics.iconImageViewFrameRatio,
                                     width: imageSize,
                                     height: imageSize)

        label.frame = CGRect(
            x: Metrics.labelXframe + iconContainer.frame.size.width,
            y: 0,
            width: contentView.frame.size.width - Metrics.labelFrameWidthPosition - iconContainer.frame.size.width,
            height: contentView.frame.size.height)

        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: Metrics.rightLabelAnchorConstant),
            rightLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        let rightContainerSize: CGFloat = contentView.frame.size.height - Metrics.rightContainerSize
        rightIconContainer.frame = CGRect(x: contentView.frame.size.width - Metrics.rightIconContainerXframe,
                                          y: Metrics.rightIconContainerYframe,
                                          width: rightContainerSize,
                                          height: rightContainerSize)

        let rightLabelForRightContainerSize: CGFloat = rightContainerSize / Metrics.rightLabelForRightContainerSizeRatio
        rightLabelForRightContainer.frame = CGRect(x: (rightContainerSize - rightLabelForRightContainerSize) / Metrics.rightLabelForRightContainerXframe,
                                                   y: (rightContainerSize - rightLabelForRightContainerSize) / Metrics.rightLabelForRightContainerYframe,
                                                   width: rightLabelForRightContainerSize,
                                                   height: rightLabelForRightContainerSize)
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        label.text = nil
        iconImageView.image = nil
        iconContainer.backgroundColor = nil
        rightLabel.text = nil
        rightIconContainer.backgroundColor = nil
        rightLabelForRightContainer.text = nil
    }

    public func configure(with model: SettingsOption) {

        label.text = model.title
        iconImageView.image = model.image
        iconContainer.backgroundColor = model.iconBackGroundColor
        rightLabel.text = model.rightLabel
        rightLabelForRightContainer.text = model.rightLabelForRightContainer
        rightIconContainer.backgroundColor = model.rightIconBackGroundColor

    }
}

extension SettingsRightLabelOptionCell: UITableViewDelegate {
    enum Metrics {
        static let rightContainerSize: CGFloat = 18
        static let rightIconContainerXframe: CGFloat = 45
        static let rightIconContainerYframe: CGFloat = 6
        static let iconContainerCornerRadius: CGFloat = 8
        static let rightIconContainerCornerRadius: CGFloat = 12
        static let labelNumberOfLines = 1
        static let imageSizeConfigurationRatio: CGFloat = 1.5
        static let iconImageViewFrameRatio: CGFloat = 2
        static let rightLabelForRightContainerSizeRatio: CGFloat = 2
        static let rightLabelForRightContainerXframe: CGFloat = 1.5
        static let rightLabelForRightContainerYframe: CGFloat = 2
        static let sizeLeadingPosition: CGFloat = 12
        static let labelFrameWidthPosition: CGFloat = 20
        static let labelXframe: CGFloat = 25
        static let iconContainerXframe: CGFloat = 15
        static let iconContainerYframe: CGFloat = 6
        static let rightLabelAnchorConstant: CGFloat = -40
    }
}
