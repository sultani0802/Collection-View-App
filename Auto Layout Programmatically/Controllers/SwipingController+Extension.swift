//
//  SwipingController+Extension.swift
//  Auto Layout Programmatically
//
//  Created by Haamed Sultani on 9/27/18.
//  Copyright © 2018 Sultani. All rights reserved.
//

import UIKit

extension SwipingController {
    
    // This delegate method is called whenever you flip the phone to its side
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout() // Force the app to redraw the view when we flip the phone
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0) // Make the scrollview flip properly
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        }) { (_) in
            
        }
        
    }
    
    
    //MARK: - Scroll View Delegate Methods
    
    // This delegate method is called whenever the user scroll's between the pages
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // We are going to obtain the scrollView's x position to determine where we are along the collection view
        // x = the current x value / whole collection view
        let x = targetContentOffset.pointee.x               // Get the CG Point value for X
        pageControl.currentPage = Int(x/view.frame.width)
        print(x, view.frame.width, x/view.frame.width)
    }
}
