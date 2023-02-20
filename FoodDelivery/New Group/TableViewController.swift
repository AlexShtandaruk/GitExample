//
//  TableViewController.swift
//  FoodDelivery
//
//  Created by Alex Shtandaruk on 10.02.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    let array = ["Cash",
                 "By card now",
                 "By card to courier",
                 "Give it for free please"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isScrollEnabled = false
        view.backgroundColor = .blue
    }
    
    override func viewWillLayoutSubviews() {
        preferredContentSize = CGSize(width: 250, height: tableView.contentSize.height)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        let textData = array[indexPath.row]
        cell.textLabel?.text = textData
        return cell
    }
}

