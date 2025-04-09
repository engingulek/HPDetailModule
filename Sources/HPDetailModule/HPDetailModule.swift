// The Swift Programming Language
// https://docs.swift.org/swift-book

import HPModularProtocolsKit
import SwiftUI

public class HPDetailModule : DetailModuleProrocol {
    public init() {}
    public func createDetailModuleView(index: Int) -> AnyView {
        let service = DetailService()
        let viewModel = DetailViewModel(service: service, index: index)
        let view = DetailView(viewModel: viewModel)
        return AnyView(view)
    }
}
