//
//  ViewController.swift
//  WeatherToday
//
//  Created by Sajith Ramavarma on 24/09/18.
//  Copyright © 2018 Applied Materials. All rights reserved.
//

import UIKit
class WeatherViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let viewModel: WeatherViewModelType = WeatherViewModel()
    var selectedCity : City?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = view.frame.height / 4
        title = "Weather"
        
    }
    @IBAction func showAlert(sender: AnyObject) {
        showCitySelectAlert()
    }
}

extension WeatherViewController {

    func showCitySelectAlert(){
        let alert = UIAlertController(title: "Weather", message: "Please Select city", preferredStyle: .actionSheet)
        for city in self.viewModel.cities{
            alert.addAction(UIAlertAction(title: city.name,  style: .default , handler:{ (alert)in
                if let tempCity = self.viewModel.getCityForName(name: alert.title!) {
                    self.selectedCity = tempCity
                    if let item = self.navigationItem.rightBarButtonItem {
                        item.title = tempCity.name
                    }
                    self.refreshData(city: tempCity)
                }
            }))
        }
        self.present(alert, animated: true, completion: {
            
        })
    }
    
    func refreshData(city : City){
        self.viewModel.getData(
            city: city, reloadAction: { (status) in
                if status {
                    self.reloadData()
                }
        }) { (alertMessage) in
            self.showErrorAlert(message: alertMessage)
        }
        
    }
    func showErrorAlert(message: String){
            let alert = UIAlertController(title: "Weather Forecast", message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            self.present(alert, animated: true, completion: nil)
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension WeatherViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.forecasts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherTableCell", for: indexPath) as! WeatherTableCell
        
        if let forecasts = viewModel.forecasts {
            
            cell.forecasts = forecasts[indexPath.row]
            cell.setDateLabel(text: viewModel.dateHeaderText[indexPath.row])
            
            return cell
            
        }
        return cell
    }
}
