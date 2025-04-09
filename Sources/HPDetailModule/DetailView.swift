//
//  File.swift
//
//
//  Created by Engin Gülek on 9.04.2025.
//

import Foundation
import SwiftUI
import HPCoreKit

struct DetailView<ViewModel:DetailViewModelProtocol>: View {
    @StateObject var viewModel:ViewModel
    var body: some View {
        VStack {
            if let detailCharacter = viewModel.detailCharacter {
                VStack(spacing:20) {
                    CreateImage.from(url: URL(string: detailCharacter.image),
                                     frame: 200)
                    PrimaryText(detailCharacter.fullName,boldState: true)
                    DetailCell(title:ThemeSubTitle.nickName.rawValue , data: "\(detailCharacter.nickname)")
                    DetailCell(title:ThemeSubTitle.birthdate.rawValue , data: "\(detailCharacter.birthdate)")
                    DetailCell(title:ThemeSubTitle.hogwartsHouse.rawValue , data: "\(detailCharacter.hogwartsHouse.rawValue)")
                    PrimaryText(ThemeSubTitle.children.rawValue,boldState: true)
                    if(detailCharacter.children.isEmpty) {
                        PrimaryText(ThemeSubTitle.noChild.rawValue)
                    }else{
                        ForEach(detailCharacter.children,id: \.self) { child in
                            SecondaryText(child)
                        }
                    }
                }
            } else {
                Text(viewModel.errorMessage)
            }
        }
        .navigationTitle(NavTitle.detail.rawValue)
        .task {
            await viewModel.task()
        }
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel(service: DetailService(), index: 2))
}
