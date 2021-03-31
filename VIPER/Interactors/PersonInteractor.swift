//
//  PersonInteractor.swift
//  VIPER
//
//  Created by Muna Abdelwahab on 3/24/21.
//

import Foundation

protocol ListingProvider {
    func provideListingData()
}

protocol ListingOutput : class {
    func receiveListingData(listingData: ListingData)
}

class ListingInteractor : ListingProvider {
    weak var output : ListingOutput?
    
    func provideListingData() {
        let url = URL(string: "https://learnappmaking.com/ex/users.json")
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) { [self] (data, response, error) in
            do{
                let decoder = JSONDecoder()
                let personArray = try decoder.decode([Person].self, from: data!)
                let listingData = ListingData(subject: personArray)
                output?.receiveListingData(listingData: listingData)
            }catch let error{
                print(error)
            }
        }
        task.resume()
    }
}
