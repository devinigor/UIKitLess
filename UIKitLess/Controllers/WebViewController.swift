//
//  WebViewController.swift
//  UIKitLess
//
//  Created by Игорь Девин on 24.02.2024.
//


import UIKit
import WebKit

/// Экран сайта
final class WebViewController: UIViewController, WKNavigationDelegate {
    // MARK: - Public Properties

        var url = ""

    // MARK: - Private Properties

    private let webView = WKWebView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Private Methods

    private func createRequest(_ url: String) {
        webView.frame = view.frame
        if let url = URL(string: url) {
            webView.load(URLRequest(url: url))
        }
        view.addSubview(webView)
    }

    private func configureUI() {
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        createRequest(url)
        navigationController?.navigationBar.barTintColor = .white
        view.backgroundColor = .white
    }
}
