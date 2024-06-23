//
//  MainView.swift
//  PhraseApp
//
//  Created by Drolllted on 19.06.2024.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    lazy var qoutesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Найти цитату", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 15
        button.backgroundColor = .gray
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSub()
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSub() {
        addSubview(pickerView)
        addSubview(qoutesButton)
    }
    
    private func setupUI() {
        pickerView.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(100)
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        qoutesButton.snp.makeConstraints { make in
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(50)
            make.centerX.equalTo(snp.centerX)
            make.top.equalTo(pickerView.snp.bottom).offset(30)
        }
    }
    
    
}
