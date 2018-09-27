//
//  PageCollectionViewCell.swift
//  Auto Layout Programmatically
//
//  Created by Haamed Sultani on 2018-09-27.
//  Copyright © 2018 Sultani. All rights reserved.
//

import UIKit

class PageCollectionViewCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let unwrappedPage = page else { return }
            santaImageView.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
            attributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor : UIColor.gray]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    //MARK: - UI Elements
    private var santaImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "santa a"))
        imageView.contentMode = .scaleAspectFit // Set how the image fits inside the bounds of the imageview
        imageView.translatesAutoresizingMaskIntoConstraints = false // Enable auto layout
        
        return imageView
    }()
    
    private var descriptionTextView: UITextView = {
        let textView = UITextView()
        var attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor : UIColor.gray]))
        textView.attributedText = attributedText
        textView.textAlignment = .center // Center the text in the textview
        textView.isEditable = false
        textView.isScrollEnabled = false
        // This enables auto layout for our imageview
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    
    //MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout() // Configure the UI elements
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: - UI Setup Method
    private func setupLayout() {
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false //Enable auto layout
        
        // Top center image
        topImageContainerView.addSubview(santaImageView)
        santaImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        santaImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        santaImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        santaImageView.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor, multiplier: 0.5).isActive = true
        
        // Description
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    
}
