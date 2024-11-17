import SwiftUI
import Kingfisher

struct GamesView: View {
    
    @ObservedObject var todosLosVideojuegos = ViewModel()
    @State private var selectedGame: Game? = nil
    
    let formaGrid = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("marine").ignoresSafeArea()
                
                VStack {
                    Text("JUEGOS")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.top, 16)
                    
                    ScrollView {
                        LazyVGrid(columns: formaGrid, spacing: 8) {
                            ForEach(todosLosVideojuegos.gamesInfo, id: \.self) { juego in
                                
                                // Configuramos un NavigationLink directamente en lugar de usar un Button
                                NavigationLink(value: juego) {
                                    KFImage(URL(string: juego.galleryImages[0])!).resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(RoundedRectangle(cornerRadius: 4))
                                        .padding(.bottom, 12)
                                }
                            }
                        }
                        .padding(.horizontal, 6)
                    }
                }
                
                // Usamos navigationDestination para navegar usando el enlace
                .navigationDestination(for: Game.self) { game in
                    GameView(
                        url: game.videosUrls.mobile,
                        titulo: game.title,
                        studio: game.studio,
                        calificacion: game.contentRaiting,
                        anoPublicacion: game.publicationYear,
                        descripcion: game.description,
                        tags: game.tags,
                        imgsUrl: game.galleryImages
                    )
                }
            }
        }
        .onAppear {
            if let primerJuego = todosLosVideojuegos.gamesInfo.first {
                print("Primer elemento del json: \(primerJuego)")
                print("Titulo del primer elemento del json: \(primerJuego.title)")
            }
        }
    }
}

