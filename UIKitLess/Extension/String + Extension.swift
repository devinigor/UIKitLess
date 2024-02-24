//
//  String + Extension.swift
//  UIKitLess
//
//  Created by Игорь Девин on 24.02.2024.
//

import UIKit

 /// Расширенние для валлидации строки
extension String {
    /// Расширение для изменение шрифта
    /// - Parameters:
    /// - font: шрифт который надо использовать
    /// - ofSubstring: иизменяемое значение
    /// - Returns: модифицированнуюю строку
    func setFont(_ font: UIFont, ofSubstring substring: String) -> NSMutableAttributedString {
        let range = (self as NSString).range(of: substring)
        let attributedString = NSMutableAttributedString(string: self)
    }
}
