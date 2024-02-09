// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class ViewController: UIViewController {
    // MARK: Constants

    let violetRectangle: UIImageView = {
        let rectangle = UIImageView()
        rectangle.frame = CGRect(x: 95, y: 235, width: 150, height: 150)
        rectangle.image = UIImage(named: "VioletRectangle")
        return rectangle
    }()

    let greenRectangle: UIImageView = {
        let rectangle = UIImageView()
        rectangle.frame = CGRect(x: 152, y: 507, width: 200, height: 200)
        rectangle.image = UIImage(named: "greenRectangle")
        return rectangle
    }()

    var alertTextFieldLabel: UILabel = {
        let alertLabel = UILabel()
        alertLabel.frame = CGRect(x: 40, y: 45, width: 375, height: 82)
        alertLabel.backgroundColor = UIColor(named: "b")
        alertLabel.text = "Приветствую, \n"
        alertLabel.font = UIFont(name: "Verdana", size: 30)
        alertLabel.numberOfLines = 2
        alertLabel.textColor = .white
        alertLabel.isHidden = true
        return alertLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAlert(title: "Пожалуйста,\n представьтесь", message: nil, style: .alert)
    }

    private func setupView() {
        setupImageView()
        view.addSubview(violetRectangle)
        view.addSubview(greenRectangle)
        view.addSubview(alertTextFieldLabel)
        view.addSubview(guessNumberButton)
        view.addSubview(calculateButton)
    }

    private lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.setTitle("Калькулятор", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(actionCalculateButton), for: .touchUpInside)
        button.titleLabel?.numberOfLines = 0
        button.frame = CGRect(x: 172, y: 550, width: 150, height: 100)
        return button

    }()

    private lazy var guessNumberButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.setTitle("Угадай число", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(actionGuessButton), for: .touchUpInside)
        button.frame = CGRect(x: 120, y: 265, width: 100, height: 100)
        button.titleLabel?.numberOfLines = 0
        return button
    }()

    private func setupImageView() {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 375, height: 812)
        imageView.center = view.center
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.image = UIImage(named: "Background.png")
    }

    private func showAlert(title: String, message: String?, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        alertController.addTextField { textField in
            textField.placeholder = "Введите ваше имя"
        }
        let action = UIAlertAction(title: "Готово", style: .default) { _ in
            _ = alertController.textFields?.first
            self.alertTextFieldLabel.text? += alertController.textFields?.first?.text ?? "nil"
            self.alertTextFieldLabel.text? += "!"
            self.alertTextFieldLabel.isHidden = false
        }
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }

    @objc private func actionGuessButton() {
        let alertController = UIAlertController(title: "Угадай число от 1 до 10", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Введите число"
        }
        let actionCancel = UIAlertAction(title: "Cancel", style: .default)
        let actionOk = UIAlertAction(title: "Ok", style: .default) { _ in
            let number = Int(alertController.textFields?.first?.text ?? "nil")
            let arrayNumber = Int.random(in: 0 ... 9)
            if number == arrayNumber {
                let alert = UIAlertController(title: "Поздравляю", message: "Вы угадали", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
                self.present(alert, animated: true)
            } else {
                let alert = UIAlertController(title: "Упс!", message: "Это неверный ответ", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
                self.present(alert, animated: true)
            }
        }
        alertController.addAction(actionOk)
        alertController.addAction(actionCancel)
        alertController.preferredAction = actionOk
        present(alertController, animated: true, completion: nil)
    }

    @objc private func actionCalculateButton() {
        let alertController = UIAlertController(title: "Введите ваши числа", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Число 1"
        }
        alertController.addTextField { textField in
            textField.placeholder = "Число 2"
        }
        let action = UIAlertAction(title: "Сложить", style: .default) { _ in
            let firstNumber = Int(alertController.textFields?[0].text ?? "0") ?? 0
            let secondNumber = Int(alertController.textFields?[1].text ?? "0") ?? 0
            let result = (firstNumber + secondNumber)
            let alert = UIAlertController(title: "Ваш результат", message: String(result), preferredStyle: .alert)
            let actionCancel = UIAlertAction(title: "Cancel", style: .default)
            let actionOk = UIAlertAction(title: "Ok", style: .default)
            self.present(alert, animated: true, completion: nil)
            alert.addAction(actionCancel)
            alert.addAction(actionOk)
            alert.preferredAction = actionOk
        }
        present(alertController, animated: true, completion: nil)
        alertController.addAction(action)
    }
}
