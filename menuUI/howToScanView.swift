//
//  howToScanView.swift
//  menuUI
//
//  Created by Michelle Alexandra on 07/11/22.
//

import SwiftUI

struct DottedLine: Shape {
    var geo: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: geo * 0.75))
        return path
    }
}

struct howTo: View {
    var number: String
    var title: String
    var desc: String
    var image: String

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Circle()
                .fill(.gray)
                .frame(width: 30)
                .overlay(
                    Text(number)
                        .font(.system(.body))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                )
            VStack(alignment: .leading) {
                Text(title).font(.system(.title3)).fontWeight(.bold)
                Text(desc).font(.system(.body)).fixedSize(horizontal: false, vertical: true)
                Image(image)
            }.padding(.bottom)
        }
    }
}

struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            ZStack {
                GeometryReader { geometry in
                    HStack {
                        DottedLine(geo: geometry.size.height)
                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
                            .frame(width: 1, height: .infinity)
                            .foregroundColor(Color.black)
                        Spacer()
                    }.padding()
                }
                VStack(alignment: .leading) {
                    howTo(number: "1", title: "Find QR code in the card", desc: "You should find the QR code in the box.", image: "QRcode")
                    howTo(number: "2", title: "Scan QR code to play", desc: "Point the camera at the QR code", image: "ScanQRcode")
                    howTo(number: "3", title: "Confirm to start", desc: "A pop-up will shown and tap the “Yes” button to start the game", image: "")
                    howTo(number: "4", title: "Have fun", desc: "Find a comfortable place and some snacks to play the game.", image: "")

                        .navigationBarTitle(Text("How to Scan"), displayMode: .inline)
                        .navigationBarItems(trailing: Button(action: {
                            print("Dismissing sheet view...")
                            dismiss()
                        }) {
                            Text("Done").bold()
                        })
                    Button(action: {
                        print("report tapped")
                    }, label: {
                        Text("Report an issue")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .foregroundColor(.white)
                            .font(.system(.body))
                            .fontWeight(.bold)
                            .padding()
                            .background(.black)
                            .cornerRadius(12)
                    }).frame(maxHeight: .infinity, alignment: .bottom)
                }
            }.padding()
        }
    }
}

struct howToScanView: View {
    @State private var showingSheet = false
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SheetView()
        }
    }
}

struct howToScanView_Previews: PreviewProvider {
    static var previews: some View {
        howToScanView()
    }
}
