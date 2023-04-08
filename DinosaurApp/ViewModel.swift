//
//  ViewModel.swift
//  DinosaurApp
//
//  Created by Tiger Nixon on 4/7/23.
//

import Foundation
import DinosaurAPI

actor ViewModel: ObservableObject {
    
    @MainActor @Published var dinosaurs = [Dinosaur]()
    @MainActor @Published var details = [DinosaurDetails]()
    @MainActor @Published var pdeets = [PeriodDetails]()
    
    
    
    private let service = DinosaurService()
    
    init() {
        
        
        //Task { @MainActor
        //    dinosaurs = await service.dinosaurs()
        //}
        Task {
            await fetchDinosaurs()
        }
    }
    
    @MainActor
    func fetchDinosaurs() async {
        
        self.dinosaurs = await service.dinosaurs()
        
        self.details = [await service.details(dinosaur: dinosaurs.first!)]
        
        self.pdeets = [await service.details(period: details.first!.period)]
        
        print("details = \(details)")
    }
    
    
    
}
