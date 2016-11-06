//
//  MenuViewController.swift
//  ios-hamburgermenu
//
//  Created by Savio Tsui on 11/5/16.
//  Copyright © 2016 Savio Tsui. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var greenViewController: UIViewController!
    fileprivate var blueViewController: UIViewController!
    fileprivate var pinkViewController: UIViewController!
    
    var viewControllers: [UIViewController] = []
    var hamburgerViewController: HamburgerMenuViewController!
    
    let titles = ["Green", "Blue", "Pink"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        greenViewController = storyboard.instantiateViewController(withIdentifier: "GreenNavigationController")
        blueViewController = storyboard.instantiateViewController(withIdentifier: "BlueNavigationController")
        pinkViewController = storyboard.instantiateViewController(withIdentifier: "PinkNavigationController")
        
        viewControllers.append(greenViewController)
        viewControllers.append(blueViewController)
        viewControllers.append(pinkViewController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "com.saviotsui.menuviewcell", for: indexPath) as! MenuViewCell
        cell.menuTitleLabel.text = titles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        hamburgerViewController.contentViewController = self.viewControllers[indexPath.row]
        
        UIView.animate(withDuration: 0.3, animations: {
            self.hamburgerViewController.leftMarginConstraint.constant = 0
            self.hamburgerViewController.view.layoutIfNeeded()
        })
    }
}
