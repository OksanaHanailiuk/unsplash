//
//  DetailInteractor.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/3/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

protocol DetailDataSource {
    var photo: Photo? { get set }
}

protocol DetailBusinessLogic {
    func process()
}

class DetailInteractor: DetailDataSource {
    var photo: Photo?
    
    private var presenter: DetailPresentationLogic?
    private var worker: DetailWorker?
    
    //MARK: - inititalizer
    init(presenter: DetailPresentationLogic?) {
        self.presenter = presenter
        worker = DetailWorker()
        worker?.delegate = self
    }
}

extension DetailInteractor: DetailBusinessLogic {
    func process() {
        worker?.photoDetail(dataSource: self)
    }
}

extension DetailInteractor: DetailWorkerDelegate {
    
    func response(_ response: Detail.Response) {
        presenter?.present(response)
    }
}
