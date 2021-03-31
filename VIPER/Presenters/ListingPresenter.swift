//
//  ListingPresenter.swift
//  VIPER
//
//  Created by Muna Abdelwahab on 3/24/21.
//

import Foundation

protocol ListingViewEventHandler {
    func didTapShowListingButton()
}

protocol listingView : class {
    func setListingData(listing: [Person])
    func startLoading()
    func finishLoading()
    func reloadTableView()
}

class ListingPresenter: ListingOutput, ListingViewEventHandler {
    weak var view : listingView!
    var listingProvider : ListingProvider!
    
    func receiveListingData(listingData: ListingData) {
        let listing = listingData.subject
        view.setListingData(listing: listing)
    }
    
    func didTapShowListingButton() {
        listingProvider.provideListingData()
    }
}
