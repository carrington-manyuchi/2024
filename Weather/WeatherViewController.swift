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
        label.text = "Sunny"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addSubview(headerView)
        headerView.addSubview(headerTempLabel)
        headerView.addSubview(headerSummaryLabel)
        configureConstraints()


    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
