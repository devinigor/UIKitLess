// AddViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// В этом классе будем добавлять нового человека в календарь ДР
final class AddViewController: UIViewController {
    // MARK: - Constants

    private let picker = UIDatePicker()
    var gender = Gender()
    var age = AgePicker()

    private let changePhoto: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 125, y: 267, width: 125, height: 20)
        button.setTitle("Change photo", for: .normal)
        button.backgroundColor = .blue
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 16)
        button.titleColor(for: .normal)
        return button
    }()

    private let telegramTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 17, y: 634, width: 250, height: 17)
        textField.placeholder = "Typing Telegram"
        textField.font = UIFont(name: "Verdana", size: 14)
        return textField
    }()

    private let telegramLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 605, width: 175, height: 19)
        label.text = "Telegram"
        label.textColor = .black
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    private let genderTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 17, y: 559, width: 250, height: 17)
        textField.placeholder = "Indicate Gender"
        textField.font = UIFont(name: "Verdana", size: 14)
        let picker = UIPickerView()

        return textField
    }()

    private let genderLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 530, width: 175, height: 19)
        label.text = "Gender"
        label.textColor = .black
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    private let ageTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 17, y: 486, width: 250, height: 17)
        textField.placeholder = "Typing age"
        textField.font = UIFont(name: "Verdana", size: 14)
        return textField
    }()

    private let ageLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 457, width: 175, height: 19)
        label.text = "Age"
        label.textColor = .black
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    private let textFieldBday: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 17, y: 411, width: 250, height: 17)
        textField.placeholder = "Typing Date of Birth"
        textField.font = UIFont(name: "Verdana", size: 14)
        return textField
    }()

    private let birthdayLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 382, width: 175, height: 19)
        label.text = "Birthday"
        label.textColor = .black
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    private let textFieldName: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 17, y: 336, width: 250, height: 17)
        textField.placeholder = "Typing Name Surname"
        textField.font = UIFont(name: "Verdana", size: 14)
        return textField
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 307, width: 175, height: 19)
        label.text = "Name Surname"
        label.textColor = .black
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    private let imageUser: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "user")
        image.frame = CGRect(x: 134, y: 125, width: 125, height: 125)
        return image
    }()

    private func getDataPicker() {
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        picker.backgroundColor = .white
        textFieldBday.inputView = picker
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let barButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(getDoneButton))
        let flagSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([flagSpace, barButton], animated: true)
        textFieldBday.inputAccessoryView = toolBar
    }

    private func getAgePicker() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(setAgePicker))
        let flagSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        ageTextField.inputView = age
        toolBar.setItems([flagSpace, button], animated: true)
        ageTextField.inputAccessoryView = toolBar
    }

    private func getGenderPicker() {
        genderTextField.inputView = gender
        let genderToolBar = UIToolbar()
        genderToolBar.sizeToFit()
        let flagSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let genderButton = UIBarButtonItem(
            title: "Done",
            style:
            .done,
            target: self,
            action: #selector(setGender)
        )
        genderToolBar.setItems([flagSpace, genderButton], animated: true)
        genderTextField.inputAccessoryView = genderToolBar
    }

    private func setupUI() {
        telegramTextField.delegate = self
        telegramTextField.addTarget(self, action: #selector(textFieldDidBeginEditing), for: .touchUpInside)
        view.addSubview(imageUser)
        view.addSubview(nameLabel)
        view.addSubview(textFieldName)
        view.addSubview(birthdayLabel)
        view.addSubview(textFieldBday)
        view.addSubview(ageLabel)
        view.addSubview(ageTextField)
        view.addSubview(genderLabel)
        view.addSubview(genderTextField)
        view.addSubview(telegramLabel)
        view.addSubview(telegramTextField)
        view.addSubview(changePhoto)
        getGenderPicker()
        getDataPicker()
        getAgePicker()
    }

    var convertorData = ""

    @objc private func setAgePicker() {
        ageTextField.resignFirstResponder()
        ageTextField.text = age.ageInformation
    }

    @objc private func setGender() {
        genderTextField.text = gender.result
        genderTextField.resignFirstResponder()
    }

    @objc private func getDoneButton() {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd.MM.yyyy"
        let dateFormaterTwo = DateFormatter()
        dateFormaterTwo.dateFormat = "dd.MM"
        convertorData = dateFormaterTwo.string(from: picker.date)
        textFieldBday.text = dateFormater.string(from: picker.date)
        textFieldBday.resignFirstResponder()
    }

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
}

// MARK: - Extansion

extension AddViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let alert = UIAlertController(title: "Write your telegram", message: nil, preferredStyle: .alert)
        alert.addTextField { text in
            text.placeholder = "Typing Telegram"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        let actionOk = UIAlertAction(title: "Ok", style: .default) { _ in
            if let enteredText = alert.textFields?.first {
                self.telegramTextField.text = "\(enteredText.text ?? "nil")"
            }
        }
        alert.addAction(actionOk)
        present(alert, animated: true)
    }
}
