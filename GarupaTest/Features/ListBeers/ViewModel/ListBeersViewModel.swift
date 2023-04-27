//
//  ListBeersViewModel.swift
//  GarupaTest
//
//  Created by Matheus Weber on 25/04/23.
//

import UIKit

protocol ListBeersServicing: AnyObject {
    var manager: NetworkManager { get }
    
    func getBeers(page: Int,
                  limit: Int,
                  success: @escaping (_ beersModel: [BeerModel]) -> (),
                  failure: @escaping (_ error: NetworkResponse) -> ())
    func getImage(imageURL: URL,
                  success: @escaping (_ imageData: Data) -> (),
                  failure: @escaping (_ error: NetworkResponse) -> ())
}

protocol ListBeersPresenterDelegate: AnyObject {
    func presentBeerDetail(withViewModel: BeerDetailViewModel)
    func updateState(state: ViewState<ButtonAction>)
    func presentToastWith(message: String)
}

protocol ListBeersViewDelegate: AnyObject {
    func configureCollectionView(for collectionView: UICollectionView)
}

class ListBeersViewModel: NSObject, ListBeersViewModelling {
    private var page = 1
    private let limit = 25
    
    private let service: ListBeersServicing
    private var activeCollectionView: UICollectionView?
    weak var delegate: ListBeersPresenterDelegate?
    private var beers = [BeerModel]()
    
    var state: ViewState<ButtonAction> {
        didSet {
            self.delegate?.updateState(state: state)
        }
    }
    
    init(service: ListBeersServicing) {
        self.service = service
        self.state = .success
    }
    
    func start() {
        populateBeers()
    }
    
    private func populateBeers() {
        state = .loading
        service.getBeers(page: page, limit: limit, success: { beers in
            DispatchQueue.main.async {
                self.state = .success
                self.beers += beers
                self.reloadCollectionView()
                self.downloadImages()
            }
        }, failure: { error in
            DispatchQueue.main.async {
                if self.page == 0 {
                    self.state = .requestError({
                        self.populateBeers()
                    })
                } else {
                    self.delegate?.presentToastWith(message: Constants.defaultErrorText)
                }
            }
        })
        self.delegate?.presentToastWith(message: Constants.defaultErrorText)
    }
    
    private func reloadCollectionView() {
        guard let activeCollectionView = activeCollectionView else {
            return
        }
        activeCollectionView.reloadData()
    }
    
    private func reload(row: Int) {
        activeCollectionView?.reloadItems(at: [IndexPath(row: row, section: 0)])
    }
    
    private func downloadImages() {
        for i in (0...beers.count - 1) {
            if let url = URL(string: beers[i].imageUrl) {
                if beers[i].downloadedImage == nil {
                    service.getImage(imageURL: url) { data in
                        self.beers[i].downloadedImage = UIImage(data: data)
                        DispatchQueue.main.async {
                            self.reload(row: i)
                        }
                    } failure: { _ in
                        self.beers[i].downloadedImage = UIImage(named: Constants.beerTemplate)
                    }
                }
            }
        }
    }
}

extension ListBeersViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BeerColectionViewCell.className, for: indexPath) as? BeerColectionViewCell else {
            fatalError("Must be provide a BeerColectionViewCell")
        }
        let beer = beers[indexPath.row]
        cell.setup(title: beer.name, subtitle: beer.tagline)
        
        if let beerImage = beer.downloadedImage {
            cell.setImage(beerImage)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.presentBeerDetail(withViewModel: BeerDetailViewModel(beerModel: beers[indexPath.row]))
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == beers.count - 1 {
            page += 1
            populateBeers()
        }
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
        activeCollectionView = collectionView
    }
}
