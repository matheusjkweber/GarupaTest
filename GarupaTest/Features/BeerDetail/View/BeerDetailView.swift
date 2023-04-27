//
//  BeerDetailView.swift
//  GarupaTest
//
//  Created by Matheus Weber on 24/04/23.
//

import UIKit
import SnapKit

protocol BeerDetailViewDelegate: AnyObject {
    func configureTableView(for tableView: UITableView, withType type: BeerDetailTableViewType)
}

class BeerDetailView: UIView, BeerDetailViewing {
    weak var delegate: BeerDetailViewDelegate?
    
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
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    fileprivate lazy var subtitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Beer Subtitle"
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 16.0)
        return titleLabel
    }()
    
    fileprivate lazy var beerImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: Constants.beerTemplate))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    fileprivate lazy var firstBrewedLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = ""
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
        return titleLabel
    }()
    
    fileprivate lazy var descriptionLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean et quam ac neque commodo placerat. In sodales purus nec erat congue, vitae dictum metus sollicitudin. Mauris at lorem suscipit, sodales orci bibendum, scelerisque quam. Nam gravida est vitae elit vulputate consectetur. Nulla facilisi. Etiam sollicitudin vel elit et ultricies. Maecenas ante ante, pharetra in metus non, eleifend sodales risus. Vestibulum eget mauris in magna lacinia aliquet ut ut nulla. Duis ornare ante ante, eu vehicula odio consequat sed. Vestibulum eget nisl et turpis volutpat lobortis et ac ex. Duis tincidunt ligula eros, scelerisque porttitor lectus congue et. Aliquam elementum ac nisl eget ornare. Mauris nec turpis dui. Donec nec justo ut mauris tristique congue eget et justo. Fusce tempor libero vel pellentesque rhoncus."
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 16.0)
        return titleLabel
    }()
    
    fileprivate lazy var beerExtraInfoTableView = {
        let tableView = UITableView()
        tableView.tag = 0
        return tableView
    }()
    
    fileprivate lazy var ingredientsTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Ingredients"
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 16.0)
        return titleLabel
    }()
    
    fileprivate lazy var ingredientsTableView = {
        let tableView = UITableView()
        tableView.tag = 1
        return tableView
    }()
    
    fileprivate lazy var foodPairingTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Food Pairing"
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 16.0)
        return titleLabel
    }()
    
    fileprivate lazy var foodPairingTableView = {
        let tableView = UITableView()
        tableView.tag = 2
        return tableView
    }()
    
    fileprivate lazy var brewerTipsLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean et quam ac neque commodo placerat. In sodales purus nec erat congue, vitae dictum metus sollicitudin. Mauris at lorem suscipit, sodales orci bibendum, scelerisque quam. Nam gravida est vitae elit vulputate consectetur. Nulla facilisi. Etiam sollicitudin vel elit et ultricies. Maecenas ante ante, pharetra in metus non, eleifend sodales risus. Vestibulum eget mauris in magna lacinia aliquet ut ut nulla. Duis ornare ante ante, eu vehicula odio consequat sed. Vestibulum eget nisl et turpis volutpat lobortis et ac ex. Duis tincidunt ligula eros, scelerisque porttitor lectus congue et. Aliquam elementum ac nisl eget ornare. Mauris nec turpis dui. Donec nec justo ut mauris tristique congue eget et justo. Fusce tempor libero vel pellentesque rhoncus."
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 14.0)
        return titleLabel
    }()
    
    fileprivate lazy var contributedTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Contributed by"
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 12.0)
        return titleLabel
    }()
    
    fileprivate lazy var contributedValueLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Matheus Weber"
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 12.0)
        titleLabel.textAlignment = .right
        return titleLabel
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        setupView()
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
        containerView.addSubview(titleLabel)
        containerView.addSubview(beerImageView)
        containerView.addSubview(subtitleLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(firstBrewedLabel)
        containerView.addSubview(beerExtraInfoTableView)
        containerView.addSubview(ingredientsTitleLabel)
        containerView.addSubview(ingredientsTableView)
        containerView.addSubview(foodPairingTitleLabel)
        containerView.addSubview(foodPairingTableView)
        containerView.addSubview(brewerTipsLabel)
        containerView.addSubview(contributedTitleLabel)
        containerView.addSubview(contributedValueLabel)
        setupLayout()
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
            $0.left.equalToSuperview().offset(8.0)
            $0.right.equalToSuperview().offset(-8.0)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4.0)
            $0.left.equalToSuperview().offset(8.0)
            $0.right.equalToSuperview().offset(-8.0)
        }
        
        beerImageView.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(4.0)
            $0.height.equalTo(300.0)
            $0.left.equalToSuperview().offset(8.0)
            $0.right.equalToSuperview().offset(-8.0)
        }
        
        firstBrewedLabel.snp.makeConstraints {
            $0.top.equalTo(beerImageView.snp.bottom).offset(4.0)
            $0.left.equalToSuperview().offset(8.0)
            $0.right.equalToSuperview().offset(-8.0)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(firstBrewedLabel.snp.bottom).offset(8.0)
            $0.left.equalToSuperview().offset(8.0)
            $0.right.equalToSuperview().offset(-8.0)
        }
        
        beerExtraInfoTableView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(8.0)
            $0.height.equalTo(300.0)
            $0.left.equalToSuperview().offset(8.0)
            $0.right.equalToSuperview().offset(-8.0)
        }
        
        ingredientsTitleLabel.snp.makeConstraints {
            $0.top.equalTo(beerExtraInfoTableView.snp.bottom).offset(8.0)
            $0.left.equalToSuperview().offset(8.0)
            $0.right.equalToSuperview().offset(-8.0)
        }
        
        ingredientsTableView.snp.makeConstraints {
            $0.top.equalTo(ingredientsTitleLabel.snp.bottom).offset(8.0)
            $0.height.equalTo(300.0)
            $0.left.right.equalToSuperview()
        }
        
        foodPairingTitleLabel.snp.makeConstraints {
            $0.top.equalTo(ingredientsTableView.snp.bottom).offset(8.0)
            $0.left.equalToSuperview().offset(8.0)
            $0.right.equalToSuperview().offset(-8.0)
        }
        
        foodPairingTableView.snp.makeConstraints {
            $0.top.equalTo(foodPairingTitleLabel.snp.bottom).offset(8.0)
            $0.height.equalTo(300.0)
            $0.left.right.equalToSuperview()
        }
        
        brewerTipsLabel.snp.makeConstraints {
            $0.top.equalTo(foodPairingTableView.snp.bottom).offset(8.0)
            $0.left.equalToSuperview().offset(8.0)
            $0.right.equalToSuperview().offset(-8.0)
        }
        
        contributedTitleLabel.snp.makeConstraints {
            $0.top.equalTo(brewerTipsLabel.snp.bottom).offset(8.0)
            $0.left.equalToSuperview().offset(8.0)
            $0.width.equalTo(ScreenSize.width / 2 - 8.0)
            $0.bottom.equalToSuperview().offset(-24.0)
        }
        
        contributedValueLabel.snp.makeConstraints {
            $0.top.equalTo(brewerTipsLabel.snp.bottom).offset(8.0)
            $0.width.equalTo(ScreenSize.width / 2 - 8.0)
            $0.right.equalToSuperview().offset(-8.0)
            $0.bottom.equalToSuperview().offset(-24.0)
        }
    }
    
    func setup(name: String,
               tagline: String,
               beerImage: UIImage?,
               firstBrewed: String,
               description: String,
               brewerTips: String,
               contributedBy: String,
               beerExtraInfoTableViewHeight: CGFloat,
               ingredientsTableViewHeight: CGFloat,
               foodPairingTableViewHeight: CGFloat) {
        titleLabel.text = name
        subtitleLabel.text = tagline
        beerImageView.image = beerImage
        firstBrewedLabel.text = "First Brewed: \(firstBrewed)"
        descriptionLabel.text = description
        brewerTipsLabel.text = brewerTips
        contributedValueLabel.text = contributedBy
        
        if beerImage == nil {
            emptyImageView()
        }
        setTableViewHeights(beerExtraInfoTableViewHeight: beerExtraInfoTableViewHeight,
                            ingredientsTableViewHeight: ingredientsTableViewHeight,
                            foodPairingTableViewHeight: foodPairingTableViewHeight)
        prepareTableViews()
    }
    
    private func prepareTableViews() {
        self.delegate?.configureTableView(for: beerExtraInfoTableView, withType: .extraInfo)
        self.delegate?.configureTableView(for: ingredientsTableView, withType: .ingredients)
        self.delegate?.configureTableView(for: foodPairingTableView, withType: .foodPairing)
    }
    
    private func emptyImageView() {
        beerImageView.snp.remakeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(4.0)
            $0.height.equalTo(0)
            $0.left.equalToSuperview().offset(8.0)
            $0.right.equalToSuperview().offset(-8.0)
        }
    }
    
    private func setTableViewHeights(beerExtraInfoTableViewHeight: CGFloat, ingredientsTableViewHeight: CGFloat, foodPairingTableViewHeight: CGFloat) {
        beerExtraInfoTableView.snp.remakeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(8.0)
            $0.height.equalTo(beerExtraInfoTableViewHeight)
            $0.left.equalToSuperview().offset(8.0)
            $0.right.equalToSuperview().offset(-8.0)
        }
        
        ingredientsTableView.snp.remakeConstraints {
            $0.top.equalTo(ingredientsTitleLabel.snp.bottom).offset(8.0)
            $0.height.equalTo(ingredientsTableViewHeight)
            $0.left.right.equalToSuperview()
        }
        
        foodPairingTableView.snp.remakeConstraints {
            $0.top.equalTo(foodPairingTitleLabel.snp.bottom).offset(8.0)
            $0.height.equalTo(foodPairingTableViewHeight)
            $0.left.right.equalToSuperview()
        }
    }
}
