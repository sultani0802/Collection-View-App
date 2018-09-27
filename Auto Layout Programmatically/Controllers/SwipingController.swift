//
//  SwipingController.swift
//  Auto Layout Programmatically
//
//  Created by Haamed Sultani on 2018-09-26.
//  Copyright © 2018 Sultani. All rights reserved.
//

import UIKit


class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //MARK: Variables
    let pages: [Page] = [
        Page(imageName: "santa a", headerText: "Join us today in our fun and games", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
        Page(imageName: "santa b", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get notified of these savings immediately when we announce them on our website. Make sure to also give us any feedback you have."),
        Page(imageName: "santa c", headerText: "VIP members special services", bodyText: "")
    ]
    
    
    
    //MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register our cell object to our collection view
        collectionView.register(PageCollectionViewCell.self, forCellWithReuseIdentifier: "CellId")
        
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .white
        collectionView.scrollIndicatorInsets.bottom = 1 // Set the distance between the scroll indicator and the bottom
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // Spacing between the collection view cells
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as! PageCollectionViewCell
        
        let page = pages[indexPath.item]
        cell.page = page
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Make our collection view cell's the size of our whole view
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
