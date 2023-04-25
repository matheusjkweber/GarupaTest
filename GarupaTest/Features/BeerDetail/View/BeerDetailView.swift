//
//  BeerDetailView.swift
//  GarupaTest
//
//  Created by Matheus Weber on 24/04/23.
//

import UIKit
import SnapKit

class BeerDetailView: UIView {
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    fileprivate lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    fileprivate lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Beer Title"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        return titleLabel
    }()
    
    fileprivate lazy var subtitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Beer Subtitle"
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 16.0)
        return titleLabel
    }()
    
    fileprivate lazy var beerImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: Constants.beerTemplate))
        return imageView
    }()
    
    fileprivate lazy var firstBrewedLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Beer Subtitle"
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
        return titleLabel
    }()
    
    fileprivate lazy var descriptionLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Beer Subtitle"
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 16.0)
        return titleLabel
    }()
    
    fileprivate lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    fileprivate lazy var
    
    init() {
        super.init(frame: CGRect.zero)
        setupView()
        setupLayout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Must not be initialized with this init")
    }
    
    private func setupView() {
        self.backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(containerView)
    }
    
    private func setupLayout() {
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo(scrollView).priority(250)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16.0)
            $0.left.right.equalToSuperview().offset(8.0)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4.0)
            $0.left.right.equalToSuperview().offset(8.0)
        }
        
        beerImageView.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(4.0)
            $0.left.right.equalToSuperview().offset(8.0)
        }
        
        firstBrewedLabel.snp.makeConstraints {
            $0.top.equalTo(beerImageView.snp.bottom).offset(4.0)
            $0.left.right.equalToSuperview().offset(8.0)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(firstBrewedLabel.snp.bottom).offset(8.0)
            $0.left.right.equalToSuperview().offset(8.0)
        }
    }

}
