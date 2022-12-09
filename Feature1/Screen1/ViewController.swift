//
//  ViewController.swift
//  Coordtest
//
//  Created by Antonio Di Giacomo on 31/01/2022.
//

import UIKit

final class ViewController: UIViewController {
    private var rootView: View?
    private let viewModel: ViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
    }
    
    public init(_ viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        print("\(self) is born")
    }
    
    deinit {
        print("\(self) has gone to heaven")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        rootView = View()
        view = rootView
    }
    
    func setupBinding() {
        rootView?.label.text = viewModel.output.text
        rootView?.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc
    private func buttonTapped(sender: UIButton) {
        viewModel.input.buttonTapped()
    }
}
