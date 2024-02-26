// AcnhorViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///// ViewController
class AcnhorViewController: UIViewController {
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Properties

    private let yellowSquare: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()

    private let greenSquare: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()

    private let redSquare: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()

    private let blackRectangle: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()

    // MARK: - Private Methods

    private func setupUI() {
        view.addSubview(blackRectangle)
        view.addSubview(yellowSquare)
        view.addSubview(greenSquare)
        view.addSubview(redSquare)
        setupBlackRectangle()
        setupYellowSquare()
        setupGreenSquare()
        setupRedSquare()
    }

    private func setupYellowSquare() {
        yellowSquare.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowSquare.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        yellowSquare.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 4).isActive = true
        yellowSquare.widthAnchor.constraint(equalTo: yellowSquare.heightAnchor).isActive = true
    }

    private func setupGreenSquare() {
        greenSquare.leadingAnchor.constraint(equalTo: yellowSquare.leadingAnchor).isActive = true
        greenSquare.trailingAnchor.constraint(equalTo: yellowSquare.trailingAnchor).isActive = true
        greenSquare.heightAnchor.constraint(equalTo: yellowSquare.heightAnchor).isActive = true
        greenSquare.topAnchor.constraint(equalTo: yellowSquare.bottomAnchor, constant: 10).isActive = true
    }

    private func setupRedSquare() {
        redSquare.bottomAnchor.constraint(equalTo: yellowSquare.topAnchor, constant: -10).isActive = true
        redSquare.leadingAnchor.constraint(equalTo: yellowSquare.leadingAnchor).isActive = true
        redSquare.trailingAnchor.constraint(equalTo: yellowSquare.trailingAnchor).isActive = true
        redSquare.heightAnchor.constraint(equalTo: yellowSquare.heightAnchor).isActive = true
    }

    private func setupBlackRectangle() {
        blackRectangle.leadingAnchor.constraint(equalTo: redSquare.leadingAnchor, constant: -10).isActive = true
        blackRectangle.trailingAnchor.constraint(equalTo: redSquare.trailingAnchor, constant: 10).isActive = true
        blackRectangle.topAnchor.constraint(equalTo: redSquare.topAnchor, constant: -10).isActive = true
        blackRectangle.bottomAnchor.constraint(equalTo: greenSquare.bottomAnchor, constant: 10).isActive = true
    }
}
