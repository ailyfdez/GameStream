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
                MailInputTextView(text: $mail)
                
                PassInputText(text: $password)
                Text("¿Olvidaste tu contraseña?")
                    .font(.footnote)
                    .frame(width: 300, alignment: .trailing)
                    .foregroundColor(Color("dark-cian"))
                    .padding(.bottom)
                
                LoginButton(label: "INICIAR SESIÓN", action: initSession).padding(.bottom)
                
                SocialMedia(headerText: "Inicia sesión con redes sociales")
                
            }.padding(.horizontal,42.0)
        }
    }
}

func initSession(){
    print("iniciar session")
}

struct RegistryView:View{
    @State var mail=""
    @State var password=""
    @State var confirPass=""
    
    var body: some View{
        ScrollView{
            VStack(alignment: .leading){
                MailInputTextView(text: $mail)
                
                PassInputText(text: $password, label: "Contraseña*")
                PassInputText(text: $confirPass, label: "Confirmar contraseña*")
                
                LoginButton(label: "REGÍSTRATE", action: registry).padding(.bottom)
                
                SocialMedia(headerText: "Regístrate con redes sociales")
                
            }.padding(.horizontal,42.0)
        }
    }
}

func registry(){
    print("registarse")
}

#Preview {
    ContentView()
}
