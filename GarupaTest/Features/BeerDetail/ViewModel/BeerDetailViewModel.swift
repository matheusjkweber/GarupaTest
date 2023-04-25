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

class BeerDetailViewModel: NSObject {
}

extension BeerDetailViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewType = BeerDetailTableViewType(rawValue: tableView.tag)
        
        switch(tableViewType) {
        case .extraInfo:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BeerExtraInfoTableViewCell.className) as? BeerExtraInfoTableViewCell else {
                fatalError("Must be provided a BeerExtraInfoTableViewCell")
            }
            cell.setup(title: "Test title", value: "Test")
            return cell
        case .ingredients:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BeerExtraInfoTableViewCell.className) as? BeerExtraInfoTableViewCell else {
                fatalError("Must be provided a BeerExtraInfoTableViewCell")
            }
            cell.setup(title: "Test title", value: "Test")
            return cell
        case .foodPairing:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BeerFoodPairingTableViewCell.className) as? BeerFoodPairingTableViewCell else {
                fatalError("Must be provided a BeerFoodPairingTableViewCell")
            }
            cell.setup(title: "Test title")
            return cell
        case .none:
            fatalError("Must be provided a valid tag.")
        }
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
