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
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.separatorColor = .systemGray
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(WeatherHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        view.addSubview(headerView)
        headerView.addSubview(headerTempLabel)
        headerView.addSubview(headerSummaryLabel)
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self

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
        
        let tableViewConstraints = [
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(headerViewConstraints)
        NSLayoutConstraint.activate(headerTempLabelConstraints)
        NSLayoutConstraint.activate(headerSummaryLabelConstraints)
        NSLayoutConstraint.activate(tableViewConstraints)
    }

}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = "Carrington"
        return cell!
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        return header
    }
}

