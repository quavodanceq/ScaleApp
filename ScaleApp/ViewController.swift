//
//  ViewController.swift
//  ScaleApp
//
//  Created by Куат Оралбеков on 17.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let mainLabel = UILabel()
    
    private let circleView = UIView()
    
    private let weightLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        view.backgroundColor = .magenta
        setupMainLabel()
        setupCircleView()
        setupWeightLabel()
        setupConstraints()
    }
    
    private func setupMainLabel() {
        view.addSubview(mainLabel)
        mainLabel.text = "Weigh your items"
        mainLabel.textAlignment = .center
        mainLabel.font = .boldSystemFont(ofSize: 25)
        mainLabel.textColor = .black
    }
    
    private func setupCircleView() {
        view.addSubview(circleView)
        circleView.layer.cornerRadius = 100
        circleView.clipsToBounds = true
        circleView.layer.borderColor = UIColor.blue.cgColor
        circleView.layer.borderWidth = 5
    }
    
    private func setupWeightLabel() {
        
        view.addSubview(weightLabel)
        weightLabel.text = "0 gram"
        weightLabel.textAlignment = .center
        weightLabel.font = .boldSystemFont(ofSize: 30)
        weightLabel.textColor = .black
    }
    
    private func setupConstraints() {
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        circleView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            circleView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95),
            circleView.heightAnchor.constraint(equalTo: circleView.widthAnchor)
        ])
        
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            weightLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            weightLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if #available(iOS 9.0, *) {
                if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
                    if touch.force >= touch.maximumPossibleForce {
                        weightLabel.text = "385 + grams"
                    } else {
                        let force = touch.force / touch.maximumPossibleForce
                        let grams = force * 385
                        let roundedGrams = Int(grams)
                        weightLabel.text = "\(roundedGrams) grams"
                    }
                    
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        weightLabel.text = "0 gram"
    }
}

