//
//  BackBarView.swift
//  ThreePageNavigator
//
//  Created by Nick Raptis on 4/9/23.
//

import SwiftUI

struct TitleBarView: View {
    
    let title: String
    let backAction: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack {
                if let backAction = backAction {
                    Button {
                        backAction()
                    } label: {
                        ZStack {
                            Image(systemName: "arrow.left.circle.fill")
                                .resizable()
                                .frame(width: 32.0, height: 32.0)
                        }
                        .frame(width: 44.0, height: 44.0)
                    }
                }
                
                HStack {
                    Text(title)
                        .font(.system(size: 24.0).bold())
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }
                
            }
            .padding(.horizontal, 16.0)
            .padding(.vertical, 8.0)
            .foregroundColor(Color(red: 0.225, green: 0.225, blue: 0.225))
            
            HStack {
                Spacer()
            }
            .frame(height: 1.0)
            .background(Color(red: 0.68, green: 0.68, blue: 0.68))
        }
        .background(Color(red: 0.92, green: 0.92, blue: 0.92))
    }
}

struct TitleBarView_Previews: PreviewProvider {
    static var previews: some View {
        TitleBarView(title: "Page 1") { }
    }
}
