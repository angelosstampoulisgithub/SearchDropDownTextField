//
//  SearchDropDownTextField.swift
//  SearchDropDownTextField
//
//  Created by Angelos Staboulis on 2/1/26.
//

import SwiftUI
struct SearchDropdownTextField: View {
    @State private var text: String = ""
    @State private var showDropdown = false
    
    let items: [String]
    
    var filteredItems: [String] {
        if text.isEmpty {
            return []
        }
        return items.filter {
            $0.localizedCaseInsensitiveContains(text)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            TextField("Search...", text: $text)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.6))
                )
                .onChange(of: text) {
                    showDropdown = !filteredItems.isEmpty
                }
            
            if showDropdown {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(filteredItems, id: \.self) { item in
                        Text(item)
                            .padding(10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.white)
                            .onTapGesture {
                                text = item
                                showDropdown = false
                            }
                        
                        Divider()
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.4))
                        .background(Color.white)
                )
                .transition(.opacity)
            }
        }
        .animation(.easeInOut, value: showDropdown)
    }
}
