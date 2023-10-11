//
//  ContentViewModel.swift
//  ViewNavigation
//
//  Created by jhonathan briceno on 9/20/23.
//

import Foundation
import Combine

class ContentViewModel {
    

    var newUpdatedName = ""
    let destinationViewModel = DestinationViewModel()
    
    private var cancellables = Set<AnyCancellable>()

    init() {
        destinationViewModel.delegate = self
        registerObservables()
    }
    
    func getNewName() -> String {
       return  NamesManager.shared.updatedName
    }
    
    func registerObservables() {
        destinationViewModel.message
            .sink { [weak self] newName in
                self?.newUpdatedName = newName
            }
            .store(in: &cancellables)
    }
    
}

extension ContentViewModel: DestinationViewProtocol {
    
    func updateName(name: String) {
//        newUpdatedName = name
    }
}
