//
//  HomeView.swift
//  CountryDemo
//
//  Created by Slamet on 17/12/23.
//

import SwiftUI

// MARK: Main of View
struct HomeView: View {
    
    let useCase = GetCountryListUseCase(repository: CountryRepository.shared)
    @State private var countryList: [CountryEntity] = []
    
    var body: some View {
        List {
            ForEach(countryList, id: \.id) { country in
                CountryView(country: country)
            }
        }
        .task {
            getListCountry()
        }
    }
    
    private func getListCountry() {
        Task {
            do {
                let list = try await useCase.execute()
                countryList += list
            } catch {
                print("Error occurred: \(error)")
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
