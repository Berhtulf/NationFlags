//
//  MainScreen.swift
//  Countries
//
//  Created by Martin Václavík on 01/10/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI
import MessageUI


struct MainScreen: View {
    @EnvironmentObject var settings: UserSettings
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingActions = false
    @State var isShowingMailView = false
    private func mailView() -> some View {
        MFMailComposeViewController.canSendMail() ?
            AnyView(MailView(isShowing: $isShowingMailView, result: $result)) :
            AnyView(Text("Can't send emails from this device"))
    }
    
    var body: some View {
        VStack{
            NavigationView{
                ZStack{
                    VStack {
                        Spacer()
                        Image("Icon")
                            .resizable()
                            .padding()
                            .aspectRatio(contentMode: .fit)
                            .frame(height:245)
                        Text("Countries").font(.largeTitle)
                            .padding(.vertical,40)
                        NavigationLink(destination: ModeSelect()){
                            Text("play")
                                .modifier(MainMenuButton())
                        }.font(.title)
                        NavigationLink(destination: NationList()) {
                            Text("list")
                                .modifier(MainMenuButton())
                        }.font(.title)
                        Spacer()
                    }.edgesIgnoringSafeArea(.all)
                    VStack{
                        Spacer()
                        HStack{
                            Button(action: {
                                self.isShowingActions.toggle()
                            }, label: {
                                Image(systemName: "bubble.left.fill")
                            })
                            Spacer()
                        }.padding()
                    }
                    .actionSheet(isPresented: $isShowingActions) {
                        ActionSheet(title: Text("Feedback"), message: Text("FeedbackInfo"), buttons: [
                           // .default(Text("AppReview")),
                            .default(Text("BugReport"), action: {
                                self.isShowingMailView.toggle()
                            }),
                            .cancel()])
                    }
                        .sheet(isPresented: $isShowingMailView) {
                            self.mailView()
                        }
                }
            }
        }
    }
}

struct MailView: UIViewControllerRepresentable {

    @Binding var isShowing: Bool
    @Binding var result: Result<MFMailComposeResult, Error>?

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {

        @Binding var isShowing: Bool
        @Binding var result: Result<MFMailComposeResult, Error>?

        init(isShowing: Binding<Bool>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _isShowing = isShowing
            _result = result
        }

        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            defer {
                isShowing = false
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(isShowing: $isShowing,
                           result: $result)
    }
    func getOSInfo()->String {
        let os = ProcessInfo().operatingSystemVersion
        return String(os.majorVersion) + "." + String(os.minorVersion) + "." + String(os.patchVersion)
    }
    let model = UIDevice.current.systemName
    let modelName = UIDevice.modelName
    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.setToRecipients(["vaclavik.dev@icloud.com"])
        vc.setSubject("Bug report - \(self.modelName) \(getOSInfo())")

        vc.mailComposeDelegate = context.coordinator
        return vc
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {

    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen().environmentObject(UserSettings())
    }
}
