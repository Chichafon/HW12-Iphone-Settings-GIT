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
        label.numberOfLines = 1

        return label
    }()

    private let iconContainer: UIView = {
        let iconContainer = UIView()
        iconContainer.clipsToBounds = true
        iconContainer.layer.cornerRadius = 8
        iconContainer.layer.masksToBounds = true

        return iconContainer
    }()

    private let rightIconContainer: UIView = {
        let rightIconContrainer = UIView()
        rightIconContrainer.clipsToBounds = true
        rightIconContrainer.layer.cornerRadius = 12
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

        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 15,
                                     y: 6,
                                     width: size,
                                     height: size)

        let imageSize: CGFloat = size / 1.5
        iconImageView.frame = CGRect(x: (size - imageSize) / 2,
                                     y: (size - imageSize) / 2,
                                     width: imageSize,
                                     height: imageSize)

        label.frame = CGRect(
            x: 25 + iconContainer.frame.size.width,
            y: 0,
            width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
            height: contentView.frame.size.height)

        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),
            rightLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        let rightContainerSize: CGFloat = contentView.frame.size.height - 18
        rightIconContainer.frame = CGRect(x: contentView.frame.size.width - 45,
                                          y: 6,
                                          width: rightContainerSize,
                                          height: rightContainerSize)

        let rightLabelForRightContainerSize: CGFloat = rightContainerSize / 2
        rightLabelForRightContainer.frame = CGRect(x: (rightContainerSize - rightLabelForRightContainerSize) / 1.5
                                                   ,
                                                   y: (rightContainerSize - rightLabelForRightContainerSize) / 2,
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

    public func configure(with model: SettingsRightLabelOption) {

        label.text = model.title
        iconImageView.image = model.image
        iconContainer.backgroundColor = model.iconBackGroundColor
        rightLabel.text = model.rightLabel
        rightLabelForRightContainer.text = model.rightLabelForRightContainer
        rightIconContainer.backgroundColor = model.rightIconBackGroundColor

    }
}
