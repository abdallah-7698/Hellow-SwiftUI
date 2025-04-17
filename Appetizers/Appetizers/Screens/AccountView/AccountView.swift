
// MARK: - This code Only for demo
// To Show what can i do in form
// and to show somw SwiftUI Components

import SwiftUI

struct AccountView: View {
    
    @StateObject private var viewModel = AccountViewModel()
    
    @State private var speed = 50.0
    @State private var stepperValue = 0.0
    @State private var chooise: ShirtSize = .sm
    
    var body: some View {
        NavigationView {
            
            Form {
                Section {
                    
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    DatePicker(selection: $viewModel.user.birthday, in: viewModel.upperDate...viewModel.lowerDate, displayedComponents: .date) {
                        Text("Birthday")
                    }
                    
                    Button("Save Changes") {
                        viewModel.saveChanges()
                    }
                    
                    
                } header: {
                    Text("Personal Info")
                        .foregroundColor(.black)
                        .font(.body)
                    
                }
                
                GroupBoxFormSection()
                
                ToggleFormSection(extraNapkins: $viewModel.user.extraNapkins,
                                  frequestRefills: $viewModel.user.frequestRefills)
                
                SliderFormSection(speed: $speed)
                
                StepperFormSection(value: $stepperValue)
                
                DisclosureGroupFormSection()
                
                ChooseFormSection(shirtSize: $chooise)
                
                MultipleChooseFormSection(shirtSize: $chooise)
                
            }
            .onAppear {viewModel.retrieveUser()}
            .alert(error: $viewModel.errorMessage) { _ in
                Button("OK",role: .cancel) {}
            }
            
            .navigationTitle("🤣 Account")
        }.banner(data: $viewModel.successBannerData, show: $viewModel.showBanner)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

// MARK:  GroupBox
struct GroupBoxFormSection: View {
    
    var body: some View {
        GroupBox(label:
                    Label("End-User Agreement", systemImage: "building.columns")
        ) {
            ScrollView(.vertical, showsIndicators: true) {
                Text("When you implement a custom view, you must implement a computed body` property to provide the content for your view. Return a view that's composed of built-in views that SwiftUI provides, plus other composite views that you've already defined:")
                    .font(.body)
            }
            .frame(height: 130)
            Toggle(isOn: .constant(true)) { Text("I agree to the above terms") }
            GroupBox(label: Text("Box 2")) {
                Text("When you implement a custom view, you must implement a computed body` property to provide the content for your view.")
                GroupBox(label: Text("Box 3")) {
                    Text("When you implement a custom view, you must implement")
                }
            }
        }
    }
}

// MARK:  Toggle
struct ToggleFormSection: View {
    @Binding var extraNapkins: Bool
    @Binding var frequestRefills: Bool
    
    var body: some View {
        Section {
            
            Toggle(isOn: $extraNapkins) { Text("Personal Info") }
            Toggle(isOn: $frequestRefills) { Text("Frequent Refills") }
            
        } header: { Text("Requests") }
            .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
    }
}

// MARK:  Slider
struct SliderFormSection: View {
    @Binding var speed: Double
    
    var body: some View {
        Section {
            
            Slider(value: $speed,
                   in: 0...100,
                   step: 5
            ){
                Text("Speed")
            } minimumValueLabel: {
                Image(systemName: "hand.thumbsdown")
            } maximumValueLabel: {
                Image(systemName: "hand.thumbsup")
            } onEditingChanged: { val in
                print("done", val)
            }
            Text("\(speed)")
            
        } header: {
            Text("Slider Section")
        }
    }
}

// MARK:  Stepper
struct StepperFormSection: View {
    @Binding var value: Double
    
    var body: some View {
        Section {
            
            Stepper {
                Text("Value: \(value)")
            } onIncrement: {
                value += 1
            } onDecrement: {
                value -= 1
            }
            
            // when make the range you set the max and min value
            Stepper(value: $value,
                    in: 0...10,
                    step: 1
            ) {
                Text("Current: \(value)")
            }
            
        } header: {
            Text("Stepper Section")
        }
    }
}

// MARK:  DisclosureGroup
struct DisclosureGroupFormSection: View {
    struct ToggleStates {
        var oneIsOn: Bool = false
        var twoIsON: Bool = true
    }
    
    @State private var toggleStates = ToggleStates()
    
    var body: some View {
        DisclosureGroup {
            Toggle(isOn: $toggleStates.oneIsOn) { Text("Toggle 1") }
            Toggle(isOn: $toggleStates.twoIsON) { Text("Toggle 2") }
            DisclosureGroup("Sub-item") {
                Text("Toggle 1")
                Text("Toggle 2")
            }
            .tint(.red)
            .listRowBackground(
                Color(.red)
                    .opacity(0.1))
            
        } label: { Text("Items") }
        
        
    }
}

// MARK:  Choose
enum ShirtSize: String, CaseIterable {
    case sm = "Small"
    case md = "Medium"
    case lg = "Large"
    case xl = "X Large"
}

struct ChooseFormSection: View {
    
    @Binding var shirtSize: ShirtSize
    
    var body: some View {
        Section {
            
            sharetSizePicker().pickerStyle(.automatic)
            sharetSizePicker().pickerStyle(.inline)
            sharetSizePicker().pickerStyle(.menu)
            sharetSizePicker().pickerStyle(.segmented)
            sharetSizePicker().pickerStyle(.wheel)
            
        } header: {
            Text("Choose Section")
        }
    }
    
    fileprivate func sharetSizePicker() -> Picker<Text, ShirtSize, ForEach<[ShirtSize], ShirtSize, Text>> {
        return Picker("Shirt Size", selection: $shirtSize) {
            ForEach(ShirtSize.allCases, id: \.self) { size in
                Text(size.rawValue)
            }
        }
    }
    
}

// MARK:  Multiple Choose
struct MultipleChooseFormSection: View {
    
    @Binding var shirtSize: ShirtSize
    
    var body: some View {
        Section {
            
            ForEach(ShirtSize.allCases, id: \.self) { size in
                CheckedBoxView(title: size.rawValue)
            }
            
        } header: {
            Text("Choose Section")
        }
    }
}

struct CheckedBoxView: View {
    let title: String
    @State var isChecked: Bool = false
    
    let separatedSpace: CGFloat = 20
    
    var body: some View {
        HStack(spacing: separatedSpace) {
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .foregroundColor(isChecked ? .brandPrimary : .secondary)
            Text(title)
                .strikethrough(isChecked, color: .black)
        }
        .onTapGesture {
            isChecked.toggle()
        }
    }
    
}

