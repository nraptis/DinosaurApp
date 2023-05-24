//
//  DinosaurListView.swift
//  DinosaurAppCustomNav
//
//  Created by Tiger Nixon on 4/10/23.
//

import SwiftUI

struct DinosaurListView: View {
    @ObservedObject var dinosaurListViewModel: DinosaurListViewModel
    var body: some View {
        ZStack {
            VStack(spacing: 0.0) {
                TitleBarView(title: "Dinosaurs", backAction: nil)
                ScrollView {
                    VStack(spacing: 0.0) {
                        ForEach(dinosaurListViewModel.dinosaurs) { dinosaur in
                            Button {
                                Task {
                                    await dinosaurListViewModel.choose(dinosaur: dinosaur)
                                }
                            } label: {
                                DinosaurCellView(dinosaur: dinosaur)
                            }
                        }
                    }
                    .padding(.top, 16.0)
                }
            }
            
            if dinosaurListViewModel.isLoadingDinosaurs ||
                dinosaurListViewModel.isLoadingDinosaurDetails {
                LoadingView()
            }
        }
    }
}

struct DinosaurListView_Previews: PreviewProvider {
    static var previews: some View {
        DinosaurListView(dinosaurListViewModel: DinosaurListViewModel.mock())
    }
}
