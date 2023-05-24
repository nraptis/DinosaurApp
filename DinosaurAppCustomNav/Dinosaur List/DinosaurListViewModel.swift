//
//  DinosaurListViewModel.swift
//  DinosaurAppCustomNav
//
//  Created by Tiger Nixon on 4/10/23.
//

import Foundation
import SwiftUI
import DinosaurAPI

actor DinosaurListViewModel: ObservableObject {
    
    static func mock() -> DinosaurListViewModel {
        DinosaurListViewModel(rootViewModel: RootViewModel.mock())
        
    }
    
    @MainActor @Published var dinosaurs = [Dinosaur]()
    @MainActor @Published var isLoadingDinosaurs = false
    @MainActor @Published var isLoadingDinosaurDetails = false
    
    let service = DinosaurService()
    let rootViewModel: RootViewModel
    
    init(rootViewModel: RootViewModel) {
        self.rootViewModel = rootViewModel
        print("DinosaurListViewModel => Created")
        Task {
            await loadDinosaurs()
        }
    }
    
    deinit {
        print("DinosaurListViewModel => Destroyed")
    }
    
    func loadDinosaurs() async {
        await MainActor.run { isLoadingDinosaurs = true }
        
        let _dinosaurs = await service.dinosaurs()
        
        await MainActor.run {
            dinosaurs = _dinosaurs
            isLoadingDinosaurs = false
        }
    }
    
    @MainActor func back() {
        
        /*
        print("navigationPath.count = \(navigationPath.count)")
        if navigationPath.count > 0 {
            navigationPath.removeLast()
        }
        */
    }
    
    @MainActor func choose(dinosaur: Dinosaur) async {
        isLoadingDinosaurDetails = true
        let dinosaurDetails = await service.details(dinosaur: dinosaur)
        rootViewModel.pushDinosaurDetails(dinosaur: dinosaur,
                                          dinosaurDetails: dinosaurDetails,
                                          dinosaurListViewModel: self)
        isLoadingDinosaurDetails = false
        
    }
}
