//
//  BeerDetailViewController.swift
//  GarupaTest
//
//  Created by Matheus Weber on 24/04/23.
//

import UIKit

protocol BeerDetailViewing: UIView {
    var delegate: BeerDetailViewDelegate? { get set }
    func setup(name: String, tagline: String, beerImage: UIImage?, firstBrewed: String, description: String, brewerTips: String, contributedBy: String, beerExtraInfoTableViewHeight: CGFloat, ingredientsTableViewHeight: CGFloat, foodPairingTableViewHeight: CGFloat)
}

protocol BeerDetailViewModelling: ViewModelling, BeerDetailViewDelegate {
    var beerModel: BeerModel { get set }
    var beerExtraInfoTableViewHeight: Int { get set }
    var ingredientsTableViewHeight: Int { get set }
    var foodPairingTableViewHeight: Int { get set }
    var delegate: BeerDetailPresenterDelegate? { get set }
    
    func start()
}

class BeerDetailViewController: UIViewController {
    private var viewModel: BeerDetailViewModelling?
    private let mainView: BeerDetailViewing?
    
    init(viewModel: BeerDetailViewModelling, mainView: BeerDetailViewing = BeerDetailView()) {
        self.viewModel = viewModel
        self.mainView = mainView
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
        viewModel?.delegate = self
        viewModel?.start()
    }
}

extension BeerDetailViewController: BeerDetailPresenterDelegate {
    func fillUI() {
        guard let viewModel = viewModel else {
            return
        }
        mainView?.setup(name: viewModel.beerModel.name,
                        tagline: viewModel.beerModel.tagline,
                        beerImage: viewModel.beerModel.downloadedImage,
                        firstBrewed: viewModel.beerModel.firstBrewed,
                        description: viewModel.beerModel.description,
                        brewerTips: viewModel.beerModel.brewersTips,
                        contributedBy: viewModel.beerModel.contributedBy,
                        beerExtraInfoTableViewHeight: CGFloat(viewModel.beerExtraInfoTableViewHeight),
                        ingredientsTableViewHeight: CGFloat(viewModel.ingredientsTableViewHeight),
                        foodPairingTableViewHeight: CGFloat(viewModel.foodPairingTableViewHeight))
    }
}
