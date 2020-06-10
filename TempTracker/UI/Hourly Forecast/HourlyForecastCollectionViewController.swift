//
//  HourlyForecastCollectionViewController.swift
//  TempTracker
//
//  Created by Jesse Morgan on 6/8/20.
//  Copyright © 2020 Jesse Morgan. All rights reserved.
//

import Foundation
import UIKit

class HourlyForecastCollectionViewController: UICollectionViewController {
    
    var dataSource: UICollectionViewDiffableDataSource<Int, Int>! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureDataSource()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureDataSource()
    }
    
    func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .systemBackground
        collectionView.register(UINib(nibName: HourlyForecastCell.identifier, bundle: nil), forCellWithReuseIdentifier:  HourlyForecastCell.identifier)
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Int, Int>(collectionView: collectionView, cellProvider: { (collectionView: UICollectionView, indexPath: IndexPath, indentifier: Int) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyForecastCell.identifier, for: indexPath)
                as? HourlyForecastCell else { fatalError("Failed to create new hourly forecast cell") }
            cell.timeLabel.text = "8PM"
            return cell
        })
        
        updateSnapshot()
    }
    
    func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Int>()
        snapshot.appendSections([0])
        snapshot.appendItems(Array(0..<14))
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                                   heightDimension: .fractionalHeight(1.0)))
            
            
            let containerGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .fractionalHeight(1.0)),
                subitem: item, count: 7)
            let section = NSCollectionLayoutSection(group: containerGroup)
            section.orthogonalScrollingBehavior = .continuous
            
            return section
            
        }
        return layout
    }
}
