
import SwiftUI

struct AFButton: View {
    var title: String
    var action: () -> Void
    var backgroundColor: Color = .red
    var textColor: Color = .white
    var cornerRadius: CGFloat = 15
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .frame(width: 320, height: 60)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .cornerRadius(cornerRadius)
                .padding(3)
        }
    }
}

struct AFButton_Previews: PreviewProvider {
    static var previews: some View {
        AFButton(title: "Click Me", action: {
            print("Button tapped!")
        })
            .preferredColorScheme(.dark)
    }
}
