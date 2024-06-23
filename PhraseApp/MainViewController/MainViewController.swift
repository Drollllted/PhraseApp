//
//  ViewController.swift
//  PhraseApp
//
//  Created by Drolllted on 19.06.2024.
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func getQuotesInResultLabel(resultText: String)
}

class MainViewController: UIViewController {
    
    private var mainView: MainView!
    private let ApiRequest = APIRequest.shared
    private let qoutes = Array(Variables.allCases.map {$0.rawValue})
    private var selectedCategory: String = ""
    
    override func loadView() {
        mainView = MainView()
        view = mainView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        mainView.pickerView.delegate = self
        mainView.pickerView.dataSource = self
        mainView.qoutesButton.addTarget(self, action: #selector(pushController), for: .touchUpInside)
        
    }
    
    @objc func pushController() {
        getQuotes()
    }
    
    private func getQuotes() {
        ApiRequest.getPhareses(for: selectedCategory) { quory in
            guard let quory = quory else {return}
            print(quory)
            DispatchQueue.main.async{
                let viewController = ResultViewController()
                viewController.delegateMain = self
                self.navigationController?.pushViewController(viewController, animated: true)
                
                viewController.updateResultLabel(resultText: quory)

            }
        }
    }


}

extension MainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        qoutes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return qoutes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCategory = qoutes[row]
    }
    
}

extension MainViewController: MainViewControllerDelegate{
    func getQuotesInResultLabel(resultText: String) {
    }

    
    
}
