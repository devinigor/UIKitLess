// SecondViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер для отображение людей у которых скоро ДР
final class SecondViewController: UIViewController {
    // MARK: - Constants

    private let daysOfLast: UILabel = {
        let days = UILabel()
        days.frame = CGRect(x: 317, y: 404, width: 42, height: 44)
        days.text = "87 days"
        days.font = UIFont(name: "Verdana-Bold", size: 16)
        days.textColor = UIColor(named: "daysleft")
        days.numberOfLines = 0
        days.textAlignment = .center
        return days
    }()

    private let daysOfThird: UILabel = {
        let days = UILabel()
        days.frame = CGRect(x: 315, y: 309, width: 42, height: 44)
        days.text = "42 days"
        days.font = UIFont(name: "Verdana-Bold", size: 16)
        days.textColor = UIColor(named: "daysleft")
        days.numberOfLines = 0
        days.textAlignment = .center
        return days
    }()

    private let daysOfSecond: UILabel = {
        let days = UILabel()
        days.frame = CGRect(x: 314, y: 214, width: 42, height: 44)
        days.text = "10 days"
        days.font = UIFont(name: "Verdana-Bold", size: 16)
        days.textColor = UIColor(named: "daysleft")
        days.numberOfLines = 0
        days.textAlignment = .center
        return days
    }()

    private let imageCake: UIImageView = {
        let cake = UIImageView()
        cake.frame = CGRect(x: 314, y: 119, width: 44, height: 44)
        cake.image = UIImage(named: "cake2")
        return cake
    }()

    private let bdayLabel4: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 105, y: 432, width: 209, height: 20)
        label.text = "05.06 - turns 18"
        label.textColor = .black
        label.font = UIFont(name: "Verdana", size: 14)
        return label
    }()

    private let bdayLabel3: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 103, y: 337, width: 209, height: 20)
        label.text = "21.04 - turns 51"
        label.textColor = .black
        label.font = UIFont(name: "Verdana", size: 14)
        return label
    }()

    private let bdayLabel2: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 103, y: 242, width: 209, height: 20)
        label.text = "20.03 - turns 39"
        label.textColor = .black
        label.font = UIFont(name: "Verdana", size: 14)
        return label
    }()

    private let bdayLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 102, y: 147, width: 209, height: 20)
        label.text = "10.03 - turns 25!"
        label.font = UIFont(name: "Verdana", size: 14)
        label.textColor = .black
        return label
    }()

    private let avtarLabel4: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 105, y: 404, width: 209, height: 20)
        label.text = "Tom Johnson"
        label.textColor = .black
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    private let avtarLabel3: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 103, y: 309, width: 209, height: 20)
        label.text = "Alex Smith"
        label.textColor = .black
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    private let avtarLabel2: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 103, y: 214, width: 209, height: 20)
        label.text = "Verona Tusk"
        label.textColor = .black
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    private let avatarLabel1: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 102, y: 119, width: 209, height: 20)
        label.text = "Helena Link"
        label.textColor = .black
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    private let avatarImage4: UIImageView = {
        let avatar = UIImageView()
        avatar.frame = CGRect(x: 22, y: 390, width: 75, height: 75)
        avatar.image = UIImage(named: "avatar4")
        return avatar
    }()

    private let avatarImage3: UIImageView = {
        let avatar = UIImageView()
        avatar.frame = CGRect(x: 20, y: 295, width: 75, height: 75)
        avatar.image = UIImage(named: "avatar3")
        return avatar
    }()

    private let avatarImage2: UIImageView = {
        let avatar = UIImageView()
        avatar.frame = CGRect(x: 20, y: 200, width: 75, height: 75)
        avatar.image = UIImage(named: "avatar2")
        return avatar
    }()

    private let avatarImage: UIImageView = {
        let avatar = UIImageView()
        avatar.frame = CGRect(x: 19, y: 105, width: 75, height: 75)
        avatar.image = UIImage(named: "avatar1")
        return avatar
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Birthday Reminder"
        setupUI()
    }

    private func setupBarItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image:
            UIImage(systemName: "plus"),
            style: .done,
            target: self,
            action: #selector(setupBar)
        )
    }

    @objc private func setupBar() {
        navigationController?.present(AddViewController(), animated: true)
    }

    private func setupUI() {
        view.addSubview(avatarImage)
        view.addSubview(avatarImage2)
        view.addSubview(avatarImage3)
        view.addSubview(avatarImage4)
        view.addSubview(avatarLabel1)
        view.addSubview(avtarLabel2)
        view.addSubview(avtarLabel3)
        view.addSubview(avtarLabel4)
        view.addSubview(bdayLabel)
        view.addSubview(bdayLabel2)
        view.addSubview(bdayLabel3)
        view.addSubview(bdayLabel4)
        view.addSubview(imageCake)
        view.addSubview(daysOfSecond)
        view.addSubview(daysOfThird)
        view.addSubview(daysOfLast)
        setupBarItem()
    }
}
