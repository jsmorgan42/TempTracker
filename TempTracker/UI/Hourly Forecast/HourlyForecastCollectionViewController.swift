//
//  HourlyForecastCollectionViewController.swift
//  TempTracker
//
//  Created by Jesse Morgan on 6/8/20.
//  Copyright © 2020 Jesse Morgan. All rights reserved.
//

import Foundation
import UIKit

final class HourlyForecastCollectionViewController: UICollectionViewController {
    
    private var dataSource: UICollectionViewDiffableDataSource<Int, Int>! = nil
    
    private let itemsPerPage = 7
    private let numberOfPages = 4
    
    let semaphore = DispatchSemaphore(value: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeatherData()
        configureHierarchy()
    }
    
    private func getWeatherData() {
        WeatherRepository.shared.getWeatherData(latitude: WeatherViewModel.location.latitude, longitude: WeatherViewModel.location.longitude, excluding: []) { (result) in
            switch result {
            case .success(let response):
                WeatherViewModel.current = response.current
                WeatherViewModel.minutely = response.minutely
                WeatherViewModel.hourly = response.hourly
                WeatherViewModel.daily = response.daily
                DispatchQueue.main.async {
                    self.configureDataSource()
                }
            case .failure(let error):
                print("Failed to retrieve weather data: \(error)")
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureDataSource()
    }
    
    private func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .offWhite
        collectionView.register(UINib(nibName: HourlyForecastCell.nibName, bundle: nil), forCellWithReuseIdentifier:  HourlyForecastCell.identifier)
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Int, Int>(collectionView: collectionView, cellProvider: { (collectionView: UICollectionView, indexPath: IndexPath, indentifier: Int) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyForecastCell.identifier, for: indexPath)
                as? HourlyForecastCell else { fatalError("Failed to create new hourly forecast cell") }
            
            guard let hourly = WeatherViewModel.hourly?[indexPath.row + 1] else { return cell }
            let temp = Int(hourly.temp.rounded())
            let date = NSDate(timeIntervalSince1970: TimeInterval(hourly.dt)).stringFormat()
            
            cell.temperatureLabel.text = "\(temp)°"
            cell.timeLabel.text = "\(date)"
            
            return cell
        })
        
        updateSnapshot()
    }
    
    private func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Int>()
        snapshot.appendSections([0])
        snapshot.appendItems(Array(0..<(itemsPerPage * numberOfPages)))
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let itemFractionalWidth = (1.0 / CGFloat(self.itemsPerPage)).roundedDecimals()
            let leadingItem = self.layoutItem(fractionalWidth: itemFractionalWidth, fractionalHeight: 1.0)
//            leadingItem.edgeSpacing = .init(leading: .fixed(8), top: nil, trailing: nil, bottom: nil)

            let item = self.layoutItem(fractionalWidth: itemFractionalWidth, fractionalHeight: 1.0)
            
            var items = [leadingItem, item]
            items.append(contentsOf: repeatElement(item, count: 6))
            let containerGroup = self.layoutGroup(fractionalWidth: 1.0, fractionalHeight: 1.0, items: items)
            let section = NSCollectionLayoutSection(group: containerGroup)
            section.orthogonalScrollingBehavior = .continuous
            
            return section
            
        }
        return layout
    }
    
    private func layoutItem(fractionalWidth: CGFloat, fractionalHeight: CGFloat) -> NSCollectionLayoutItem {
        return NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(fractionalWidth),
            heightDimension: .fractionalHeight(fractionalHeight)))
    }
    
    private func layoutGroup(fractionalWidth: CGFloat, fractionalHeight: CGFloat, items: [NSCollectionLayoutItem]) -> NSCollectionLayoutGroup {
        return NSCollectionLayoutGroup.horizontal(
        layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(fractionalHeight),
            heightDimension: .fractionalHeight(fractionalWidth)),
        subitems: items )
    }
}
