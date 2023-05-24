//
//  PeriodDetailsView.swift
//  DinosaurAppCustomNav
//
//  Created by Tiger Nixon on 4/10/23.
//

import SwiftUI
import DinosaurAPI

struct PeriodDetailsView: View {
    @ObservedObject var periodDetailsViewModel: PeriodDetailsViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 0.0) {
                TitleBarView(title: period.name) {
                    periodDetailsViewModel.back()
                }
                GeometryReader { geometry in
                    ScrollView {
                        Image(uiImage: periodDetails.image)
                            .resizable()
                            .frame(width: geometry.size.width,
                                   height: (geometry.size.width / 1024.0) * periodDetails.image.size.height)
                        
                        VStack {
                            ForEach(periodDetails.paragraphs) { paragraph in
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
                        
                        ForEach(periodDetails.dinosaurs) { dinosaur in
                            Button {
                                Task {
                                    await periodDetailsViewModel.choose(dinosaur: dinosaur)
                                }
                            } label: {
                                DinosaurCellView(dinosaur: dinosaur)
                            }
                        }
                    }
                }
            }
            .background(Color(red: 0.925, green: 0.925, blue: 0.925))
            
            if periodDetailsViewModel.isLoadingDinosaurDetails {
                LoadingView()
            }
        }
        .toolbar(.hidden)
    }
    
    private var period: Period { periodDetailsViewModel.period }
    private var periodDetails: PeriodDetails { periodDetailsViewModel.periodDetails }
}

struct PeriodDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PeriodDetailsView(periodDetailsViewModel: PeriodDetailsViewModel.mock())
    }
}
