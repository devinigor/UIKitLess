// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью контроллер отвечающий за управление единственным экраном.
final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Visual components

    private let greenRectangle: UIImageView = {
        let rectangle = UIImageView()
        rectangle.frame = CGRect(x: 20, y: 406, width: 335, height: 44)
        rectangle.image = UIImage(named: "greenRectangle")
        return rectangle
    }()

    private let staticLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 282, width: 275, height: 57)
        label.text = "А вот что получится, если читать справо на лево"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.numberOfLines = 0
        return label
    }()

    private let reverseWordLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 57, y: 339, width: 275, height: 57)
        label.font = .monospacedDigitSystemFont(ofSize: 16, weight: .heavy)
        label.textAlignment = .center
        label.textColor = .systemGray4
        label.text = ""
        return label
    }()

    private var wordLabel: UILabel = {
        let label = UILabel()
        label.text = "Вы ввели слово"
        label.textColor = .black
        label.frame = CGRect(x: 50, y: 106, width: 275, height: 57)
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    private var wordLabelTextDefault: UILabel = {
        let label = UILabel()
        label.text = "Вы ввели слово"
        label.textColor = .black
        label.frame = CGRect(x: 50, y: 106, width: 275, height: 57)
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    private var enteredWordLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 163, width: 275, height: 57)
        label.font = .monospacedDigitSystemFont(ofSize: 16, weight: .heavy)
        label.textAlignment = .center
        label.textColor = .systemGray4
        label.text = ""
        return label
    }()

    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 406, width: 335, height: 44)
        button.setTitle("Начать", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(actionStartButton), for: .touchUpInside)
        return button
    }()

    // MARK: - Private methods

    private func setupView() {
        view.addSubview(greenRectangle)
        view.addSubview(startButton)
    }

    @objc private func actionStartButton() {
        let alertController = UIAlertController(title: "Введите ваше слово", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Введите слово"
        }
        let actionCancel = UIAlertAction(title: "Cancel", style: .default)
        let actionOk = UIAlertAction(title: "Ok", style: .default) { _ in
            self.startButton.frame = CGRect(x: 20, y: 598, width: 335, height: 44)
            self.greenRectangle.frame = CGRect(x: 20, y: 598, width: 335, height: 44)
            self.view.addSubview(self.wordLabel)
            alertController.addTextField()
            _ = alertController.textFields?.first
            self.enteredWordLabel.text? += alertController.textFields?.first?.text ?? "nil"
            guard let word = alertController.textFields?.first?.text else { return }
            let revesedWord = String(word.reversed())
            self.reverseWordLabel.text = revesedWord.capitalized
            self.view.addSubview(self.enteredWordLabel)
            self.view.addSubview(self.staticLabel)
            self.view.addSubview(self.reverseWordLabel)
        }
        alertController.addAction(actionOk)
        alertController.addAction(actionCancel)
        alertController.preferredAction = actionOk
        present(alertController, animated: true, completion: nil)
    }
}
