//
//  DetailInteractor.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/3/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

protocol DetailDataSource {
    var photo: Home.ViewModel.DisplayedPhoto? { get set }
}

protocol DetailBusinessLogic {
    func process(_ request: Detail.Request)
}

class DetailInteractor: NSObject, DetailDataSource {
    var photo: Home.ViewModel.DisplayedPhoto?
    
    private var presenter: DetailPresentationLogic?
    private var worker: DetailWorker?
    
    //MARK: - inititalizer
    init(presenter: DetailPresentationLogic?) {
        self.presenter = presenter
        worker = DetailWorker()
    }
}

extension DetailInteractor: DetailBusinessLogic {
    func process(_ request: Detail.Request) {
        
    }
}
