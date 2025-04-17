
import SwiftUI

// NOTE: This Page uses link not depends on any UIKit Components
///This will move you to safari app and go to the link not show the safari view obove this view like the safari view in UIKit do


struct FrameworkDetailViewWithLink: View {
    let framework: Framework
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        VStack(spacing: 5){
            HStack{
                Spacer()
                Button {
                    isShowingDetailView = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
            }
            .padding()
            
            Spacer()
            Image(framework.imageName)
                .resizable()
                .frame(width: 130, height: 130)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 28)
            Text(framework.description)
                .font(.body)
                .fontWeight(.medium)
                .padding(10)
            Spacer()
            Link(destination: URL(string: framework.urlString)!) {
                Text("Learn More")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(width: 320, height: 60)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .padding(3)
            }
        }
    }
}

struct FrameworkDetailViewWithLink_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailViewWithLink(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
            .preferredColorScheme(.dark)
            .environment(\.layoutDirection, .leftToRight)
    }
}
