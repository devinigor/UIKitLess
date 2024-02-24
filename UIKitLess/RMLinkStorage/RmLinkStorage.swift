//
//  RmLinkStorage.swift
//  UIKitLess
//
//  Created by Игорь Девин on 24.02.2024.
//

import Foundation

/// Модель хранения контента
struct RmLinkStorage {


     var user: User = .init(
         avatarName: "avatar",
         login: "Мария Иванова",
         specialist: "Iqos Developer",
         iconSite: "",
         webResurse: "https://www.spacex.com/vehicles/starship/",
         countPost: "67",
         countSubscribers: "1056",
         countSubscriptions: "435"
     )

     var userStories: [Stories] = [
         .init(avatarName: "engine", isWatched: true, login: "Запуск"),
         .init(avatarName: "moon", isWatched: false, login: "Луна"),
         .init(avatarName: "image-3", isWatched: false, login: "Космона..."),
         .init(avatarName: "image-4", isWatched: true, login: "Космос"),
         .init(avatarName: "image", isWatched: true, login: "Полет")
     ]

     var publicationPhoto: [String] = [
         "pulication-1",
         "pulication-2",
         "pulication-3",
         "pulication-4",
         "pulication-3",
         "pulication-2",
         "pulication-4",
         "pulication-2",
         "pulication-3",
         "pulication-1"
     ]
 }
