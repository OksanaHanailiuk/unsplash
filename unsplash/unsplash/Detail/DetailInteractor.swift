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

class DetailInteractor: DetailDataSource {
    var photo: Home.ViewModel.DisplayedPhoto?
}
