//
//  ViewController.swift
//  CopyYT
//
//  Created by 42media on 2018. 10. 10..
//  Copyright © 2018년 42media. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "HOME"
        collectionView?.backgroundColor = UIColor.white
        collectionView.register(YouTubeVideoCell.self, forCellWithReuseIdentifier: "homeCellId")
        //view.backgroundColor = UIColor.blue
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCellId", for: indexPath)
        
        cell.backgroundColor = UIColor.red
        
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    class YouTubeVideoCell: UICollectionViewCell {
        override init(frame: CGRect) {
            super.init(frame: frame)
            setUpViews()
        }
        
        let videoThumnailView: UIImageView = {
            let imageView = UIImageView()
            imageView.backgroundColor = UIColor.green
            return imageView
        }()
        
        let userImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.backgroundColor = UIColor.blue
            return imageView
        }()
        
        let seperotorView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.black
            return view
        }()
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.backgroundColor = UIColor.orange
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let subtitleTextView: UITextView = {
            let textView = UITextView()
            textView.backgroundColor = UIColor.cyan
            textView.translatesAutoresizingMaskIntoConstraints = false
            return textView
        }()
        
        func setUpViews() {
            addSubview(videoThumnailView)
            addSubview(seperotorView)
            addSubview(userImageView)
            addSubview(titleLabel)
            addSubview(subtitleTextView)
            //videoThumnailView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
            
            // addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":videoThumnailView]))
            // addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-[v1(1)]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":videoThumnailView, "v1":seperotorView]))
            addConstraints(format: "H:|-10-[v0]-10-|",views :videoThumnailView)
            addConstraints(format: "H:|-10-[v0(44)]|",views :userImageView)
            addConstraints(format: "V:|-10-[v0]-8-[v1(44)]-16-[v2(1)]|",views :videoThumnailView, userImageView, seperotorView)
            addConstraints(format: "H:|[v0]|",views :seperotorView)
            
            //title LAbel
            //top
            addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: videoThumnailView, attribute: .bottom, multiplier: 1, constant: 8))
            //left
            addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userImageView, attribute: .right, multiplier: 1, constant: 8))
            //right
            addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: videoThumnailView, attribute: .right, multiplier: 1, constant: 0))
            //height
            addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
            
            //subtitle TextView
            //top
            addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 8))
            //left
            addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userImageView, attribute: .right, multiplier: 1, constant: 8))
            //right
            addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: videoThumnailView, attribute: .right, multiplier: 1, constant: 0))
            //height
            addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
            
            // addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":seperotorView]))
            // addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(1)]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":seperotorView]))
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    
}

extension UIView {
    func addConstraints(format: String, views: UIView...) {
        var viewsDict = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDict[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false;
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDict))
    }
}
