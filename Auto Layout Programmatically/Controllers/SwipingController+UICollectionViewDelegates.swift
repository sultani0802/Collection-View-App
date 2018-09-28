//
//  SwipingController+UICollectionViewDelegates.swift
//  Auto Layout Programmatically
//
//  Created by Haamed Sultani on 9/27/18.
//  Copyright © 2018 Sultani. All rights reserved.
//

import UIKit

extension SwipingController {
    //MARK: - Collection View Delegate Methods
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
