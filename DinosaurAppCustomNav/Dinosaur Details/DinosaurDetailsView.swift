//
//  DinosaurDetailsView.swift
//  DinosaurAppCustomNav
//
//  Created by Tiger Nixon on 4/10/23.
//

import SwiftUI
import DinosaurAPI

struct DinosaurDetailsView: View {
    @ObservedObject var dinosaurDetailsViewModel: DinosaurDetailsViewModel
    var body: some View {
        ZStack {
            VStack(spacing: 0.0) {
                TitleBarView(title: dinosaur.name) {
                    dinosaurDetailsViewModel.back()
                }
                GeometryReader { geometry in
                    ScrollView {
                        Image(uiImage: dinosaurDetails.image)
                            .resizable()
                            .frame(width: geometry.size.width,
                                   height: (geometry.size.width / 1024.0) * dinosaurDetails.image.size.height)
                        
                        Button {
                            Task {
                                await dinosaurDetailsViewModel.choose(period: dinosaurDetails.period)
                            }
                        } label: {
                            PeriodCellView(period: dinosaurDetails.period)
                        }
                        
                        VStack {
                            ForEach(dinosaurDetails.paragraphs) { paragraph in
                                HStack {
                                    Text(paragraph.text)
                                        .font(.system(size: 16.0))
                                        .multilineTextAlignment(.leading)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .foregroundColor(Color(red: 0.36, green: 0.36, blue: 0.36))
                                    
                                    Spacer()
                                }
                                .padding(.all, 8.0)
                            }
                        }
                    }
                }
            }
            .background(Color(red: 0.925, green: 0.925, blue: 0.925))
            if dinosaurDetailsViewModel.isLoadingPeriodDetails {
                LoadingView()
            }
        }
        .toolbar(.hidden)
    }
    
    private var dinosaur: Dinosaur { dinosaurDetailsViewModel.dinosaur }
    private var dinosaurDetails: DinosaurDetails { dinosaurDetailsViewModel.dinosaurDetails }
    
}

struct DinosaurDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DinosaurDetailsView(dinosaurDetailsViewModel: DinosaurDetailsViewModel.mock())
    }
}
