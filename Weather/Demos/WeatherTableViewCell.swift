//
//  WeatherTableViewCell.swift
//  Weather
//
//  Created by DA MAC M1 157 on 2023/11/15.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    public static let identifier = "WeatherTableViewCell"
    
    private let bodyStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private let dayLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let weatherIcon: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    private func setupViews() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

}
