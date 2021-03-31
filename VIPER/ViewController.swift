//
//  ViewController.swift
//  VIPER
//
//  Created by Muna Abdelwahab on 3/25/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showView(_ sender: Any) {
        let listingController = (storyboard?.instantiateViewController(identifier: "PersonListingViewController"))! as PersonListingViewController
        let presenter = ListingPresenter()
        let interacator = ListingInteractor()
        
        presenter.view = listingController
        
        interacator.output = presenter
        presenter.listingProvider = interacator
        
        listingController.eventHandler = presenter
        present(listingController, animated: true, completion: nil)
    }
}
