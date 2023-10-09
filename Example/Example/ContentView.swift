//
//  ContentView.swift
//  Example
//
//  Created by knight on 2023/10/9.
//

import SwiftUI
import OpenCC

struct ContentView: View {
    let from = "鼠标里面的硅二极管坏了，导致光标分辨率降低。"
    @State var translated = ""

    var body: some View {
        VStack {
            Text(from)
            Button(action: {
                translate()
            }, label: {
                Text("Translate")
            })
            Text(translated)
        }
        .padding()
    }
    
    func translate() {
        do {
            let converter = try ChineseConverter(options: [.traditionalize, .twStandard, .twIdiom])
            translated = converter.convert(from)
        } catch {
            print("error: \(error)")
        }
    }
}

#Preview {
    ContentView()
}
