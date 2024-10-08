import SwiftUI

struct CityToNameLearnView: View {
    @EnvironmentObject private var settings: GlobalSettings
    @Environment(\.presentationMode) private var presentationMode

    @StateObject private var viewModel = GameViewModel(withTimer: false)

    var body: some View {
        VStack {
            Spacer()
            Text(LocalizedStringKey(viewModel.correctOption?.name ?? ""))
                .font(.title)
                .lineLimit(1)
                .allowsTightening(true)
                .minimumScaleFactor(0.005)
                .padding(.horizontal)
                .padding(.vertical, 7)
            Spacer()
                .frame(height: 50)
            if !viewModel.options.isEmpty {
                ForEach(viewModel.options) { item in
                    Button(action: {
                        viewModel.pressedButtonFor(item: item)
                        viewModel.disableAllButtons()
                        if item != viewModel.correctOption {
                            viewModel.highlightCorrectOption()
                        }
                        viewModel.generateOptions(useDelay: true, learnMode: true)
                        viewModel.adjustScoreWhileLearning(wasCorrect: item == viewModel.correctOption)
                    }, label: {
                        Text(LocalizedStringKey(item.capital))
                    })
                    .buttonStyle(OptionButtonStyle(wasPressed: viewModel.pressedButtons.contains(item),
                                                   isCorrect: item == viewModel.correctOption,
                                                   showCorrect: viewModel.showCorrectOption))
                    .disabled(viewModel.disabledButtons.contains(item))
                }
            }
            Spacer()
        }
        .navigationBarTitle("CityToState", displayMode: .inline)
        .onAppear(perform: viewModel.playAgain)
        .alert(isPresented: $settings.finish) {
            Alert(title: Text("Game over!"), message: Text("score <\(viewModel.score)>/<\(viewModel.pool.count)>"),
                  primaryButton: .destructive(Text("Back")) {
                presentationMode.wrappedValue.dismiss()},
                  secondaryButton: .default(Text("SaveAndPlay")) {
                viewModel.playAgain()
            })
        }
    }
}

#Preview {
    NavigationView {
        CityToNameLearnView()
            .environmentObject(GlobalSettings())
    }
}
