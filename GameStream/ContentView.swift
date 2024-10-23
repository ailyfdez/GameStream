//
//  ContentView.swift
//  GameStream
//
//  Created by Arnaldo Pedrero Varela on 21/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 19/255, green: 30/255, blue: 53/255,opacity: 1)
            
            VStack{
                Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom , 60)
                InitAndRegisterView()
            }
        }
    }
}


struct InitAndRegisterView:View {
    @State var initSessionType = true
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button("INICIA SESSION"){
                    initSessionType=true
                    print("inicio")
                }.foregroundColor(initSessionType ? .white : .gray)
                Spacer()
                Button("REGISTRATE"){
                    initSessionType=false
                    print("registro")
                }.foregroundColor(initSessionType ? .gray : .white)
                Spacer()
            }
            
            Spacer(minLength: 42)
            if(initSessionType==true){
                InitSessionView()
            }
            else{
                RegistryView()
            }
        }
    }
}

struct InitSessionView:View{
    @State var mail=""
    @State var password=""
    
    var body: some View{
        ScrollView{
            VStack(alignment: .leading){
                Text("Correo Electrónico").foregroundColor(Color("dark-cian"))
                ZStack(alignment: .leading){
                    if(mail.isEmpty){
                        Text("Escribe tu correo")
                            .font(.caption)
                            .foregroundColor( .gray)
                    }
                    TextField("",text: $mail)
                    
                }
                Divider()
                    .frame(height: 1)
                    .background(Color("dark-cian"))
                    .padding(.bottom)
                
                
                Text("Contraseña").foregroundColor(.white)
                ZStack(alignment: .leading){
                    if(password.isEmpty){
                        Text("Escribe tu contraseña")
                            .font(.caption)
                            .foregroundColor( .gray)
                    }
                    SecureField("",text: $password)
                    
                }
                Divider()
                    .frame(height: 1)
                    .background(Color("dark-cian"))
                    .padding(.bottom)
                
                Text("¿Olvidaste tu contraseña?")
                    .font(.footnote)
                    .frame(width: 300, alignment: .trailing)
                    .foregroundColor(Color("dark-cian"))
                    .padding(.bottom)
                
                Button(action: initSession, label: {
                    Text("INICIAR SESIÓN")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth:.infinity,alignment:.center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("dark-cian"),lineWidth: 1.0).shadow(color:.white, radius: 6.0))
                }).padding(.bottom)
                
                Text("Inicia sesión con redes sociales").foregroundColor(.white).frame(maxWidth:.infinity, alignment: .center)
                
                HStack{
                    Button(action: initSession, label: {
                        Text("Facebook")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth:.infinity,alignment:.center)
                            .padding(.vertical,3.0)
                            .background(Color("blue-gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                    }).padding()
                    
                    Button(action: initSession, label: {
                        Text("Twitter")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth:.infinity,alignment:.center)
                            .padding(.vertical,3.0)
                            .background(Color("blue-gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                    }).padding()
                }
                
                
            }.padding(.horizontal,42.0)
        }
    }
}

func initSession(){
    print("iniciar session")
}

struct RegistryView:View{
    var body: some View{
        Text("Registro")
    }
}

#Preview {
    ContentView()
}
