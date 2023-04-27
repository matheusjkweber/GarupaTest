//
//  BeerDetailViewControllerTests.swift
//  GarupaTestTests
//
//  Created by Matheus Weber on 27/04/23.
//

@testable import GarupaTest
import Foundation
import XCTest

final class BeerDetailViewControllerTests: XCTestCase {
    private var viewController: BeerDetailViewController!
    private var viewModel: BeerDetailViewModelMock!
    private var viewMock = BeerDetailViewMock()
    
    override func setUp() {
        super.setUp()
        
        viewModel = BeerDetailViewModelMock(beerModel: generateBeerModel())
        viewController = BeerDetailViewController(viewModel: viewModel, mainView: viewMock)
    }
    
    func test_viewDidLoad_shouldCallViewModelStart() {
        viewController.viewDidLoad()
        
        XCTAssertEqual(viewModel.startCallCount, 1)
    }
    
    func test_fillUI_shouldCallViewSetup() {
        viewController.fillUI()
        
        XCTAssertEqual(viewMock.setupCallCount, 1)
    }
    
    private func generateBeerModel() -> BeerModel {
        BeerModel(id: 1, name: "Test", tagline: "", firstBrewed: "", description: "", imageUrl: "", abv: 0.0, ibu: 0.0, targetFG: 0.0, targetOG: 0.0, ebc: 0.0, srm: 0.0, ph: 0.0, attenuationLevel: 0.0, volume: VolumeModel(value: 0, unit: UnitType.kilograms), boilVolume: VolumeModel(value: 0, unit: UnitType.kilograms), method: nil, ingredients: IngredientsModel(malt: [MaltModel(name: "Test", amount: AmountModel(value: 1.0, unit: .kilograms))], hops: [], yeast: ""), foodPairing: [String](repeating: "Test", count: 20), brewerTips: "", contributedBy: "")
    }
}
