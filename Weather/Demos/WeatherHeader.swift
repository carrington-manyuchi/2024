//
//  WeatherHeader.swift
//  Weather
//
//  Created by DA MAC M1 157 on 2023/11/15.
//

import UIKit

class WeatherHeader: UITableViewHeaderFooterView {
    
    public static let WeatherHeader = "identifier"
    
    private let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let firstStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        return stackView
    }()
    private let secondStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        return stackView
    }()
    
    private let thirdStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
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
        self.addSubview(headerStackView)
        headerStackView.addArrangedSubview(firstStackView)
        headerStackView.addArrangedSubview(secondStackView)
        headerStackView.addArrangedSubview(thirdStackView)
        firstStackView.addArrangedSubview(headerMinTemp)
        firstStackView.addArrangedSubview(headerMinLabel)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureConstraints() {
        
        let headerStackViewConstraints = [
            headerStackView.topAnchor.constraint(equalTo: self.topAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(headerStackViewConstraints)
    }


}
