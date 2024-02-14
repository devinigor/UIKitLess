// AgePicker.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Данный класс будет устанавливать пикер для возроста юзера
final class AgePicker: UIPickerView {
    var ageInformation: String = ""

    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: - Private Methods

    private func setup() {
        dataSource = self
        delegate = self
    }
}
//MARK: - Extantions
// расширение определяет количество элементов и строк в пикере и сохраняет выбранное значение
extension AgePicker: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        100
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ageInformation = "\(row)"
    }
}

// расширение определяет, какой текст будет отображаться в каждой строке
extension AgePicker: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "\(row)"
    }
}
