//
//  ListBeersViewController.swift
//  GarupaTest
//
//  Created by Matheus Weber on 23/04/23.
//

import UIKit

protocol ListBeersPresenterDelegate: AnyObject {
    func presentBeerDetail(withViewModel: BeerDetailViewModel)
}

protocol ListBeersViewing: UIView {
    var delegate: ListBeersViewDelegate? { get set }
    func setup()
}

class ListBeersViewController: UIViewController {
    private var viewModel: ListBeersViewModel?
    private let mainView: ListBeersViewing?
    
    init(viewModel: ListBeersViewModel) {
        self.viewModel = viewModel
        self.mainView = ListBeersView()
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
        viewModel?.delegate = self
        mainView?.delegate = viewModel
        mainView?.setup()
    }
}

extension ListBeersViewController: ListBeersPresenterDelegate {
    func presentBeerDetail(withViewModel viewModel: BeerDetailViewModel) {
        self.navigationController?.pushViewController(BeerDetailViewController(viewModel: viewModel), animated: true)
    }
}
