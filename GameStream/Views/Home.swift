import SwiftUI
import AVKit

struct Home: View {
    @State var defaultUrl = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    
    let urlVideos: [String] = [
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"
    ]
    
    @State private var selectedVideoUrl: String? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("marine").ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        Logo()
                        
                        SearchGameView()
                        FavoriteGameView(urlVideos: urlVideos, selectedVideoUrl: $selectedVideoUrl)
                        
                        CategoriesView()
                        
                        RecommendedView(urlVideos: urlVideos, selectedVideoUrl: $selectedVideoUrl)
                        
                        WhatYouLikeView(urlVideos: urlVideos, selectedVideoUrl: $selectedVideoUrl)
                    }
                    .padding(.horizontal, 18)
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
            // Usamos navigationDestination para navegar al video seleccionado
            .navigationDestination(for: String.self) { url in
                VideoPlayer(player: AVPlayer(url: URL(string: defaultUrl)!))
                    .frame(width: 400, height: 300)
            }
        }
    }
    
}

struct SearchGameView: View{
    
    @ObservedObject var juegoEncontrado = SearchGame()
    @State var isGameViewActive = false
    @State var isGameInfoEmpty = false
    @State var url:String = ""
    @State var titulo:String = ""
    @State var studio:String = ""
    @State var calificacion:String = ""
    @State var anoPublicacion:String = ""
    @State var descripcion:String = ""
    @State var tags:[String] = [""]
    @State var imgsUrl:[String] = [""]
    
    @State var searchText:String = ""
    
    var body: some View{
        HStack {
            Button(action: {watchGame(name: searchText)}, label: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(searchText.isEmpty ? Color(red: 174/255, green: 177/255, blue: 185/255) : Color("dark-cian"))
            }).alert(isPresented: $isGameInfoEmpty) {
                Alert(title: Text("Error"), message: Text("No se encontro el juego"), dismissButton: .default(Text("Entendido")))
            }
            
            ZStack(alignment: .leading) {
                if searchText.isEmpty {
                    Text("Buscar un video")
                        .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255))
                }
                TextField("", text: $searchText)
                    .foregroundColor(.white)
            }
        }
        .padding([.top, .leading, .bottom], 11)
        .background(Color("blue-gray"))
        .clipShape(Capsule())
        .navigationDestination(isPresented: $isGameViewActive) {
            GameView(url: url, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl)
        }
        
    }
    
    
    func watchGame(name:String)  {
        juegoEncontrado.search(gameName: name)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            
            
            print("Cantidad E: \(juegoEncontrado.gameInfo.count)")
            if juegoEncontrado.gameInfo.count == 0{
                
                print("No se encontro ningun juego llamado \(name)")
                
                isGameInfoEmpty = true
                
            }else{
                
                url = juegoEncontrado.gameInfo[0].videosUrls.mobile
                titulo = juegoEncontrado.gameInfo[0].title
                studio = juegoEncontrado.gameInfo[0].studio
                calificacion = juegoEncontrado.gameInfo[0].contentRaiting
                anoPublicacion = juegoEncontrado.gameInfo[0].publicationYear
                descripcion = juegoEncontrado.gameInfo[0].description
                tags = juegoEncontrado.gameInfo[0].tags
                imgsUrl = juegoEncontrado.gameInfo[0].galleryImages
                
                isGameViewActive = true
            }
        }
        
        
    }
}

struct FavoriteGameView: View {
    @State var isPlayerActive = false
    @State var urlVideos: [String]
    @Binding var selectedVideoUrl: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Title(text: "LOS MÁS POPULARES")
            
            VStack(spacing: 0) {
                NavigationLink(value: urlVideos[0]) {
                    ZStack {
                        Image("the-witcher")
                            .resizable()
                            .scaledToFill()
                        
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 42, height: 42)
                    }
                    .padding(0.0)
                }
                
                Text("The Witcher 3: Wild Hunt")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                    .background(Color("blue-gray"))
            }
        }
        .frame(minWidth: 0, maxHeight: .infinity, alignment: .center)
    }
}

struct CategoriesView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Title(text: "CATEGORÍAS SUGERIDAS PARA TI")
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Category(image: "fps", text: "FPS")
                    Category(image: "rpg", text: "RPG")
                    Category(image: "open-world", text: "OPEN WORLD")
                }
            }
        }
    }
}

struct Category: View {
    var image: String = ""
    var text: String = ""
    
    var body: some View {
        Button(action: {}, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("blue-gray"))
                    .frame(width: 160, height: 90)
                
                VStack {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 42)
                    
                    Text(text)
                        .fontWeight(.bold)
                        .foregroundColor(Color("cian"))
                }
            }
        })
    }
}

struct RecommendedView: View {
    @State var isPlayerActive = false
    @State var urlVideos: [String]
    @Binding var selectedVideoUrl: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Title(text: "RECOMENDADO PARA TI")
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    VideoGame(image: "abzu",video:  urlVideos[1])
                    
                    VideoGame(image: "crash-bandicoot", video: urlVideos[2])
                    
                    VideoGame(image: "death-stranding", video:  urlVideos[3])
                }
            }
        }
    }
}

struct WhatYouLikeView: View {
    @State var isPlayerActive = false
    @State var urlVideos: [String]
    @Binding var selectedVideoUrl: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Title(text: "VIDEOS QUE PODRÍAN GUSTARTE")
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    VideoGame(image: "cuphead", video:  urlVideos[4])
                    
                    VideoGame(image: "hades", video:  urlVideos[5])
                    
                    VideoGame(image: "grand-theft-auto-v", video: urlVideos[6])
                }
            }
        }
    }
}

struct VideoGame: View {
    @State var image: String = ""
    @State var video: String = ""
    
    var body: some View {
        NavigationLink(value:video) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 240, height: 135)
        }
    }
}

struct Title: View {
    var text: String = ""
    
    var body: some View {
        Text(text)
            .font(.title3)
            .foregroundColor(.white)
            .bold()
            .frame(minWidth: 0, maxHeight: .infinity, alignment: .leading)
            .padding(.top)
    }
}

#Preview {
    Home()
}

