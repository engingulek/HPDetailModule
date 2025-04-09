//
//  File.swift
//  
//
//  Created by Engin Gülek on 9.04.2025.
//

import Foundation

import SwiftUI
import HPCoreKit
struct DetailCell: View {
    let title:String
    let data:String
   
    var body: some View {
        HStack {
            SecondaryText(title,boldState: true)
            SecondaryText(data,boldState: false)
            
        }
    }
}

#Preview {
    DetailCell(title: "", data: "")
}
