//
//  SwipingController.swift
//  Auto Layout Programmatically
//
//  Created by Haamed Sultani on 2018-09-26.
//  Copyright © 2018 Sultani. All rights reserved.
//

import UIKit


class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    //MARK: - Variables
    // Instantiating our model here
    var pages: [Page] = [
        Page(imageName: "santa a", headerText: "Join us today in our fun and games", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
        Page(imageName: "santa b", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get notified of these savings immediately when we announce them on our website. Make sure to also give us any feedback you have."),
        Page(imageName: "santa c", headerText: "VIP members special services", bodyText: "Get notified of these savings immediately when we announce them on our website. Make sure to also give us any feedback you have."),
        Page(imageName: "santa a", headerText: "Join us today in our fun and games", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
        Page(imageName: "santa b", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get notified of these savings immediately when we announce them on our website. Make sure to also give us any feedback you have."),
        Page(imageName: "santa c", headerText: "VIP members special services", bodyText: "Get notified of these savings immediately when we announce them on our website. Make sure to also give us any feedback you have.")
    ]
    
    
    
    
    
    
    //MARK: - UI Elements
    /* Usually View would be in another file but because we are creating
     * an interface with components that stay static we creat those in
     * this file. Everything else is in the cell
     */
    
    // Instantiating "PREV" button at the bottom left
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)                       // Set the button's title
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14) // Set title's bold font
        button.setTitleColor(.gray, for: .normal)                   // Set the button's color
        button.translatesAutoresizingMaskIntoConstraints = false    // Enable auto layout
        button.addTarget(self, action: #selector(prevButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func prevButtonPressed() {
        let prevIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: prevIndex, section: 0)                                  // Instantiate an indexpath for the next page
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)   // Scroll to the previous page
        pageControl.currentPage = prevIndex                                                     // Update page control UI
    }
    
    
    // Instantiating "NEXT" button at the bottom right
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)                       // Set the button's title
        button.translatesAutoresizingMaskIntoConstraints = false    // Enable auto layout
        button.setTitleColor(.mainPink, for: .normal)               // Set title color
        button.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside) // Call method when user taps NEXT button
        
        return button
    }()
    
    @objc private func nextButtonPressed() {
        // Below we use choose the smaller value of the 2 to avoid arrayOutOfBounds erro
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)                       // Grab the next page's index in the page control
        let indexPath = IndexPath(item: nextIndex, section: 0)                                  // Instantiate an indexpath for the next page
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)   // Scroll to the next page
        pageControl.currentPage = nextIndex                                                     // Update the page control UI
    }
    
    // Instantiating page indicator at the bottom center
    // It is a lazy var so that Swift allows us to access other properties of our class
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0                                          // Starts at the first indicator
        pc.numberOfPages = pages.count                              // Set the # of pages to # of models
        pc.translatesAutoresizingMaskIntoConstraints = false        // Enable auto layout
        pc.currentPageIndicatorTintColor = .red                     // Set the color of current indicator
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1) // Set the color of other page indicators
        
        return pc
    }()
    
    // Put all the pieces together for the bottom half of the interface
    fileprivate func setupBottomControls() {
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])  // Put the views inside our stack view
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false                               // Turn on auto layout
        view.addSubview(bottomControlsStackView)                                                                // Add our whole bottom container to our view
        bottomControlsStackView.distribution = .fillEqually                                                     // The stacks are in equal size
        
        // Activate autolayouts of these specific constraints
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),    //bottom: StackView to view.safearea
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),  //leading: Stackview to view.safearea
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),//trailing: Stackview to view.safearea
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)                                //height: Stackview to 50
            ])
    }
    
    
    
    
    
    //MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBottomControls()

        // Register our cell object to our collection view
        collectionView.register(PageCollectionViewCell.self, forCellWithReuseIdentifier: "CellId")
        
        collectionView.isPagingEnabled = true // This allows each cell to have a bounce when you scroll through them
        collectionView.backgroundColor = .white
        collectionView.scrollIndicatorInsets.bottom = 1 // Set the distance between the scroll indicator and the bottom
    }
}
