//
//  ResultView.swift
//  PhraseApp
//
//  Created by Drolllted on 20.06.2024.
//

import UIKit
import SnapKit

class ResultView: UIView {
    
    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 20
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(resultLabel)
    }
    
    private func setupConstraints() {
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(20)
            make.leading.equalTo(self.snp.leading).inset(15)
            make.trailing.equalTo(self.snp.trailing).inset(15)
            make.height.equalTo(self.snp.height).inset(100)
            
        }
    }
    
    
    
}
