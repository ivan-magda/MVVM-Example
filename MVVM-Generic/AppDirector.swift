/**
 * Copyright (c) 2016 Ivan Magda
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

class AppDirector {
  
  // MARK: Inastance Variables
  
  private let window: UIWindow
  private let storyboard = UIStoryboard(name: "Main", bundle: nil)
  private let navigationController: UINavigationController
  
  // MARK: Init
  
  init(window: UIWindow) {
    self.window = window
    self.navigationController = window.rootViewController as! UINavigationController
    configure()
  }
  
  // MARK: Private
  
  private func configure() {
    let appsVC = ItemsViewController(items: [App](),
      configure: { (cell: AppTableViewCell<AppTableCellViewModel>, app) in
        cell.configure(withDelegate: AppTableCellViewModel(app: app))
    })
    appsVC.didSelect = showApp
    appsVC.title = "Top Apps"
    
    navigationController.viewControllers = [appsVC]
    
    weak var weakApps = appsVC
    App.all { apps in
      weakApps?.items = apps ?? [App]()
    }
  }
  
  private func showApp(_ app: App) {
    let detailVC = storyboard.instantiateViewController(withIdentifier: "Detail") as! AppDetailViewController
    detailVC.app = app
    navigationController.pushViewController(detailVC, animated: true)
  }
  
}

