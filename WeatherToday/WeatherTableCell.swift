//
//  WeatherTableCell.swift
//  WeatherToday
//
//  Created by Sajith Ramavarma on 25/09/18.
//  Copyright © 2018 Applied Materials. All rights reserved.
//


import UIKit

class WeatherTableCell: UITableViewCell {
  
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var dateLabel: UILabel!
  
    var forecasts: [WeatherDetails]?{
        didSet{
            collectionView.reloadData()
        }
    }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    collectionView.dataSource = self
  }
  
  func setDateLabel(text: String?) {
    
    guard let text = text else {
      dateLabel.text = stringFromDate(date: forecasts![0].date)
      return
    }
    
    dateLabel.text = text
  }
  
}

extension WeatherTableCell: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return forecasts?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCollectionCell", for: indexPath) as! WeatherCollectionCell
    
    cell.configureCell(withForecast: forecasts?[indexPath.row])
    
    return cell
  }
}
