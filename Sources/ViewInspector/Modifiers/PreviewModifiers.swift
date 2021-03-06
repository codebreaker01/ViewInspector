import SwiftUI

// MARK: - ViewColorTests

@available(iOS 13.0, macOS 10.15, tvOS 13.0, *)
public extension InspectableView {
    
    func foregroundColor() throws -> Color? {
        let reference = EmptyView().foregroundColor(nil)
        let keyPath = try Inspector.environmentKeyPath(Optional<Color>.self, reference)
        return try environmentModifier(keyPath: keyPath, call: "foregroundColor")
    }
    
    #if !os(macOS)
    func accentColor() throws -> Color? {
        let reference = EmptyView().accentColor(nil)
        let keyPath = try Inspector.environmentKeyPath(Optional<Color>.self, reference)
        return try environmentModifier(keyPath: keyPath, call: "accentColor")
    }
    #endif
    
    func colorScheme() throws -> ColorScheme {
        let reference = EmptyView().colorScheme(.light)
        let keyPath = try Inspector.environmentKeyPath(ColorScheme.self, reference)
        return try environmentModifier(keyPath: keyPath, call: "colorScheme")
    }
    
    #if !os(macOS)
    func preferredColorScheme() throws -> ColorScheme? {
        return try modifierAttribute(
            modifierName: "_PreferenceWritingModifier<PreferredColorSchemeKey>",
            path: "modifier|value", type: Optional<ColorScheme>.self, call: "preferredColorScheme")
    }
    #endif
}

// MARK: - ViewPreview

@available(iOS 13.0, macOS 10.15, tvOS 13.0, *)
public extension InspectableView {
    
    func previewDevice() throws -> PreviewDevice {
        return try modifierAttribute(
            modifierName: "PreviewDeviceTraitKey", path: "modifier|value",
            type: PreviewDevice.self, call: "previewDevice")
    }
    
    func previewDisplayName() throws -> String {
        return try modifierAttribute(
            modifierName: "PreviewDisplayNameTraitKey", path: "modifier|value",
            type: String.self, call: "previewDisplayName")
    }
    
    func previewLayout() throws -> PreviewLayout {
        return try modifierAttribute(
            modifierName: "PreviewLayoutTraitKey", path: "modifier|value",
            type: PreviewLayout.self, call: "previewLayout")
    }
}
