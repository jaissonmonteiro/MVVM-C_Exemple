//
//  BaseViewController.swift
//  MVVM-C_Exemple
//
//  Created by Jaisson Monteiro on 02/04/21.
//

import MaterialComponents.MaterialSnackbar

class BaseViewController: UIViewController {
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - Setup methods
    private func setup() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

//MARK: - Snackbar
extension BaseViewController {
    internal func showSnackBar(message: String) {
        let snackBar = MDCSnackbarMessage(text: message)
        snackBar.text = message
        MDCSnackbarManager.default.snackbarMessageViewBackgroundColor = .gray
        MDCSnackbarManager.default.show(snackBar)
    }
}
