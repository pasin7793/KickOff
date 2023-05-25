// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum KickOffAsset {
  public enum Colors {
    public static let paperBackgroundColor = KickOffColors(name: "Paper_BackgroundColor")
    public static let paperBlankColor = KickOffColors(name: "Paper_BlankColor")
    public static let paperEndColor = KickOffColors(name: "Paper_EndColor")
    public static let paperErrorColor = KickOffColors(name: "Paper_ErrorColor")
    public static let paperShadowColor = KickOffColors(name: "Paper_ShadowColor")
    public static let paperStartColor = KickOffColors(name: "Paper_StartColor")
    public static let paperGrayColor = KickOffColors(name: "Paper_grayColor")
  }
  public enum Images {
    public static let paperBackground = KickOffImages(name: "Paper_Background")
    public static let paperHitLogo = KickOffImages(name: "Paper_HitLogo")
    public static let paperLikeLogo = KickOffImages(name: "Paper_LikeLogo")
    public static let paperMainLogo = KickOffImages(name: "Paper_MainLogo")
    public static let paperProfileLogo = KickOffImages(name: "Paper_ProfileLogo")
    public static let paperStatusLogo = KickOffImages(name: "Paper_StatusLogo")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class KickOffColors {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if canImport(SwiftUI)
  private var _swiftUIColor: Any? = nil
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public private(set) var swiftUIColor: SwiftUI.Color {
    get {
      if self._swiftUIColor == nil {
        self._swiftUIColor = SwiftUI.Color(asset: self)
      }

      return self._swiftUIColor as! SwiftUI.Color
    }
    set {
      self._swiftUIColor = newValue
    }
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension KickOffColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: KickOffColors) {
    let bundle = KickOffResources.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Color {
  init(asset: KickOffColors) {
    let bundle = KickOffResources.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct KickOffImages {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = KickOffResources.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

public extension KickOffImages.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the KickOffImages.image property")
  convenience init?(asset: KickOffImages) {
    #if os(iOS) || os(tvOS)
    let bundle = KickOffResources.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Image {
  init(asset: KickOffImages) {
    let bundle = KickOffResources.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: KickOffImages, label: Text) {
    let bundle = KickOffResources.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: KickOffImages) {
    let bundle = KickOffResources.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all
