// StoriesCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// stories cell
final class StoriesCell: UITableViewCell {
    // MARK: - Visual Components

    private let loginLabelGirl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont(name: "Verdana", size: 8)
        return label
    }()

    private let girlImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let loginLabelLavanda: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: "Verdana", size: 8)
        return label
    }()

    private let lavandaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let secondLoginLabelLavanda: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: "Verdana", size: 8)
        return label
    }()

    private let secondLavandaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let thirdLoginLabelLavanda: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: "Verdana", size: 8)
        return label
    }()

    private let thirdLavandaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let fourthLoginLabelLavanda: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: "Verdana", size: 8)
        return label
    }()

    private let fourthLavandaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var historyScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentSize = CGSize(width: frame.size.width * 2, height: frame.size.height)
        scroll.showsHorizontalScrollIndicator = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()

    // MARK: - Constants

    enum Constants {
        static let identifier = "StoriesCell"
    }

    // MARK: - Private Properties

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(historyScrollView)
        setupScroll()
        historyScrollView.addSubview(loginLabelGirl)
        setupFirstLoginLabel()
        historyScrollView.addSubview(girlImageView)
        setupFirstImageGirl()
        historyScrollView.addSubview(loginLabelLavanda)
        setupFirstLavandaLabel()
        historyScrollView.addSubview(lavandaImageView)
        setupFirstImageLavanda()
        historyScrollView.addSubview(secondLoginLabelLavanda)
        setupSecondLoginLabelLavanda()
        historyScrollView.addSubview(secondLavandaImageView)
        setupSecondImageLavanda()
        historyScrollView.addSubview(thirdLoginLabelLavanda)
        setudThirdLoginLabelLavanda()
        historyScrollView.addSubview(thirdLavandaImageView)
        setupThirdImageLavanda()
        historyScrollView.addSubview(fourthLoginLabelLavanda)
        setupFourthThirdLoginLabelLavanda()
        historyScrollView.addSubview(fourthLavandaImageView)
        setupFourthImageLavanda()

        func awakeFromNib() {
            super.awakeFromNib()
            print("hi")
            // Initialization code
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupScroll() {
        historyScrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        historyScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        historyScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        historyScrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    private func setupFirstLoginLabel() {
        loginLabelGirl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
        loginLabelGirl.leadingAnchor.constraint(equalTo: historyScrollView.leadingAnchor, constant: 12).isActive = true
        loginLabelGirl.widthAnchor.constraint(equalToConstant: 150).isActive = true
        loginLabelGirl.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func setupFirstImageGirl() {
        girlImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        girlImageView.leadingAnchor.constraint(equalTo: historyScrollView.leadingAnchor, constant: 12)
            .isActive = true
        girlImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        girlImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func setupFirstLavandaLabel() {
        loginLabelLavanda.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
        loginLabelLavanda.leadingAnchor.constraint(equalTo: historyScrollView.leadingAnchor, constant: 105)
            .isActive = true
        loginLabelLavanda.widthAnchor.constraint(equalToConstant: 150).isActive = true
        loginLabelLavanda.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func setupFirstImageLavanda() {
        lavandaImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        lavandaImageView.leadingAnchor.constraint(equalTo: historyScrollView.leadingAnchor, constant: 100)
            .isActive = true
        lavandaImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        lavandaImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func setupSecondLoginLabelLavanda() {
        secondLoginLabelLavanda.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
        secondLoginLabelLavanda.leadingAnchor.constraint(equalTo: historyScrollView.leadingAnchor, constant: 185)
            .isActive = true
        secondLoginLabelLavanda.widthAnchor.constraint(equalToConstant: 150).isActive = true
        secondLoginLabelLavanda.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func setupSecondImageLavanda() {
        secondLavandaImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        secondLavandaImageView.leadingAnchor.constraint(equalTo: historyScrollView.leadingAnchor, constant: 180)
            .isActive = true
        secondLavandaImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        secondLavandaImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func setudThirdLoginLabelLavanda() {
        thirdLoginLabelLavanda.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
        thirdLoginLabelLavanda.leadingAnchor.constraint(equalTo: historyScrollView.leadingAnchor, constant: 260)
            .isActive = true
        thirdLoginLabelLavanda.widthAnchor.constraint(equalToConstant: 150).isActive = true
        thirdLoginLabelLavanda.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func setupThirdImageLavanda() {
        thirdLavandaImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        thirdLavandaImageView.leadingAnchor.constraint(equalTo: historyScrollView.leadingAnchor, constant: 260)
            .isActive = true
        thirdLavandaImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        thirdLavandaImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func setupFourthThirdLoginLabelLavanda() {
        fourthLoginLabelLavanda.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
        fourthLoginLabelLavanda.leadingAnchor.constraint(equalTo: historyScrollView.leadingAnchor, constant: 340)
            .isActive = true
        fourthLoginLabelLavanda.widthAnchor.constraint(equalToConstant: 150).isActive = true
        fourthLoginLabelLavanda.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func setupFourthImageLavanda() {
        fourthLavandaImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        fourthLavandaImageView.leadingAnchor.constraint(equalTo: historyScrollView.leadingAnchor, constant: 340)
            .isActive = true
        fourthLavandaImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        fourthLavandaImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    func setupStoriesCell(stories: [Stories]) {
        loginLabelGirl.text = stories[0].loginName
        girlImageView.image = UIImage(named: stories[0].avatarName)
        loginLabelLavanda.text = stories[1].loginName
        lavandaImageView.image = UIImage(named: stories[1].avatarName)
        secondLoginLabelLavanda.text = stories[2].loginName
        secondLavandaImageView.image = UIImage(named: stories[2].avatarName)
        thirdLoginLabelLavanda.text = stories[3].loginName
        thirdLavandaImageView.image = UIImage(named: stories[3].avatarName)
        fourthLoginLabelLavanda.text = stories[4].loginName
        fourthLavandaImageView.image = UIImage(named: stories[4].avatarName)
    }
}
