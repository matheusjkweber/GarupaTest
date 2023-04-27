//
//  ListBeersViewModelTests.swift
//  GarupaTestTests
//
//  Created by Matheus Weber on 27/04/23.
//

@testable import GarupaTest
import Foundation
import XCTest
import UIKit


final class ListBeersViewModelTest: XCTestCase {
    private var viewModel: ListBeersViewModel!
    private var service = ListBeersServiceMock()
    private var presenter = ListBeersPresenterDelegateMock()
    
    override func setUp() {
        super.setUp()
        
        viewModel = ListBeersViewModel(service: service)
        viewModel.delegate = presenter
    }
    
    func test_startWithSuccessAndCollectionViewNumberOfItems_shouldCallServiceGetBeersAndReturnCorrectItemsAndServiceGetImage() {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        var getBeersStarted = false
        let exp = expectation(description: "\(#function)\(#line)")
        service.getBeersHandler = { _, _, success, _ in
            success([self.generateBeerModel()])
            getBeersStarted = true
        }
        viewModel.configureCollectionView(for: collectionView)
        presenter.updateStateHandler = { state in
            if getBeersStarted {
                exp.fulfill()
            }
        }
        
        viewModel.start()
        
        waitForExpectations(timeout: 40, handler: nil)
        XCTAssertEqual(service.getBeersCallCount, 1)
        XCTAssertEqual(viewModel.collectionView(collectionView, numberOfItemsInSection: 0), 1)
        XCTAssertEqual(service.getImageCallCount, 1)
    }
    
    func test_startWithSuccessAndGetImageSuccess_shouldReturnCorrectUrl() {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        var receivedUrl = ""
        let exp = expectation(description: "\(#function)\(#line)")
        service.getBeersHandler = { _, _, success, _ in
            success([self.generateBeerModel()])
        }
        viewModel.configureCollectionView(for: collectionView)
        service.getImageHandler = { url, success, _ in
            receivedUrl = url.absoluteString
            if let data = UIImage(named: Constants.beerTemplate)?.pngData() {
                success(data)
            }
            exp.fulfill()
        }
        
        viewModel.start()
        
        waitForExpectations(timeout: 40, handler: nil)
        XCTAssertEqual(receivedUrl, "http://www.google.com")
    }
    
    func test_startWithSuccessAndCollectionViewCellForItem_shouldCallServiceGetBeersAndReturnCorrectCell() {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        var getBeersStarted = false
        let exp = expectation(description: "\(#function)\(#line)")
        service.getBeersHandler = { _, _, success, _ in
            success([self.generateBeerModel()])
            getBeersStarted = true
        }
        viewModel.configureCollectionView(for: collectionView)
        presenter.updateStateHandler = { state in
            if getBeersStarted {
                exp.fulfill()
            }
        }
        
        viewModel.start()
        
        waitForExpectations(timeout: 40, handler: nil)
        let cell = viewModel.collectionView(collectionView, cellForItemAt: IndexPath(row: 0, section: 0))
        XCTAssert(cell is BeerColectionViewCell)
    }
    
    func test_collectionViewDidSelectItem_shouldCallPresenterPresentBeerDetail() {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        var getBeersStarted = false
        let exp = expectation(description: "\(#function)\(#line)")
        service.getBeersHandler = { _, _, success, _ in
            success([self.generateBeerModel()])
            getBeersStarted = true
        }
        viewModel.configureCollectionView(for: collectionView)
        presenter.updateStateHandler = { state in
            if getBeersStarted {
                exp.fulfill()
            }
        }
        
        viewModel.start()
        
        waitForExpectations(timeout: 40, handler: nil)
        viewModel.collectionView(collectionView, didSelectItemAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(presenter.presentBeerCallCount, 1)
    }
    
    private func generateBeerModel() -> BeerModel {
        BeerModel(id: 1, name: "Test", tagline: "", firstBrewed: "", description: "", imageUrl: "http://www.google.com", abv: 0.0, ibu: 0.0, targetFG: 0.0, targetOG: 0.0, ebc: 0.0, srm: 0.0, ph: 0.0, attenuationLevel: 0.0, volume: VolumeModel(value: 0, unit: UnitType.kilograms), boilVolume: VolumeModel(value: 0, unit: UnitType.kilograms), method: nil, ingredients: IngredientsModel(malt: [MaltModel(name: "Test", amount: AmountModel(value: 1.0, unit: .kilograms))], hops: [], yeast: ""), foodPairing: [String](repeating: "Test", count: 20), brewerTips: "", contributedBy: "")
    }
}
