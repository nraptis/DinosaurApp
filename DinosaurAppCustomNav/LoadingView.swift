//
//  LoadingView.swift
//  ThreePageNavigator
//
//  Created by Nick Raptis on 4/9/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                ZStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .tint(.white)
                        .scaleEffect(1.25)
                }
                .frame(width: 72, height: 72)
                .background(RoundedRectangle(cornerRadius: 14).fill().foregroundColor(.black.opacity(0.875)))
                Spacer()
            }
            Spacer()
        }
        .background(Color.black.opacity(0.875))
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
