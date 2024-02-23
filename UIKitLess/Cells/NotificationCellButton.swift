// NotificationCellButton.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// модель для ячейки с кнопкой
struct NotificationCellButton {
    /// Шаблон для заполнения ячейки с кнопками
    let avatar: String
    /// Логин пользователя который прокоментировал
    let userLogin: String
    /// Описание коментария
    let postDiscription: String
    /// дата коментария
    let dateComent: String
    /// Подписан или нет
    let isPressed: Bool
}
