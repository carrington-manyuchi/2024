//
//  WeatherViewController.swift
//  Weather
//
//  Created by DA MAC M1 157 on 2023/11/15.
//

import UIKit
import CoreLocation

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
        //label.text = "25°"
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
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifier)
        tableView.register(WeatherHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        return tableView
    }()
    
    var hourly = [Current]()
    var models = [Daily]()
    var current: Current?
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(headerView)
        headerView.addSubview(headerTempLabel)
        headerView.addSubview(headerSummaryLabel)
        view.addSubview(tableView)
        configureConstraints()
        setupLocation()
        
        headerTempLabel.text = current?.weather[0].main
    }
    
    func setupLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, currentLocation == nil {
            currentLocation = locations.first
            locationManager.stopUpdatingLocation()
            requestWeatherForLocation()
        }
    }
    
    func requestWeatherForLocation() {
        guard let currentLocation = currentLocation else {
            return
        }
        
        let long = currentLocation.coordinate.longitude
        let lat = currentLocation.coordinate.latitude
        
        
         let url =  "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(long)&exclude=minutely,alerts&appid=a939b3a2c089cdc4dcefee3b74142319&units=metric"
        
        print("\(long) & \(lat)")
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: URL(string: url)!) { data, response, error in
            guard let data = data,
                  error == nil else {
                print("Data Validation is wrong")
                return
            }
            
            var json: Weather?
            
            do {
                json = try JSONDecoder().decode(Weather.self, from: data)
            } catch {
                print("error: \(error)")
            }
            
            guard let result = json else {
                return
            }
            let entries = result.daily
            self.models.append(contentsOf: entries)
            
            let current = result.current
            self.current = current
            
            let hours = result.hourly
            self.hourly = hours
            
            print(result.hourly)
            
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.tableView.tableHeaderView = self.headerView
            }
        }
        dataTask.resume()
    }
    
    
    
    public func configureConstraints() {
        
        let headerViewConstraints = [
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
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
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor
                                          ),
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as? WeatherTableViewCell else {
            return UITableViewCell()
        }
        cell.dayLabel.text = "Wednesday"
        cell.tempLabel.text = "23"
        cell.weatherIcon.image = UIImage(systemName: "sun.max.fill")
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}



extension  WeatherViewController: CLLocationManagerDelegate {
    
}
