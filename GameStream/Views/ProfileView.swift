//
//  ProfileView.swift
//  GameStream
//
//  Created by Arnaldo Pedrero Varela on 17/11/24.
//

import SwiftUI

struct ProfileView: View {
    @State var nombreUsuario:String = "Lorem"
    @State var imagenPerfil:UIImage = UIImage(named: "perfil-ejemplo")!
    
    var body: some View {
        NavigationStack{
            ZStack {
                
                Color("marine").ignoresSafeArea().navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                
                VStack{
                    VStack{
                        Image(uiImage: imagenPerfil ).resizable().aspectRatio(contentMode: .fill)
                            .frame(width: 180.0, height: 180.0)
                            .clipShape(Circle())
                        Text(nombreUsuario)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }.padding(EdgeInsets(top: 64, leading: 0, bottom: 32, trailing: 0))
                    
                    Text("Ajustes")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white).frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity,  alignment: .leading).padding(.leading,18)
                    
                    ModuloAjustes()
                    
                    Spacer()
                }
            } .onAppear(
                
                perform: {
                    //validar cuando no hay foto guardada
                    
                    if returnUiImage(named: "fotoperfil") != nil {
                        imagenPerfil = returnUiImage(named: "foto-perfil")!
                        
                    }else{
                        print("no encontre foto de perfil en base de datos")
                        
                    }
                    print("revisando si tengo datos en user defaults")
                    
                    if UserDefaults.standard.object(forKey: "datosUsuario") != nil {
                        
                        nombreUsuario = UserDefaults.standard.stringArray(forKey: "datosUsuario")![2]
                        print("Si encontre nombre de usuario \(nombreUsuario)")
                    }else{
                        
                        print("no encontre nombre de usuario guardado en objeto global de userdefaults")
                        
                    }
                }
            )
        }
    }
    
    
    func returnUiImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
}

struct ModuloAjustes:View {
    
    @State var isToggleOn = true
    @State var isEditProfileViewActive = false
    
    var body: some View{
        VStack{
            
            Button(action: {}, label: {
                HStack { Text("Cuenta")
                        .foregroundColor(Color.white)
                    Spacer()
                    Text(">")
                    .foregroundColor(Color.white)}.padding()
            }) .background(Color("blue-gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1.0)).padding(.horizontal, 8.0)
            
            Button(action: {}, label: {
                HStack { Text("Notificaciones")
                        .foregroundColor(Color.white)
                    Spacer()
                    
                    Toggle("", isOn: $isToggleOn)
                    
                }.padding()
            }) .background(Color("blue-gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1.0)).padding(.horizontal, 8.0)
            
            Button(action: {isEditProfileViewActive = true}, label: {
                HStack { Text("Editar Perfil")
                        .foregroundColor(Color.white)
                    Spacer()
                    Text(">")
                    .foregroundColor(Color.white)}.padding()
            }) .background(Color("blue-gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1.0)).padding(.horizontal, 8.0)
            
            
            Button(action: {}, label: {
                HStack { Text("Califica esta aplicación")
                        .foregroundColor(Color.white)
                    Spacer()
                    Text(">")
                    .foregroundColor(Color.white)}.padding()
            }) .background(Color("blue-gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1.0)).padding(.horizontal, 8.0)
            
            
        }
        .navigationDestination(isPresented: $isEditProfileViewActive) {
            EditProfileView()
        }
    }
}

#Preview {
    ProfileView()
}
