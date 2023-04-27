//
//  DetailBeerViewModel.swift
//  GarupaTest
//
//  Created by Matheus Weber on 24/04/23.
//

import UIKit

enum BeerDetailTableViewType: Int {
    case extraInfo = 0
    case ingredients = 1
    case foodPairing = 2
}

protocol BeerDetailViewDelegate: AnyObject {
    func configureTableView(for tableView: UITableView, withType type: BeerDetailTableViewType)
}

protocol BeerDetailPresenterDelegate: AnyObject {
    func fillUI()
}

class BeerDetailViewModel: NSObject, BeerDetailViewModelling {
    private let rowHeight = 24
    private let maxTableViewHeight = 300
    
    var state: ViewState<ButtonAction> = .success
    weak var delegate: BeerDetailPresenterDelegate?
    var beerModel: BeerModel
    var beerExtraInfoTableViewHeight = 0
    var ingredientsTableViewHeight = 0
    var foodPairingTableViewHeight = 0
    
    private var ingredients = [(String, String)]()
    private var extraInfoItems = [(String, String)]()
    
    init(beerModel: BeerModel) {
        self.beerModel = beerModel
    }
    
    func start() {
        fillExtraInfoItems()
        fillIngredients()
        calculateFoodPairingHeight()
        
        self.delegate?.fillUI()
    }
    
    private func fillExtraInfoItems() {
        if let attenuationLevel = beerModel.attenuationLevel {
            extraInfoItems.append(("Attenuation Level:", "\(attenuationLevel)"))
        }
        if let abv = beerModel.abv {
            extraInfoItems.append(("ABV:", "\(abv)"))
        }
        if let ebc = beerModel.ebc {
            extraInfoItems.append(("EBC:", "\(ebc)"))
        }
        if let ibu = beerModel.ibu {
            extraInfoItems.append(("IBU:", "\(ibu)"))
        }
        if let targetFG = beerModel.targetFG {
            extraInfoItems.append(("Target FG:", "\(targetFG)"))
        }
        if let targetOG = beerModel.targetOG {
            extraInfoItems.append(("Target OG:", "\(targetOG)"))
        }
        
        if let ebc = beerModel.ebc {
            extraInfoItems.append(("EBC:", "\(ebc)"))
        }
        
        if let srm = beerModel.srm {
            extraInfoItems.append(("SRM:", "\(srm)"))
        }
        
        if let ph = beerModel.ph {
            extraInfoItems.append(("PH:", "\(ph)"))
        }
        
        beerExtraInfoTableViewHeight = (extraInfoItems.count * rowHeight) < maxTableViewHeight ? (extraInfoItems.count * rowHeight) : maxTableViewHeight
    }
    
    private func fillIngredients() {
        for item in beerModel.ingredients.malt {
            ingredients.append(("Malt: \(item.name)", "Amount: \(item.amount.value) \(item.amount.unit)"))
        }
        
        for item in beerModel.ingredients.hops {
            ingredients.append(("Hop: \(item.name)", "Amount: \(item.amount.value) \(item.amount.unit)"))
        }
        
        ingredientsTableViewHeight = (ingredients.count * rowHeight) < maxTableViewHeight ? (ingredients.count * rowHeight) : maxTableViewHeight
    }
    
    private func calculateFoodPairingHeight() {
        foodPairingTableViewHeight = (beerModel.foodPairing.count * rowHeight) < maxTableViewHeight ? (beerModel.foodPairing.count * rowHeight) : maxTableViewHeight
    }
}

extension BeerDetailViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tableViewType = BeerDetailTableViewType(rawValue: tableView.tag)
        
        switch tableViewType {
        case .extraInfo:
            return extraInfoItems.count
        case .ingredients:
            return ingredients.count
        case .foodPairing:
            return beerModel.foodPairing.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewType = BeerDetailTableViewType(rawValue: tableView.tag)
        
        switch(tableViewType) {
        case .extraInfo:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BeerExtraInfoTableViewCell.className) as? BeerExtraInfoTableViewCell else {
                fatalError("Must be provided a BeerExtraInfoTableViewCell")
            }
            cell.setup(title: extraInfoItems[indexPath.row].0, value: extraInfoItems[indexPath.row].1)
            return cell
        case .ingredients:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BeerExtraInfoTableViewCell.className) as? BeerExtraInfoTableViewCell else {
                fatalError("Must be provided a BeerExtraInfoTableViewCell")
            }
            cell.setup(title: ingredients[indexPath.row].0, value: ingredients[indexPath.row].1)
            return cell
        case .foodPairing:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BeerFoodPairingTableViewCell.className) as? BeerFoodPairingTableViewCell else {
                fatalError("Must be provided a BeerFoodPairingTableViewCell")
            }
            cell.setup(title: beerModel.foodPairing[indexPath.row])
            return cell
        case .none:
            fatalError("Must be provided a valid tag.")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(rowHeight)
    }
}

extension BeerDetailViewModel: BeerDetailViewDelegate {
    func configureTableView(for tableView: UITableView, withType type: BeerDetailTableViewType) {
        tableView.delegate = self
        tableView.dataSource = self
        
        switch type {
        case .extraInfo, .ingredients:
            tableView.register(BeerExtraInfoTableViewCell.self, forCellReuseIdentifier: BeerExtraInfoTableViewCell.className)
        case .foodPairing:
            tableView.register(BeerFoodPairingTableViewCell.self, forCellReuseIdentifier: BeerFoodPairingTableViewCell.className)
        }
        tableView.reloadData()
    }
}
