//
//  Mockables.swift
//  GarupaTestTests
//
//  Created by Matheus Weber on 27/04/23.
//

@testable import GarupaTest
import Foundation
import UIKit

class BeerDetailPresenterDelegateMock: BeerDetailPresenterDelegate {
    var fillUICallCount = 0
    var fillUIHandler: (() -> ())?
    
    func fillUI() {
        fillUICallCount += 1
        if let fillUIHandler = fillUIHandler {
            fillUIHandler()
        }
    }
}

class BeerDetailViewModelMock: BeerDetailViewModelling {
    var state: GarupaTest.ViewState<GarupaTest.ButtonAction> = .success
    var beerModel: BeerModel
    var beerExtraInfoTableViewHeight: Int = 0
    var ingredientsTableViewHeight: Int = 0
    var foodPairingTableViewHeight: Int = 0
    var delegate: BeerDetailPresenterDelegate?
    
    var startCallCount: Int = 0
    var startHandler: (() -> ())?
    var configureTableViewCallCount: Int = 0
    var configureTableViewHandler: ((UITableView, BeerDetailTableViewType) -> ())?
    
    init(beerModel: BeerModel) {
        self.beerModel = beerModel
    }
                           
    func start() {
        startCallCount += 1
        
        if let startHandler = startHandler {
            startHandler()
        }
    }
    
    func configureTableView(for tableView: UITableView, withType type: GarupaTest.BeerDetailTableViewType) {
        configureTableViewCallCount += 1
        
        if let configureTableViewHandler = configureTableViewHandler {
            configureTableViewHandler(tableView, type)
        }
    }
}

class BeerDetailViewMock: UIView, BeerDetailViewing {
    var delegate: BeerDetailViewDelegate?
    var setupCallCount: Int = 0
    
    func setup(name: String, tagline: String, beerImage: UIImage?, firstBrewed: String, description: String, brewerTips: String, contributedBy: String, beerExtraInfoTableViewHeight: CGFloat, ingredientsTableViewHeight: CGFloat, foodPairingTableViewHeight: CGFloat) {
        setupCallCount += 1
    }
}

class ListBeersServiceMock: ListBeersServicing {
    var getBeersCallCount: Int = 0
    var getImageCallCount: Int = 0
    var getBeersHandler: ((Int, Int, ([BeerModel]) -> (), (NetworkResponse) -> ()) -> ())?
    var getImageHandler: ((URL, (Data) -> (), (NetworkResponse) -> ()) -> ())?
    
    var manager: NetworkManager
    
    init() {
        self.manager = NetworkManagerMock<Any>()
    }
    
    func getBeers(page: Int,
                  limit: Int,
                  success: @escaping (_ beersModel: [BeerModel]) -> (),
                  failure: @escaping (_ error: NetworkResponse) -> ()) {
        getBeersCallCount += 1
        if let getBeersHandler = getBeersHandler {
            getBeersHandler(page, limit, success, failure)
        }
    }
    
    func getImage(imageURL: URL,
                  success: @escaping (_ imageData: Data) -> (),
                  failure: @escaping (_ error: NetworkResponse) -> ()) {
        getImageCallCount += 1
        if let getImageHandler = getImageHandler {
            getImageHandler(imageURL, success, failure)
        }
    }
}

class ListBeersPresenterDelegateMock: ListBeersPresenterDelegate {
    var presentBeerCallCount: Int = 0
    var updateStateCallCount: Int = 0
    var presentToastCallCount: Int = 0
    
    var presentBeerDetailHander: ((BeerDetailViewModel) -> ())?
    var updateStateHandler: ((ViewState<ButtonAction>) -> ())?
    var presentToastHandler: ((String) -> ())?
    
    func presentBeerDetail(withViewModel viewModel: BeerDetailViewModel) {
        presentBeerCallCount += 1
        
        if let presentBeerDetailHander = presentBeerDetailHander {
            presentBeerDetailHander(viewModel)
        }
    }
    
    func updateState(state: ViewState<ButtonAction>) {
        updateStateCallCount += 1
        
        if let updateStateHandler = updateStateHandler {
            updateStateHandler(state)
        }
    }
    
    func presentToastWith(message: String) {
        presentToastCallCount += 1
        
        if let presentToastHandler = presentToastHandler {
            presentToastHandler(message)
        }
    }
}
