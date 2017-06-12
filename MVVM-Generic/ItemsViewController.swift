//
//  ItemsViewController.swift
//  MVVM-Example
//
//  Created by Ivan Magda on 08/09/16.
//  Copyright © 2016 Ivan Magda. All rights reserved.
//

import UIKit

/***
 * Source code from this talk: https://talk.objc.io/episodes/S01E06-generic-table-view-controllers
 */

final class ItemsViewController<Item, Cell: UITableViewCell>: UITableViewController {
  
  // MARK: Variables
  
  var items: [Item] = [] {
    didSet {
      tableView.reloadData()
    }
  }
  let reuseIdentifier = "Cell"
  
  let configure: (Cell, Item) -> ()
  var didSelect: (Item) -> () = { _ in }
  
  // MARK: Init
  
  init(items: [Item], configure: @escaping (Cell, Item) -> ()) {
    self.configure = configure
    super.init(style: .plain)
    self.items = items
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Life Cycle
  
  override func viewDidLoad() {
    tableView.register(Cell.self, forCellReuseIdentifier: reuseIdentifier)
  }
  
  // MARK: Delegate
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let item = items[indexPath.row]
    didSelect(item)
  }
  
  // MARK: Data Source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! Cell
    let item = items[indexPath.row]
    configure(cell, item)
    return cell
  }
  
}
