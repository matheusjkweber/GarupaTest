//
//  DetailBeerViewModel.swift
//  GarupaTest
//
//  Created by Matheus Weber on 24/04/23.
//

import UIKit

enum BeerDetailTableViewType {
    case extraInfo
    case ingredients
    case foodPairing
}

protocol BeerDetailViewDelegate: class {
    func needsToRegisterViews(for tableView: UITableView, withType type: BeerDetailTableViewType)
}

class BeerDetailViewModel: AnyObject {
    init() {
        
    }
    
    func setupTableViews() {
        
    }
}

extension BeerDetailViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
}

extension BeerDetailViewModel: BeerDetailViewDelegate {
    func needsToRegisterViews(for tableView: UITableView, withType type: BeerDetailTableViewType) {
        switch type {
        case .extraInfo, .ingredients:
            tableView.register(BeerExtraInfoTableViewCell.class, forCellReuseIdentifier: BeerExtraInfoTableViewCell.className)
        case .foodPairing:
            tableView.register(<#T##AnyClass?#>, forCellReuseIdentifier: <#T##String#>)
        }
        
    }
}
