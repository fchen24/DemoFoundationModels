import SwiftUI
import Playgrounds
import FoundationModels

struct ContentView: View {
    private var model = SystemLanguageModel.default
    private let session = LanguageModelSession()
    
    var body: some View {
        contentView
    }
    
    var contentView: some View {
        switch model.availability {
        case .available: Text("Models Available")
        case .unavailable(let reason):
            switch reason {
            case .deviceNotEligible:
                Text("Device Not Eligible")
            case .appleIntelligenceNotEnabled:
                Text("Apple Intelligence Not Enabled")
            case .modelNotReady:
                Text("Model Not Ready")
            @unknown default:
                Text("Unknown Availability Check Error!")
            }
        }
    }
}

#Preview {
    ContentView()
}

#Playground {
    /// Check availability
    var model = SystemLanguageModel.default
    
    switch model.availability {
    case .available:
        print("Available")
        /// Prompt
        // For a longer response
        let simple = "Write me a story about pears."
        // For a concise response
        let quick = "Write the profile for the dog breed Siberian Husky using three sentences."
       
        let session = LanguageModelSession()
        let response = try? await session.respond(to: quick)
        
    case .unavailable(let reason):
        switch reason {
        case .deviceNotEligible: print("Device Not Eligible")
        case .appleIntelligenceNotEnabled: print("Apple Intelligence Not Enabled")
        case .modelNotReady: print("Model Not Ready")
        @unknown default:
            fatalError("Unknown Availability Check Error!")
        }
    }
}
