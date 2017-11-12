//
//  RightToLeftViewController.swift
//  Example
//
//  Created by Adrian Bobrowski on 11.09.2017.
//
//

import UIKit

final class RightToLeftViewController: UIViewController {

    // MARK: - @IBOutlet

    @IBOutlet
    private weak var `switch`: UISwitch!

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.switch.isOn = UIView.appearance().semanticContentAttribute == .forceRightToLeft
    }

    // MARK: - @IBAction

    @IBAction
    private func onToggled(_ sender: UISwitch) {
        let semantic: UISemanticContentAttribute = sender.isOn ? .forceRightToLeft : .forceLeftToRight

        UIView.appearance().semanticContentAttribute = semantic

        if let navigationController = self.navigationController?.storyboard?.instantiateInitialViewController() as? UINavigationController {
            navigationController.navigationBar.semanticContentAttribute = semantic
            navigationController.setViewControllers(
                self.navigationController?.viewControllers.map {
                    if let storyboard = $0.storyboard, let identifier = $0.restorationIdentifier {
                        return storyboard.instantiateViewController(withIdentifier: identifier)
                    }
                    return $0
                } ?? [],
                animated: false
            )
            UIApplication.shared.keyWindow?.rootViewController = navigationController
        }
    }
}
