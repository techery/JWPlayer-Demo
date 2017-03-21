//
//  DetailViewController.swift
//  JWPlayerDemo
//
//  Created by Eugene on 3/21/17.
//  Copyright © 2017 Eugene Tulusha. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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

