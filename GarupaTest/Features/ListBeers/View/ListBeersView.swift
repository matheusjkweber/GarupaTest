//
//  ListBeersView.swift
//  GarupaTest
//
//  Created by Matheus Weber on 23/04/23.
//

import UIKit
import SnapKit

class ListBeersView: UIView, ListBeersViewing {
    weak var delegate: ListBeersViewDelegate?
    
    fileprivate lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "List of Beers"
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        label.textAlignment = .center
        return label
    }()
    
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    fileprivate lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        return collectionView
    }()
    
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
        addSubview(titleLabel)
        addSubview(collectionView)
    }
    
    private func setupLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalToSuperview().offset(ScreenSize.topPadding)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8.0)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    
    func setup() {
        prepareCollectionView()
    }
    
    private func prepareCollectionView() {
        self.delegate?.configureCollectionView(for: collectionView)
    }
}
