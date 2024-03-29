//
//  IRCodeGen.swift
//  ParsingPipelines
//
//  Created by Rajveer Singh on 16/02/24.
//

import SwiftUI

struct IRCodeGen: View {
    @State var irText: String = """
    @.str = internal constant [14 x i8] c"Hello, world\\0A\\00"

    declare i32 @printf(ptr, ...)

    define i32 @main(i32 %argc, ptr %argv) nounwind {
    entry:
        %tmp1 = getelementptr [14 x i8], ptr @.str, i32 0, i32 0
        %tmp2 = call i32 (ptr, ...) @printf( ptr %tmp1 ) nounwind
        ret i32 0
    }
    """
    
    @State var snippetToggle: Bool = false
    @State var toggleText: String = "LLVM IR"
    
    var body: some View {
        NavigationStack {
            Text("IR Code Generation and Optimization")
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            
            VStack {
                Divider()
                    .background(.orange)
                Text(!snippetToggle ? irText : "Hello World!")
                .font(.footnote)
                .bold()
                .lineLimit(nil)
                .animation(.bouncy(duration: 1.5), value: snippetToggle)
                Divider()
                    .background(.orange)
                Spacer()
                Toggle(isOn: $snippetToggle) {
                    Text(!snippetToggle ? "LLVM IR" : "Actual Code")
                        .italic()
                    Image(systemName: "play.fill")
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 25.0)
                        .stroke(lineWidth: 1.0)
                }
                .foregroundStyle(.foreground)
                .toggleStyle(.button)
                .onSubmit {
                    snippetToggle.toggle()
                }
            }
            
            TabView {
                ParagraphTextView(text: "An intermediate representation is used internally by the compiler to represent source code.")
                ParagraphTextView(text: "A simple program looks like this in IR format! 😳")
            }
            .tabViewStyle(.page)
            .frame(minHeight: 250)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            NavigationLinkView(destinationView: SummaryView(), isRestart: false)
        }
        .modifier(NavigationBarBackButtonViewModifier())
    }
}

#Preview {
    IRCodeGen()
}
