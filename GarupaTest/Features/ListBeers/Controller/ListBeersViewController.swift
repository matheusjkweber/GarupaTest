//
//  ListBeersViewController.swift
//  GarupaTest
//
//  Created by Matheus Weber on 23/04/23.
//

import UIKit

class ListBeersViewController: UIViewController {
    private let mainView = ListBeersView()
    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }
    
    override func loadView() {
        view = mainView
        view.frame = CGRect(x: 0, y: 0, width: ScreenSize.width, height: ScreenSize.height)
    }
    
    private func setupCollectionView() {
        self.collectionView = mainView.getCollectionView()
        
        guard let collectionView = collectionView else {
            return
        }
        
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
    
    private func presentBeerDetailVC(beerVM: BeerDetailViewModel) {
        self.navigationController?.pushViewController(BeerDetailViewController(viewModel: beerVM), animated: true)
    }
}

extension ListBeersViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
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
        presentBeerDetailVC(beerVM: BeerDetailViewModel())
    }
}
