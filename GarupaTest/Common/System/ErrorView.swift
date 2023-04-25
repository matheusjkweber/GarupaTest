//
//  ErrorView.swift
//  GarupaTest
//
//  Created by Matheus Weber on 25/04/23.
//

import UIKit
import SnapKit

protocol ErrorViewDelegate: AnyObject {
    func didClickTryAgainButton()
}

class ErrorView: UIView {
    weak var delegate: ErrorViewDelegate?
    var buttonAction: ButtonAction?
    
    fileprivate lazy var errorImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: Constants.errorIcon))
        return imageView
    }()
    
    fileprivate lazy var errorTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Error!"
        titleLabel.textColor = .red
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        return titleLabel
    }()
    
    fileprivate lazy var errorDescriptionLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Error description!"
        titleLabel.font = UIFont.systemFont(ofSize: 14.0)
        return titleLabel
    }()
    
    fileprivate lazy var tryAgainButton: UIButton = {
        let button = UIButton()
        button.setTitle("Try again", for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(didTryAgainButtonClicked), for: .touchUpInside)
        return button
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
        addSubview(errorImageView)
        addSubview(errorTitleLabel)
        addSubview(errorDescriptionLabel)
        addSubview(tryAgainButton)
    }
    
    private func setupLayout() {
        errorImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-24.0)
            $0.height.width.equalTo(65.0)
            $0.centerX.equalToSuperview()
        }
        
        errorTitleLabel.snp.makeConstraints {
            $0.top.equalTo(errorImageView.snp.bottom).offset(8.0)
            $0.centerX.equalToSuperview()
        }
        
        errorDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(errorTitleLabel.snp.bottom).offset(8.0)
            $0.centerX.equalToSuperview()
        }
        
        tryAgainButton.snp.makeConstraints {
            $0.top.equalTo(errorDescriptionLabel.snp.bottom).offset(8.0)
            $0.centerX.equalToSuperview()
        }
    }

    func setup(errorMessage: String, buttonAction: ButtonAction? = {}) {
        self.errorDescriptionLabel.text = errorMessage
        self.buttonAction = buttonAction
    }
    
    @objc func didTryAgainButtonClicked(_ sender: Any) {
        self.buttonAction?()
    }
}
