//
//  WeatherViewController.swift
//  Weather
//
//  Created by DA MAC M1 157 on 2023/11/15.
//

import UIKit

class WeatherViewController: UIViewController {
    
    private let headerView: UIView = {
        let header = UIView()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.backgroundColor = .red
        return header
    }()
    
    private let headerTempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "25°"
        label.textColor = .black
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.numberOfLines = 1
        return label
    }()

    private let headerSummaryLabel: UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SUNNY"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(headerView)
        headerView.addSubview(headerTempLabel)
        headerView.addSubview(headerSummaryLabel)
        configureConstraints()
    }
    
    public func configureConstraints() {
        
        let headerViewConstraints = [
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 200)
        ]
        
        let headerTempLabelConstraints = [
            headerTempLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 50),
            headerTempLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
        ]
        
        let headerSummaryLabelConstraints = [
            headerSummaryLabel.topAnchor.constraint(equalTo: headerTempLabel.bottomAnchor, constant: 30),
            headerSummaryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerSummaryLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -30)
        ]
        
        NSLayoutConstraint.activate(headerViewConstraints)
        NSLayoutConstraint.activate(headerTempLabelConstraints)
        NSLayoutConstraint.activate(headerSummaryLabelConstraints)
    }

}
