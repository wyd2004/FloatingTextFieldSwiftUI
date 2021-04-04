//
//  ContentView.swift
//  FloatingTextFieldSwiftUI
//
//  Created by 王一丁 on 2021/4/4.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    @State var email: String = ""
    var body: some View {
        VStack {
            FloatingTextField(placeHolder: "Name", text: $name)
            FloatingTextField(placeHolder: "Email", text: $email)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

