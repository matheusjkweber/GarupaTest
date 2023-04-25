//
//  BeerDetailViewController.swift
//  GarupaTest
//
//  Created by Matheus Weber on 24/04/23.
//

import UIKit

protocol BeerDetailViewing: UIView {
    var delegate: BeerDetailViewDelegate? { get set }
    func setup()
}

class BeerDetailViewController: UIViewController {
    private var viewModel: BeerDetailViewModel?
    private let mainView: BeerDetailViewing?
    
    init(viewModel: BeerDetailViewModel) {
        self.viewModel = viewModel
        self.mainView = BeerDetailView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        linkViewModel()
    }
    
    override func loadView() {
        guard let mainView = mainView else {
            return
        }
        view = mainView
        view.frame = CGRect(x: 0, y: 0, width: ScreenSize.width, height: ScreenSize.height)
    }
    
    private func linkViewModel() {
        mainView?.delegate = viewModel
        mainView?.setup()
    }
}
