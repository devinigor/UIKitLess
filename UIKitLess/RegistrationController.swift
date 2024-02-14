// RegistrationController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Первичный контроллер для передачи логина, пароля и перехода на след. VC
final class RegistrationController: UIViewController {
    // MARK: - Constants

    // создаем имагу тортика
    private let cakeImage: UIImageView = {
        let cake = UIImageView()
        cake.frame = CGRect(x: 125, y: 125, width: 125, height: 125)
        cake.image = UIImage(named: "cake")
        return cake
    }()

    // создаем лейбл
    private let birthdayReminderLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 140, y: 250, width: 175, height: 44)
        label.text = "Birthday Reminder"
        label.textColor = UIColor(named: "birthdayColor")
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.numberOfLines = 0
        return label
    }()

    private let signInLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 266, width: 200, height: 100)
        label.text = "Sign in"
        label.textColor = UIColor(named: "labelColor")
        label.font = UIFont(name: "Verdana-Bold", size: 26)
        return label
    }()

    private let emailLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 10, y: 320, width: 200, height: 100)
        label.text = "Email"
        label.textColor = UIColor(named: "labelColor")
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    private let textFieldEmail: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 10, y: 387, width: 175, height: 17)
        textField.placeholder = "Typing email"
        return textField
    }()

    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 10, y: 400, width: 200, height: 100)
        label.text = "Password"
        label.textColor = UIColor(named: "labelColor")
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 10, y: 465, width: 175, height: 17)
        textField.placeholder = "Typing password"
        return textField
    }()

    private let useFaceIdLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 86, y: 544, width: 150, height: 35)
        label.text = "Use FaceID"
        label.textColor = .black
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    private let switchEnter: UISwitch = {
        let enterSwitch = UISwitch()
        enterSwitch.frame = CGRect(x: 200, y: 546, width: 31, height: 31)
        return enterSwitch
    }()

    private let loginButton: UIButton = {
        let loginB = UIButton()
        loginB.frame = CGRect(x: 20, y: 671, width: 335, height: 44)
        loginB.backgroundColor = UIColor(named: "labelColor")
        loginB.setTitle("Login", for: .normal)
        loginB.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 16)
        loginB.layer.cornerRadius = 8
        return loginB
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupButton()
    }

    // добавляем визуал на вью
    private func setupView() {
        view.addSubview(cakeImage)
        view.addSubview(birthdayReminderLabel)
        view.addSubview(signInLabel)
        view.addSubview(emailLabel)
        view.addSubview(textFieldEmail)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(useFaceIdLabel)
        view.addSubview(switchEnter)
        view.addSubview(loginButton)
    }
// метод для кнопки для перехода на следующий VC
    private func setupButton() {
        loginButton.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
    }

    @objc private func nextVC() {
        navigationController?.pushViewController(SecondViewController(), animated: true)
    }
}
