//
//  HomeInteractor.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

protocol HomeBusinessLogic {
    func process()
}

class HomeInteractor: HomeBusinessLogic {
    
    private var presenter: HomePresentationLogic?
    private var worker: HomeWorker?
    
    //MARK: - inititalizer
    init(presenter: HomePresentationLogic?) {
        self.presenter = presenter
        worker = HomeWorker()
        worker?.delegate = self
    }
    
    func process() {
        //TODO: - 
    }
}

extension HomeInteractor: HomeWorkerDelegate {
    func response(_ response: Home.Response) {
        presenter?.present(response)
    }
    
    
}
