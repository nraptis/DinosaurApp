//
//  ContentView.swift
//  DinosaurApp
//
//  Created by Tiger Nixon on 4/7/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            
            /*
            List(viewModel.dinosaurs) { dinosaur in
                VStack {
                    HStack {
                        Image(uiImage: dinosaur.thumb)
                            .resizable()
                            .frame(width: 80, height: 60)
                        VStack {
                            HStack {
                                Text(dinosaur.name)
                                    .font(.system(size: 22.0).bold())
                                Spacer()
                            }
                            HStack {
                                Text(dinosaur.meaning)
                                    .font(.system(size: 16.0).italic())
                                Spacer()
                            }
                        }
                    }
                    .padding(.all, 8.0)
                    .clipShape(RoundedRectangle(cornerRadius: 12.0))
                    .background(RoundedRectangle(cornerRadius: 12.0).stroke().foregroundColor(Color(red: 0.75, green: 0.75, blue: 0.75)))
                    .background(RoundedRectangle(cornerRadius: 12.0).foregroundColor(Color.white))
                    .padding(.all, 4.0)
                    .padding(.horizontal, 16.0)
                }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
            .listStyle(.plain)
            .background(Color(red: 0.925, green: 0.925, blue: 0.925))
            */
            
            List(viewModel.pdeets) { pdeet in
                Image(uiImage: pdeet.image)
                    .resizable()
                    .frame(width: 200, height: 150)
                ForEach(pdeet.paragraphs) { paragraph in
                    
                    Text(paragraph.text)
                        .lineLimit(100)
                        .fixedSize(horizontal: false, vertical: true)
                    
                }
                ForEach(pdeet.dinosaurs) { dinosaur in
                    Text(dinosaur.name)
                        .foregroundColor(.red)
                }
                
            }
            
            List(viewModel.details) { dinosaurDetail in
                Image(uiImage: dinosaurDetail.image)
                    .resizable()
                    .frame(width: 200, height: 150)
                ForEach(dinosaurDetail.paragraphs) { paragraph in
                    
                    Text(paragraph.text)
                        .lineLimit(100)
                        .fixedSize(horizontal: false, vertical: true)
                    
                }
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
