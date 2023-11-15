//
//  ViewController.swift
//  Weather
//
//  Created by DA MAC M1 157 on 2023/11/15.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let headerView: UIView = {
        let header = UIView()
        header.backgroundColor = .red
        return header
    }()
    
    private let headerTempLabel: UILabel = {
        let label = UILabel()
        label.text = "25°"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 1
        return label
    }()

    private let headerSummaryLabel: UILabel = {
        let label  = UILabel()
        label.text = "Sunny"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }


}

