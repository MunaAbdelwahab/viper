//
//  PersonListingViewController.swift
//  VIPER
//
//  Created by Muna Abdelwahab on 3/24/21.
//

import UIKit

class PersonListingViewController: UIViewController, listingView {
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var eventHandler : ListingViewEventHandler!
    var personList = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLoading()
    }
    
    func startLoading() {
        activityIndicatorView.startAnimating()
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func finishLoading() {
        activityIndicatorView.stopAnimating()
    }
    
    func setListingData(listing: [Person]) {
        personList = listing
    }

    @IBAction func reloadButton(_ sender: Any) {
        eventHandler?.didTapShowListingButton()
        reloadTableView()
        finishLoading()
    }
    
}

extension PersonListingViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personListViewController")
        cell?.textLabel?.text = personList[indexPath.row].first_name
        cell?.detailTextLabel?.text = String(personList[indexPath.row].age)
        return cell!
    }

}
