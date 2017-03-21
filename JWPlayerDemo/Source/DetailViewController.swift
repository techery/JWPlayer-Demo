//
//  DetailViewController.swift
//  JWPlayerDemo
//
//  Created by Eugene on 3/21/17.
//  Copyright © 2017 Eugene Tulusha. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!


    func configureView() {
        // Update the user interface for the detail item.

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let collectionView = self.collectionView {
            collectionView.register(VideoPlayerCollectionViewCell.self, forCellWithReuseIdentifier: "PlayerCell")
        }

        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var isOrientationLocked: Bool = false {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
}

extension DetailViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerCell", for: indexPath) as! VideoPlayerCollectionViewCell
        cell.isLandscapeSupported = !self.isOrientationLocked
        return cell
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 250)
    }

}

