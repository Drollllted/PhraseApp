//
//  ResultViewController.swift
//  PhraseApp
//
//  Created by Drolllted on 20.06.2024.
//

import UIKit

class ResultViewController: UIViewController {
    
    var resultView: ResultView!
    weak var delegateMain: MainViewControllerDelegate?
    
    override func loadView() {
        view = resultView
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        resultView = ResultView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    func updateResultLabel(resultText: String) {
        resultView.resultLabel.text = resultText
    }
    
}
extension ResultViewController: MainViewControllerDelegate{
    func getQuotesInResultLabel(resultText: String) {
        DispatchQueue.main.async{
            self.updateResultLabel(resultText: resultText)
        }
    }
    
    
}
