//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.09.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var user: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(user.name)")
                .font(.largeTitle)
                .padding(.top, 80)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 80)

            ButtonView(timer: timer)
                .padding(.top, 80)
            Spacer()
            ButtonLogOut()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button(action: timer.startTimer) {
            Text(timer.buttonTitle)
        }
        .modifier(customButtonModifier(backgroundColor: .red))
    }
}

struct ButtonLogOut: View {
    @EnvironmentObject private var user: UserManager
    
    var body: some View {
        Button("LogOut") {
            user.isRegister = false
            
        }
        .modifier(customButtonModifier(backgroundColor: .blue))
    }
}

struct customButtonModifier: ViewModifier {
    let backgroundColor: Color
    func body(content: Content) -> some View {
        content
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(width: 200, height: 60)
            .background(backgroundColor)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.black, lineWidth: 4)
            )
    }
}
