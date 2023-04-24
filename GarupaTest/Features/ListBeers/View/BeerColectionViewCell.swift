//
//  BeerColectionViewCell.swift
//  GarupaTest
//
//  Created by Matheus Weber on 23/04/23.
//

import UIKit
import SnapKit

class BeerColectionViewCell: UICollectionViewCell {
    fileprivate lazy var beerImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: Constants.beerTemplate))
        return imageView
    }()
    
    fileprivate lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Beer Template"
        titleLabel.font = UIFont.systemFont(ofSize: 14.0)
        return titleLabel
    }()
    
    fileprivate lazy var subtitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Subtitle Beer Template"
        titleLabel.font = UIFont.systemFont(ofSize: 14.0)
        return titleLabel
    }()
    
    func setup() {
        setupView()
    }
    
    private func setupView() {
        addSubview(beerImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        setupLayout()
    }
    
    private func setupLayout() {
        beerImageView.snp.makeConstraints {
            $0.height.width.equalTo(50.0)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-32.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(beerImageView.snp.bottom).offset(4.0)
            $0.centerX.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4.0)
            $0.centerX.equalToSuperview()
        }
    }
}
