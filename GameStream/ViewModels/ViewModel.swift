//
//  ViewModel.swift
//  GameStream
//
//  Created by Arnaldo Pedrero Varela on 4/11/24.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var gamesInfo = [Game]()
    
    init() {
        let url = URL(string: "https://gamestreamapi.herokuapp.com/api/games")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            do {
                if let jsonData = data {
                    print("tamañoJSON: \(jsonData)")
                    
                    let decodedData = try JSONDecoder().decode([Game].self, from: jsonData)
                    
                    print("JSONDecodificado: \(decodedData)")
                    
                    DispatchQueue.main.async {
                        //Llenar propiedad games info con el arreglo de datos decodificados de nuestro json original
                        self.gamesInfo.append(contentsOf: decodedData)
                        
                    }
                    
                }
            }
            catch {
                print("Error: \(error)")
            }
            
        }.resume()
        
    }
}
