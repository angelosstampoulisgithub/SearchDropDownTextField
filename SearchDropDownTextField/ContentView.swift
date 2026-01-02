//
//  ContentView.swift
//  SearchDropDownTextField
//
//  Created by Angelos Staboulis on 2/1/26.
//

import SwiftUI

struct ContentView: View {
    let countries = [
           "Greece", "Germany", "France",
           "Italy", "Spain", "Portugal",
           "Netherlands", "Belgium"
       ]
       
       var body: some View {
           VStack {
               SearchDropdownTextField(items: countries)
               Spacer()
           }
           .padding()
       }
}

#Preview {
    ContentView()
}
