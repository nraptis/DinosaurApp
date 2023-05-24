//
//  DinosaurDetailsViewModel.swift
//  DinosaurAppCustomNav
//
//  Created by Tiger Nixon on 4/10/23.
//

import SwiftUI
import DinosaurAPI

actor DinosaurDetailsViewModel: ObservableObject {
    
    static func mock() -> DinosaurDetailsViewModel {
        DinosaurDetailsViewModel(dinosaur: Dinosaur.mock(),
                                 dinosaurDetails: DinosaurDetails.mock(),
                                 rootViewModel: RootViewModel.mock(),
                                 dinosaurListViewModel: DinosaurListViewModel.mock())
    }
    
    let dinosaur: Dinosaur
    let dinosaurDetails: DinosaurDetails
    let rootViewModel: RootViewModel
    let dinosaurListViewModel: DinosaurListViewModel
    @MainActor @Published var isLoadingPeriodDetails = false
    
    init(dinosaur: Dinosaur,
         dinosaurDetails: DinosaurDetails,
         rootViewModel: RootViewModel,
         dinosaurListViewModel: DinosaurListViewModel) {
        self.dinosaur = dinosaur
        self.dinosaurDetails = dinosaurDetails
        self.rootViewModel = rootViewModel
        self.dinosaurListViewModel = dinosaurListViewModel
        print("DinosaurDetailsViewModel => Created")
    }
    
    deinit {
        print("DinosaurDetailsViewModel => Destroyed")
    }
    
    @MainActor func back() {
        rootViewModel.pop()
    }
    
    @MainActor func choose(period: Period) async {
        isLoadingPeriodDetails = true
        let periodDetails = await dinosaurListViewModel.service.details(period: period)
        rootViewModel.pushPeriodDetails(period: period,
                                        periodDetails: periodDetails,
                                        dinosaurListViewModel: dinosaurListViewModel)
        isLoadingPeriodDetails = false
    }
}

extension DinosaurDetailsViewModel: Hashable {
    static func == (lhs: DinosaurDetailsViewModel, rhs: DinosaurDetailsViewModel) -> Bool {
        lhs === rhs
    }
    
    nonisolated func hash(into hasher: inout Hasher) {
        hasher.combine(self)
    }
}
