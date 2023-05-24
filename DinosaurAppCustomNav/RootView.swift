//
//  RootView.swift
//  DinosaurAppCustomNav
//
//  Created by Tiger Nixon on 4/10/23.
//

import SwiftUI

struct RootView: View {
    
    @ObservedObject var viewModel: RootViewModel
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(viewModel.list) { container in
                    viewModel.view(page: container)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: container.translationX * geometry.size.width,
                                y: container.translationY * geometry.size.height)
                }
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(viewModel: RootViewModel.mock())
    }
}
