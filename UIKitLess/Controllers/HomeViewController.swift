// HomeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// stories
struct Stories {
    let avatarName: String
    let loginName: String
}

/// Структура для поста
struct Post {
    let avatarImageName: String
    let login: String
    let postImages: [String]
    let likesCount: String
    let lastComment: String
    let isLikePressed: Bool
}

/// RMLink
struct RMLinkStorage {
    let stories: [Stories] = [
        .init(avatarName: "podruga", loginName: "Ваша история"),
        .init(avatarName: "lavanda", loginName: "lavanda123"),
        .init(avatarName: "lavanda", loginName: "lavanda123"),
        .init(avatarName: "lavanda", loginName: "lavanda123"),
        .init(avatarName: "lavanda", loginName: "lavanda123")
    ]

    let posts: [Post] = [.init(
        avatarImageName: "avatarUserDag",
        login: "tur_v_dagestan",
        postImages: ["hills", "secondHills"],
        likesCount: "201",
        lastComment: "Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!",
        isLikePressed: false
    )]

    let recomend: [Recomendation] = [
        .init(avatar: "crimea", login: "сrimea_082", isSubscribed: false),
        .init(avatar: "mary", login: "mary_pol", isSubscribed: false)
    ]
    let cellPicture: [NotificationCellPicture] = [
        .init(
            image: "lavanda",
            userLogin: "Lavanda123",
            postDiscription:
            "понравился ваш комментарий: Очень красиво!",
            dateComent: "12ч",
            postPicture: "sea"
        ),
        .init(
            image: "lavanda",
            userLogin: "Lavanda123",
            postDiscription: "lavanda123 упомянул(-а) вас в комментарии: @rm Спасибо!",
            dateComent: "12ч.",
            postPicture: "sea"
        )
    ]
    let cellButton: [NotificationCellButton] = [
        .init(
            avatar: "lavanda",
            userLogin: "Lavanda123",
            postDiscription:
            "понравился ваш комментарий: Это где?",
            dateComent: "3д.", isPressed: true
        ),
        .init(
            avatar: "misha",
            userLogin: "12miho",
            postDiscription:
            "появился(-ась) в RMLink. Вы можете быть знакомы",

            dateComent: "3д.",
            isPressed: false
        ),
        .init(
            avatar: "lavanda",
            userLogin: "Lavanda123",
            postDiscription:
            "подписался(-ась) на ваши новости",
            dateComent: "7д.",
            isPressed: true
        )
    ]
}

/// Класс для отображения ленты
class HomeViewController: UIViewController {
    // MARK: - Constants

    enum Content {
        case stories
        case firstPost
        case recomendations
        case posts
    }

    // MARK: - Private Properties

    let rmLinkStorage = RMLinkStorage()
    private let lineSections: [Content] = [.stories, .firstPost, .recomendations, .posts]
    private let tableView: UITableView = .init()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func configureNavigationItems() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: UIImageView(image: .iconMessage))
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIImageView(image: .rmLink))
    }

    private func setupUI() {
        configureNavigationItems()
        setupTableView()
        tableView.register(PostsViewCell.self, forCellReuseIdentifier: PostsViewCell.Constants.identifierr)
        tableView.register(StoriesCell.self, forCellReuseIdentifier: StoriesCell.Constants.identifier)
        tableView.register(FirstPostCell.self, forCellReuseIdentifier: FirstPostCell.Constants.identifier)
        tableView.register(
            RecomendationViewCell.self,
            forCellReuseIdentifier: RecomendationViewCell.Constants.identefire
        )
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        lineSections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cells = lineSections[section]
        switch cells {
        case .stories, .firstPost, .recomendations:
            return 1
        case .posts:
            return rmLinkStorage.posts.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cells = lineSections[indexPath.section]
        switch cells {
        case .stories:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: StoriesCell.Constants.identifier,
                for: indexPath
            ) as? StoriesCell else { return UITableViewCell() }
            cell.setupStoriesCell(stories: rmLinkStorage.stories)
            return cell
        case .firstPost:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: FirstPostCell.Constants.identifier,
                for: indexPath
            ) as? FirstPostCell else { return UITableViewCell() }
            cell.setupCell(post: rmLinkStorage.posts[indexPath.row])
            return cell
        case .recomendations:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: RecomendationViewCell.Constants.identefire,
                for: indexPath
            ) as? RecomendationViewCell else { return UITableViewCell() }
            cell.confiUI(recomendatios: rmLinkStorage.recomend)
            return cell
        case .posts:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: PostsViewCell.Constants.identifierr,
                for: indexPath
            ) as? PostsViewCell else { return UITableViewCell() }
            cell.setupCell(post: rmLinkStorage.posts[indexPath.row])
            return cell
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellType = lineSections[indexPath.section]
        switch cellType {
        case .stories:
            return 100
        case .firstPost:
            return 430
        case .recomendations:
            return 400
        case .posts:
            return 450
        }
    }
}
