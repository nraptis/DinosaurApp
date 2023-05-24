//
//  RootViewModel.swift
//  DinosaurAppCustomNav
//
//  Created by Tiger Nixon on 4/10/23.
//

import Foundation
import SwiftUI
import DinosaurAPI

enum AppPage {
    case dinosaurList(viewModel: DinosaurListViewModel)
    case dinosaurDetails(viewModel: DinosaurDetailsViewModel)
    case periodDetails(viewModel: PeriodDetailsViewModel)
}

private var appPageId = 0
struct AppPageContainer: Identifiable {
    let page: AppPage
    
    // these go from -1 to 1...
    var translationX: CGFloat
    var translationY: CGFloat
    let id: Int
    
    init(page: AppPage) {
        self.page = page
        self.translationX = 0
        self.translationY = 0
        self.id = appPageId
        appPageId += 1
    }
}

class RootViewModel: ObservableObject {
    
    static func mock() -> RootViewModel {
        RootViewModel()
    }
    
    init() {
        let dinosaurListViewModel = DinosaurListViewModel(rootViewModel: self)
        let appPage = AppPage.dinosaurList(viewModel: dinosaurListViewModel)
        let appPageContainer = AppPageContainer(page: appPage)
        push(page: appPageContainer)
    }
    
    @Published var list = [AppPageContainer]()
    
    private func snapToCenter(_ cont: inout AppPageContainer) {
        cont.translationY = 0
        cont.translationX = 0
    }
    
    private func snapToLeft(_ cont: inout AppPageContainer) {
        cont.translationY = 0
        cont.translationX = -1
    }
    
    private func snapToRight(_ cont: inout AppPageContainer) {
        cont.translationY = 0
        cont.translationX = 1
    }
    
    private func snapToTop(_ cont: inout AppPageContainer) {
        cont.translationY = -1
        cont.translationX = 0
    }
    
    private func snapToBottom(_ cont: inout AppPageContainer) {
        cont.translationY = 1
        cont.translationX = 0
    }
    
    private static let dur: TimeInterval = 0.36
    private static let dur_epsilon: TimeInterval = 0.05
    
    @ViewBuilder
    func view(page: AppPageContainer) -> some View {
        switch page.page {
        case .dinosaurList(viewModel: let viewModel):
            DinosaurListView(dinosaurListViewModel: viewModel)
        case .dinosaurDetails(viewModel: let viewModel):
            DinosaurDetailsView(dinosaurDetailsViewModel: viewModel)
        case .periodDetails(viewModel: let viewModel):
            PeriodDetailsView(periodDetailsViewModel: viewModel)
        }
    }
    
    func withAnimationAndCompletion(_ block: () -> Void, _ completion: @escaping () -> Void) {
        withAnimation(Animation.easeInOut(duration: Self.dur)) {
            block()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + Self.dur + Self.dur_epsilon) {
            completion()
        }
    }
    
    // MARK - Intent(s)
    
    func pushDinosaurDetails(dinosaur: Dinosaur,
                             dinosaurDetails: DinosaurDetails,
                             dinosaurListViewModel: DinosaurListViewModel) {
        let dinosaurDetailsViewModel = DinosaurDetailsViewModel(dinosaur: dinosaur,
                                                                dinosaurDetails: dinosaurDetails,
                                                                rootViewModel: self,
                                                                dinosaurListViewModel: dinosaurListViewModel)
        let appPage = AppPage.dinosaurDetails(viewModel: dinosaurDetailsViewModel)
        let appPageContainer = AppPageContainer(page: appPage)
        push(page: appPageContainer)
    }
    
    func pushPeriodDetails(period: Period,
                           periodDetails: PeriodDetails,
                           dinosaurListViewModel: DinosaurListViewModel) {
        let periodDetailsViewModel = PeriodDetailsViewModel(period: period,
                                         periodDetails: periodDetails,
                                         rootViewModel: self,
                                         dinosaurListViewModel: dinosaurListViewModel)
        let appPage = AppPage.periodDetails(viewModel: periodDetailsViewModel)
        let appPageContainer = AppPageContainer(page: appPage)
        push(page: appPageContainer)
    }
    
    private func push(page: AppPageContainer) {
        
        if list.count <= 0 {
            list.append(page)
        } else {
            
            list.append(page)
            
            // < - []
            snapToRight(&list[list.count - 1])
            snapToCenter(&list[list.count - 2])
            
            withAnimationAndCompletion({
                self.snapToLeft(&self.list[self.list.count - 2])
                self.snapToCenter(&self.list[self.list.count - 1])
            }, {
                
            })
        }
    }
    
    func pop() {
        
        if list.count <= 1 { return }
        
        // [] ->
        snapToCenter(&list[list.count - 1])
        snapToLeft(&list[list.count - 2])
        
        withAnimationAndCompletion({
            self.snapToCenter(&self.list[self.list.count - 2])
            self.snapToRight(&self.list[self.list.count - 1])
        }, {
            self.list.removeLast()
        })
    }
}
