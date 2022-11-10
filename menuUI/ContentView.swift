//
//  ContentView.swift
//  menuUI
//
//  Created by Michelle Alexandra on 31/10/22.
//

import PolyKit
import SwiftUI

struct ContentView: View {
    @State var degree = 0.00
    let array: [myVal] = [myVal(val: "1"),
                          myVal(val: "2"),
                          myVal(val: "3"),
                          myVal(val: "4"),
                          myVal(val: "5"),
                          myVal(val: "6"),
                          myVal(val: "7"),
                          myVal(val: "8"),
                          myVal(val: "9"),
                          myVal(val: "10"),
                          myVal(val: "11"),
                          myVal(val: "12")]
    @Binding var changeView: Bool

    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    Color("Background").ignoresSafeArea()
                    Image("Pandora").resizable().scaledToFit().ignoresSafeArea()
                    //                Color.orange.opacity(0.4).ignoresSafeArea().hueRotation(Angle(degrees: degree))
                    //                    QR
                    VStack(alignment: .leading, spacing: 10) {
                        Spacer()

                        //            detail
                        HStack(spacing: 20) {
                            VStack(spacing: 5) {
                                Text("Duration").fontWeight(.bold).font(.subheadline)
                                Text("60").font(.body).fontWeight(.bold)
                                Text("Minutes").font(.caption)
                            }
                            VStack(spacing: 5) {
                                Text("Genre").fontWeight(.bold).font(.subheadline)
                                Image(systemName: "wand.and.stars.inverse").font(.body)
                                Text("Fantasy").font(.caption)
                            }
                            VStack(spacing: 5) {
                                Text("Difficulty").fontWeight(.bold).font(.subheadline)
                                Image("Diff1").resizable()
                                    .scaledToFit()
                                    .frame(height: 20)
                                Text("Easy").font(.caption)
                            }
                        }
                        //                Desc
                        Text("You are an ordinary girl who lives in Olympus, home of the almighty Gods. Your deepest desire is to be on equal footing with them, to become a Demigod.").font(.footnote).multilineTextAlignment(.leading).frame(width: 350)
                    }.background(
                        //                    QR Button
                        ZStack {
                            NavigationLink(destination: hecateSoundView(), isActive: $changeView) {
                                EmptyView()
                            }
                            Poly(count: 6, cornerRadius: 12).foregroundColor(.white).frame(width: 180)
                            VStack(spacing: 5) {
                                Image(systemName: "qrcode.viewfinder").font(.system(size: 50))
                                Text("Scan QR").font(.footnote).fontWeight(.bold)
                            }.padding(.leading, 80)
                        }.offset(x: geometry.size.width * -0.5, y: geometry.size.height * 0.2)
                    ).onTapGesture {
                        changeView = true
                        print("Scan Tapped")
                    }
                    .background(
                        //                    Wheel BG
                        ZStack {
                            Poly(count: 6, cornerRadius: 12).foregroundColor(.white).opacity(0.5).frame(width: geometry.size.width * 2).offset(x: geometry.size.width / 1.3)
                            WheelView(degree: $degree, array: array, circleSize: 400)
                                .offset(x: geometry.size.width * 0.6)
                        }
                    ).background(
                        //                    Desc BG
                        Poly(count: 6, cornerRadius: 12).foregroundColor(.white).opacity(0.5).frame(width: geometry.size.width * 2).offset(x: geometry.size.width * -0.1, y: geometry.size.height / 1.5)
                    )
                }
            }
        }
    }
}

// struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(changeView: $changeView.wrappedValue)
//    }
// }
