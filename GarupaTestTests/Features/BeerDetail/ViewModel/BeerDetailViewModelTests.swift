//
//  BeerDetailViewModelTests.swift
//  GarupaTestTests
//
//  Created by Matheus Weber on 27/04/23.
//

@testable import GarupaTest
import Foundation
import XCTest


final class BeerDetailViewModelTests: XCTestCase {
    private var viewModel: BeerDetailViewModel!
    private var delegate = BeerDetailPresenterDelegateMock()
    
    override func setUp() {
        super.setUp()
        
        viewModel = BeerDetailViewModel(beerModel: generateBeerModel())
        viewModel.delegate = delegate
    }
    
    func test_start_shouldCallDelegateFillUI() {
        viewModel.start()
        
        XCTAssertEqual(delegate.fillUICallCount, 1)
    }
    
    func test_start_shouldSetTableViewHeights() {
        viewModel.start()
        
        XCTAssertEqual(viewModel.beerExtraInfoTableViewHeight, 216)
        XCTAssertEqual(viewModel.ingredientsTableViewHeight, 24)
        XCTAssertEqual(viewModel.foodPairingTableViewHeight, 300)
    }
    
    func test_configureTableViewForExtraInfo_shouldReturnTheCorrectNumberOfRows() {
        let tableView = UITableView()
        viewModel.start()
        viewModel.configureTableView(for: tableView, withType: .extraInfo)
        
        let numberOfRows = tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(numberOfRows, 9)
    }
    
    func test_configureTableViewForIngredients_shouldReturnTheCorrectNumberOfRows() {
        let tableView = UITableView()
        tableView.tag = 1
        viewModel.start()
        viewModel.configureTableView(for: tableView, withType: .ingredients)
        
        let numberOfRows = tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(numberOfRows, 1)
    }
    
    func test_configureTableViewForFoodPairing_shouldReturnTheCorrectNumberOfRows() {
        let tableView = UITableView()
        tableView.tag = 2
        viewModel.start()
        viewModel.configureTableView(for: tableView, withType: .foodPairing)
        
        let numberOfRows = tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(numberOfRows, 20)
    }
    
    func test_tableViewCellForRowAtForExtraInfo_shouldReturnTheCorrectCell() {
        let tableView = UITableView()
        viewModel.start()
        viewModel.configureTableView(for: tableView, withType: .extraInfo)
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssert(cell is BeerExtraInfoTableViewCell)
    }
    
    func test_tableViewCellForRowAtForIngredients_shouldReturnTheCorrectCell() {
        let tableView = UITableView()
        tableView.tag = 1
        viewModel.start()
        viewModel.configureTableView(for: tableView, withType: .ingredients)
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssert(cell is BeerExtraInfoTableViewCell)
    }
    
    func test_tableViewCellForRowAtForFoodPairing_shouldReturnTheCorrectCell() {
        let tableView = UITableView()
        tableView.tag = 2
        viewModel.start()
        viewModel.configureTableView(for: tableView, withType: .foodPairing)
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssert(cell is BeerFoodPairingTableViewCell)
    }
    
    private func generateBeerModel() -> BeerModel {
        BeerModel(id: 1, name: "Test", tagline: "", firstBrewed: "", description: "", imageUrl: "", abv: 0.0, ibu: 0.0, targetFG: 0.0, targetOG: 0.0, ebc: 0.0, srm: 0.0, ph: 0.0, attenuationLevel: 0.0, volume: VolumeModel(value: 0, unit: UnitType.kilograms), boilVolume: VolumeModel(value: 0, unit: UnitType.kilograms), method: nil, ingredients: IngredientsModel(malt: [MaltModel(name: "Test", amount: AmountModel(value: 1.0, unit: .kilograms))], hops: [], yeast: ""), foodPairing: [String](repeating: "Test", count: 20), brewerTips: "", contributedBy: "")
    }
    
    
}
