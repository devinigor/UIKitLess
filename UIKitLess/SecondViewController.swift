// SecondViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// SecondVC
final class SecondViewController: UIViewController {
    @IBAction func getBildButton(_ sender: Any) {
        let alert = UIAlertController(title: "Выставить счет?", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Чек", style: .default) { _ in
            self.performSegue(withIdentifier: "third", sender: nil)
        }
        alert.addAction(ok)
        alert.addAction(.init(title: "Отмена", style: .cancel))
        alert.preferredAction = ok
        present(alert, animated: true)
    }
}
