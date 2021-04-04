//
//  FloatingTextField.swift
//  FloatingTextFieldSwiftUI
//
//  Created by 王一丁 on 2021/4/4.
//

import SwiftUI

struct FloatingTextField: View {
    let textFieldHeight: CGFloat = 50
    private let placeHolderText: String
    @Binding var text: String
    @State private var isEditing = false
    public init(placeHolder: String,
                text: Binding<String>) {
        self._text = text
        self.placeHolderText = placeHolder
    }
    var shouldPlaceHolderMove: Bool {
        isEditing || (text.count != 0)
    }
    var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $text, onEditingChanged: { (edit) in
                isEditing = edit
            })
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 8)
            .stroke(Color.secondary, lineWidth: 1)
            .frame(height: textFieldHeight))
            .foregroundColor(Color.primary)
            .accentColor(Color.secondary)
            .animation(.linear)
            ///Floating Placeholder
            Text(placeHolderText)
            .foregroundColor(Color.secondary)
                .background(Color(UIColor.systemBackground))
            .padding(shouldPlaceHolderMove ?
                     EdgeInsets(top: 0, leading:15, bottom: textFieldHeight, trailing: 0) :
                     EdgeInsets(top: 0, leading:15, bottom: 0, trailing: 0))
            .scaleEffect(shouldPlaceHolderMove ? 1.0 : 1.2)
            .animation(.linear)
        }
    }
}

//struct demo: View {
//    @State var name: String = ""
//    @State var email: String = ""
//    var body: some View {
//        VStack {
//            FloatingTextField(placeHolder: "Name", text: $name)
//            FloatingTextField(placeHolder: "Email", text: $email)
//        }.padding()
//    }
//}

struct FloatingTextField_Previews: PreviewProvider {
    @State var name: String = ""
    static var previews: some View {
        FloatingTextField(placeHolder: "测试", text: .constant(""))
    }
}
