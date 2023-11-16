//
//  WeatherTableViewCell.swift
//  Weather
//
//  Created by DA MAC M1 157 on 2023/11/15.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    public static let identifier = "WeatherTableViewCell"
    
    private let weatherStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
    }()
    
    private let dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Wednesday"
        label.textColor = .label
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    private let weatherIcon: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Wednesday"
        label.textColor = .label
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    private func setupViews() {
        self.addSubview(weatherStackView)
        weatherStackView.addArrangedSubview(dayLabel)
        weatherStackView.addArrangedSubview(weatherIcon)
        weatherStackView.addArrangedSubview(tempLabel)
    }
    
    private func configureConstraints() {
        let weatherStackViewConstraints = [
            weatherStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            weatherStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            weatherStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            weatherStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ]
        NSLayoutConstraint.activate(weatherStackViewConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

}
