//
//  BaseViewController.swift
//  GarupaTest
//
//  Created by Matheus Weber on 25/04/23.
//

import UIKit

class BaseViewController: UIViewController, StateProtocol {
    var errorView = ErrorView()
    var state: ViewState<ButtonAction> {
        didSet {
            setupUIStatus()
        }
    }
    
    init(state: ViewState<ButtonAction>) {
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension BaseViewController {
    func getView() -> UIView {
        return self.view
    }
    
    func getRequestErrorView() -> ErrorView? {
        errorView.setup(errorMessage: "Some error has ocurred, please try again.")
        return errorView
    }
}
