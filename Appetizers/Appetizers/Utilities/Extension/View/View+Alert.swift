import SwiftUI

extension View {
    func alert<E, A>(error: Binding<E?>, @ViewBuilder actions: (E) -> A ) -> some View where E : LocalizedError, A : View {
        self.alert(
            isPresented: Binding<Bool>(
                get: { error.wrappedValue != nil },
                set: { if !$0 { error.wrappedValue = nil } }
            ),
            error: error.wrappedValue,
            actions: actions,
            message: { error in
                Text(error.recoverySuggestion ?? "Please try again.")
            }
        )
    }
}
