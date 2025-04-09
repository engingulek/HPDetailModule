//
//  File.swift
//
//
//  Created by Engin Gülek on 9.04.2025.
//

import Foundation

protocol DetailViewModelProtocol : ObservableObject {
    var detailCharacter : DetailCharacter? {get}
    var errorMessage :String {get}
    
    func task() async
}


class DetailViewModel : DetailViewModelProtocol {
    
    @Published private(set) var detailCharacter: DetailCharacter?
    @Published private(set) var errorMessage :String = ""
    private let service:DetailServiceProtocol
    private let index:Int
    init( service:DetailServiceProtocol,index: Int) {
        self.service = service
        self.index = index
    }
    
    func task() async {
        
        await fetchDetail(index: index)
    }
}


extension DetailViewModel {
    func fetchDetail(index:Int) async {
        do{
            let detail = try await service.getCharacterDetail(index:index)
            guard let characterDetail = detail else {
                DispatchQueue.main.async {
                    self.errorMessage = "Something went wrong"
                }
                return
            }
            
            DispatchQueue.main.async {
                self.detailCharacter = characterDetail
                self.errorMessage = ""
            }
            
        }catch{
            DispatchQueue.main.async {
                self.errorMessage = "Something went wrong"
            }
        }
    }
}
