//
//  ListViewController.swift
//  JWPlayerDemo
//
//  Created by Eugene on 3/21/17.
//  Copyright © 2017 Eugene Tulusha. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var objects = [String]()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupStrings()
        self.tableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = true
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupStrings() {
        objects.append("Player Orientation locked")
        objects.append("Player Orientation unlocked (Crash issue on rotate)")
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let index = indexPath.row
                let controller = segue.destination as! DetailViewController
                controller.isOrientationLocked = (index == 0)
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        if let textLabel = cell.textLabel {
            textLabel.text = objects[indexPath.row]
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

}

