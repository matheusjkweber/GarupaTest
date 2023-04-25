//
//  ListBeersViewModel.swift
//  GarupaTest
//
//  Created by Matheus Weber on 25/04/23.
//

import UIKit

protocol ListBeersViewDelegate: AnyObject {
    func configureCollectionView(for collectionView: UICollectionView)
}

class ListBeersViewModel: NSObject {
    weak var delegate: ListBeersPresenterDelegate?
    
    var state: ViewState<ButtonAction> {
        didSet {
            self.delegate?.updateState(state: state)
        }
    }
    
    override init() {
        self.state = .success
    }
}

extension ListBeersViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BeerColectionViewCell.className, for: indexPath) as? BeerColectionViewCell else {
            fatalError("Must be provide a BeerColectionViewCell")
        }
        cell.setup()

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.presentBeerDetail(withViewModel: BeerDetailViewModel())
    }
}

extension ListBeersViewModel: ListBeersViewDelegate {
    func configureCollectionView(for collectionView: UICollectionView) {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(BeerColectionViewCell.self, forCellWithReuseIdentifier: BeerColectionViewCell.className)
        collectionView.reloadData()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 8
        collectionView.collectionViewLayout = layout
    }
}
