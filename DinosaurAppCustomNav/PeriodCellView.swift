//
//  PeriodCellView.swift
//  PackageJams
//
//  Created by Nick Raptis on 4/8/23.
//

import SwiftUI
import DinosaurAPI

struct PeriodCellView: View {
    let period: Period
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text(period.name)
                        .font(.system(size: 22.0).bold())
                        .foregroundColor(Color(red: 0.225, green: 0.225, blue: 0.225))
                    Spacer()
                }
                HStack {
                    Text(period.timeSpan)
                        .font(.system(size: 16.0).italic())
                        .foregroundColor(Color(red: 0.36, green: 0.36, blue: 0.36))
                    Spacer()
                }
            }
            .padding(.all, 8.0)
            .clipShape(RoundedRectangle(cornerRadius: 12.0))
            .background(RoundedRectangle(cornerRadius: 12.0).stroke().foregroundColor(Color(red: 0.75, green: 0.75, blue: 0.75)))
            .background(RoundedRectangle(cornerRadius: 12.0).foregroundColor(Color.white))
            .padding(.all, 4.0)
            .padding(.horizontal, 16.0)
        }
    }
}

struct PeriodCellView_Previews: PreviewProvider {
    static var previews: some View {
        PeriodCellView(period: Period.mock())
    }
}
