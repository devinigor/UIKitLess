//
//  HistoryViewCell.swift
//  UIKitLess
//
//  Created by Игорь Девин on 24.02.2024.
//

import UIKit

class HistoryViewCell: UITableViewCell {
    
    /// Ячейка историий
    final class HistoryViewCell: UITableViewCell {
        // MARK: - Constants
        
        private enum Constants {
            static let historyCell = "HistoryCell"
            static let youHistoryTltle = "Ваша история"
            static let avatarUser = UIImage.avatar
        }
        
        // MARK: - Visual Components
        
        private lazy var historyScrollView: UIScrollView = {
            let scroll = UIScrollView()
            scroll.contentSize = CGSize(width: frame.size.width * 2, height: frame.size.height)
            scroll.showsHorizontalScrollIndicator = false
            return scroll
        }()
        
        // MARK: - Public Properties
        
        var transmisionImage: ((_: UIImage?) -> ())?
        
        // MARK: - Public Methods
        
        func setupCell(stories: [Stories]) {
            contentView.addSubview(historyScrollView)
            createStories(post: stories)
            makeHistoryScrollViewAnchor()
        }
        // MARK: - Private Properties
        private func createStories(post: Stories, constant: CGFloat) {
            contentView.heightAnchor.constraint(equalToConstant: 90).isActive = true
            let button = UIButton()
            button.setImage(UIImage(named: post.avatarName), for: .normal)
            button.addTarget(self, action: #selector(tapItem), for: .touchUpInside)
            let title = UILabel()
            title.textColor = .gray
            title.font = UIFont.systemFont(ofSize: 8)
            title.sizeToFit()
            title.text = post.login
            historyScrollView.addSubview(button)
            historyScrollView.addSubview(title)
            makeAvatarAnchor(view: button, constant: constant)
            makeYouHistoryLabelAnchor(view: title, from: button)
        }
        private func createStories(post: [Stories]) {
            var count: CGFloat = 12
            for item in post {
                createStories(post: item, constant: count)
                count += 73
            }
        }
        @objc private func tapItem(sender: UIButton) {
            transmisionImage?(sender.currentImage)
        }
    }
}
    // MARK: - Layoyt
    
    extension HistoryViewCell {
        
        private func makeYouHistoryLabelAnchor(view: UIView, from: UIView) {
            view.translatesAutoresizingMaskIntoConstraints = false
            view.topAnchor.constraint(equalTo: from.bottomAnchor, constant: 3).isActive = true
            view.centerXAnchor.constraint(equalTo: from.centerXAnchor).isActive = true
        }
        
        private func makeHistoryScrollViewAnchor() {
            historyScrollView.translatesAutoresizingMaskIntoConstraints = false
            historyScrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
            historyScrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            historyScrollView.widthAnchor.constraint(equalToConstant: 600).isActive = true
            historyScrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        }
        
        private func makeAvatarAnchor(view: UIView, constant: CGFloat) {
            view.translatesAutoresizingMaskIntoConstraints = false
            view.leadingAnchor.constraint(equalTo: historyScrollView.leadingAnchor, constant: constant).isActive = true
            view.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            view.heightAnchor.constraint(equalToConstant: 60).isActive = true
            view.widthAnchor.constraint(equalToConstant: 60).isActive = true
        }
    }
