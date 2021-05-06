//
//  SearchField.swift
//  Countries
//
//  Created by Martin Václavík on 29/01/2020.
//  Copyright © 2020 Martin Václavík. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    @EnvironmentObject var viewModel: NationListViewModel
    var body: some View {
        HStack{
            HStack{
                Image(systemName: "magnifyingglass")
                    .padding(7)
                    .foregroundColor(Color.secondary.opacity(0.6))
                TextField("Search", text: $viewModel.search)
            }
            .padding(5)
            .background(Color.init(red: 0.463, green: 0.463, blue: 0.502, opacity: 0.12))
            .cornerRadius(10)
            .animation(.spring())
            Button(action: {
                withAnimation{
                    viewModel.showSearch = false
                    viewModel.search = ""
                }
            }) {
                Text("Cancel").padding(.horizontal, 3)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar().environmentObject(NationListViewModel()).padding()
        .previewLayout(.sizeThatFits)
    }
}
