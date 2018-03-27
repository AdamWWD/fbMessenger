//
//  ViewController.swift
//  fbMessenger
//
//  Created by adamwang on 2018/3/26.
//  Copyright © 2018年 adamwang. All rights reserved.
//

import UIKit

class FriendsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Recent"
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.alwaysBounceVertical = true
        
        collectionView?.register(FriendCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
}

class FriendCell: BaseCell {
    
    let profileImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 34
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
    override func setupView() {
        
        addSubview(profileImageView)
        addSubview(dividerLineView)
        
        profileImageView.image = UIImage(named:"zuckprofile")
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        dividerLineView.translatesAutoresizingMaskIntoConstraints = false
    
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(68)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":profileImageView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(68)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":profileImageView]))
        
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-82-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":dividerLineView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":dividerLineView]))
        
        
        
        
        
    }
}

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = UIColor.blue
    }

    
    
}

