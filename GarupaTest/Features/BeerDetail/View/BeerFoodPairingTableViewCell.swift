//
//  BeerFoodPairingTableViewCell.swift
//  GarupaTest
//
//  Created by Matheus Weber on 24/04/23.
//

import UIKit
import SnapKit

class BeerFoodPairingTableViewCell: UITableViewCell {
    fileprivate lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    fileprivate lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    func setup(title: String) {
        self.titleLabel.text = title
        backgroundColor = UIColor.clear
        selectionStyle = .none
        setupView()
    }
    
    func setupView() {
        addSubview(titleLabel)
        addSubview(valueLabel)
        
        setupLayout()
    }
    
    func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(8.0)
            $0.centerY.equalToSuperview()
        }
    }
}
