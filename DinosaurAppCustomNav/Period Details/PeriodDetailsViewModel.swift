//
//  PeriodDetailsViewModel.swift
//  DinosaurAppCustomNav
//
//  Created by Tiger Nixon on 4/10/23.
//

import Foundation
import SwiftUI
import DinosaurAPI

actor PeriodDetailsViewModel: ObservableObject {
    
    static func mock() -> PeriodDetailsViewModel {
        PeriodDetailsViewModel(period: Period.mock(),
                               periodDetails: PeriodDetails.mock(),
                               rootViewModel: RootViewModel.mock(),
                               dinosaurListViewModel: DinosaurListViewModel.mock())
    }
    
    let period: Period
    let periodDetails: PeriodDetails
    let rootViewModel: RootViewModel
    let dinosaurListViewModel: DinosaurListViewModel
    @MainActor @Published var isLoadingDinosaurDetails = false
    
    init(period: Period,
         periodDetails: PeriodDetails,
         rootViewModel: RootViewModel,
         dinosaurListViewModel: DinosaurListViewModel) {
        
        self.period = period
        self.periodDetails = periodDetails
        self.rootViewModel = rootViewModel
        self.dinosaurListViewModel = dinosaurListViewModel
        
        print("PeriodDetailsViewModel => Created")
    }
    
    deinit {
        print("PeriodDetailsViewModel => Destroyed")
    }
    
    @MainActor func back() {
        rootViewModel.pop()
    }
    
    @MainActor func choose(dinosaur: Dinosaur) async {
        isLoadingDinosaurDetails = true
        let dinosaurDetails = await dinosaurListViewModel.service.details(dinosaur: dinosaur)
        rootViewModel.pushDinosaurDetails(dinosaur: dinosaur,
                                          dinosaurDetails: dinosaurDetails,
                                          dinosaurListViewModel: dinosaurListViewModel)
        isLoadingDinosaurDetails = false
    }
}

extension PeriodDetailsViewModel: Hashable {
    static func == (lhs: PeriodDetailsViewModel, rhs: PeriodDetailsViewModel) -> Bool {
        lhs === rhs
    }
    
    nonisolated func hash(into hasher: inout Hasher) {
        hasher.combine(self)
    }
}
