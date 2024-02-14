// Gender.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// class for chosen gender
final class Gender: UIPickerView {
    //MARK: - Constants
    private let genders: [String] = ["Male", "Female"]
    //MARK: - Variables
    var result = ""

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        dataSource = self
        delegate = self
    }
}
//MARK: - Extantions
//расширение для отображения пикера, что бы вставить в текстфилд
extension Gender: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        genders.count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        result = genders[row]
    }
}
//расширение для отображения пикера, что бы вставить в текстфилд
extension Gender: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        genders[row]
    }
}
