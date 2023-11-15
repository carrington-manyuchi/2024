//
//  WeatherHeader.swift
//  Weather
//
//  Created by DA MAC M1 157 on 2023/11/15.
//

import UIKit

class WeatherHeader: UITableViewHeaderFooterView {
    
    
    private let headerStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let headerMinLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "19°"
        label.textColor = .black
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.numberOfLines = 1
        return label
    }()
    
    private let headerMinTemp: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "min"
        label.textColor = .black
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.numberOfLines = 1
        return label
    }()

    private let headerCurrentTemp: UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sunny"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private let headerCurrentLabel: UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sunny"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private let headerMaxLabel: UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sunny"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private let headerMaxTemp: UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sunny"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
                self.addSubview(headerView)
                headerView.addSubview(headerTempLabel)
                headerView.addSubview(headerSummaryLabel)
                configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureConstraints() {
        
        let headerViewConstraints = [
            headerView.topAnchor.constraint(equalTo: self.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ]
        
        let headerTempLabelConstraints = [
            headerTempLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 50),
            headerTempLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
        ]
        
        let headerSummaryLabelConstraints = [
            headerSummaryLabel.topAnchor.constraint(equalTo: headerTempLabel.bottomAnchor, constant: 30),
            headerSummaryLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            headerSummaryLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -30)
        ]
        
        NSLayoutConstraint.activate(headerViewConstraints)
        NSLayoutConstraint.activate(headerTempLabelConstraints)
        NSLayoutConstraint.activate(headerSummaryLabelConstraints)
    }
}

}
