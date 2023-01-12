//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try font.validate()
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 11 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")
    /// Color `background`.
    static let background = Rswift.ColorResource(bundle: R.hostingBundle, name: "background")
    /// Color `button_active`.
    static let button_active = Rswift.ColorResource(bundle: R.hostingBundle, name: "button_active")
    /// Color `button_disable`.
    static let button_disable = Rswift.ColorResource(bundle: R.hostingBundle, name: "button_disable")
    /// Color `c5c5c5`.
    static let c5c5c5 = Rswift.ColorResource(bundle: R.hostingBundle, name: "c5c5c5")
    /// Color `footer`.
    static let footer = Rswift.ColorResource(bundle: R.hostingBundle, name: "footer")
    /// Color `text_default`.
    static let text_default = Rswift.ColorResource(bundle: R.hostingBundle, name: "text_default")
    /// Color `text_input`.
    static let text_input = Rswift.ColorResource(bundle: R.hostingBundle, name: "text_input")
    /// Color `text_stroke`.
    static let text_stroke = Rswift.ColorResource(bundle: R.hostingBundle, name: "text_stroke")
    /// Color `white_alpha019`.
    static let white_alpha019 = Rswift.ColorResource(bundle: R.hostingBundle, name: "white_alpha019")
    /// Color `white_alpha01`.
    static let white_alpha01 = Rswift.ColorResource(bundle: R.hostingBundle, name: "white_alpha01")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "background", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func background(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.background, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "button_active", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func button_active(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.button_active, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "button_disable", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func button_disable(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.button_disable, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "c5c5c5", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func c5c5c5(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.c5c5c5, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "footer", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func footer(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.footer, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "text_default", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func text_default(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.text_default, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "text_input", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func text_input(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.text_input, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "text_stroke", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func text_stroke(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.text_stroke, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "white_alpha01", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func white_alpha01(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.white_alpha01, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "white_alpha019", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func white_alpha019(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.white_alpha019, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "background", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func background(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.background.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "button_active", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func button_active(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.button_active.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "button_disable", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func button_disable(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.button_disable.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "c5c5c5", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func c5c5c5(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.c5c5c5.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "footer", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func footer(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.footer.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "text_default", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func text_default(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.text_default.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "text_input", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func text_input(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.text_input.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "text_stroke", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func text_stroke(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.text_stroke.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "white_alpha01", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func white_alpha01(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.white_alpha01.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "white_alpha019", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func white_alpha019(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.white_alpha019.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.file` struct is generated, and contains static references to 7 files.
  struct file {
    /// Resource file `Montserrat-Italic-VariableFont_wght.ttf`.
    static let montserratItalicVariableFont_wghtTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-Italic-VariableFont_wght", pathExtension: "ttf")
    /// Resource file `Montserrat-Regular.ttf`.
    static let montserratRegularTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-Regular", pathExtension: "ttf")
    /// Resource file `Montserrat-VariableFont_wght.ttf`.
    static let montserratVariableFont_wghtTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-VariableFont_wght", pathExtension: "ttf")
    /// Resource file `Philosopher-Bold.ttf`.
    static let philosopherBoldTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Philosopher-Bold", pathExtension: "ttf")
    /// Resource file `Philosopher-BoldItalic.ttf`.
    static let philosopherBoldItalicTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Philosopher-BoldItalic", pathExtension: "ttf")
    /// Resource file `Philosopher-Italic.ttf`.
    static let philosopherItalicTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Philosopher-Italic", pathExtension: "ttf")
    /// Resource file `Philosopher-Regular.ttf`.
    static let philosopherRegularTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Philosopher-Regular", pathExtension: "ttf")

    /// `bundle.url(forResource: "Montserrat-Italic-VariableFont_wght", withExtension: "ttf")`
    static func montserratItalicVariableFont_wghtTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratItalicVariableFont_wghtTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Montserrat-Regular", withExtension: "ttf")`
    static func montserratRegularTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratRegularTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Montserrat-VariableFont_wght", withExtension: "ttf")`
    static func montserratVariableFont_wghtTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratVariableFont_wghtTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Philosopher-Bold", withExtension: "ttf")`
    static func philosopherBoldTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.philosopherBoldTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Philosopher-BoldItalic", withExtension: "ttf")`
    static func philosopherBoldItalicTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.philosopherBoldItalicTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Philosopher-Italic", withExtension: "ttf")`
    static func philosopherItalicTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.philosopherItalicTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Philosopher-Regular", withExtension: "ttf")`
    static func philosopherRegularTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.philosopherRegularTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.font` struct is generated, and contains static references to 7 fonts.
  struct font: Rswift.Validatable {
    /// Font `Montserrat-Regular`.
    static let montserratRegular = Rswift.FontResource(fontName: "Montserrat-Regular")
    /// Font `Montserrat-ThinItalic`.
    static let montserratThinItalic = Rswift.FontResource(fontName: "Montserrat-ThinItalic")
    /// Font `Montserrat-Thin`.
    static let montserratThin = Rswift.FontResource(fontName: "Montserrat-Thin")
    /// Font `Philosopher-BoldItalic`.
    static let philosopherBoldItalic = Rswift.FontResource(fontName: "Philosopher-BoldItalic")
    /// Font `Philosopher-Bold`.
    static let philosopherBold = Rswift.FontResource(fontName: "Philosopher-Bold")
    /// Font `Philosopher-Italic`.
    static let philosopherItalic = Rswift.FontResource(fontName: "Philosopher-Italic")
    /// Font `Philosopher-Regular`.
    static let philosopherRegular = Rswift.FontResource(fontName: "Philosopher-Regular")

    /// `UIFont(name: "Montserrat-Regular", size: ...)`
    static func montserratRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratRegular, size: size)
    }

    /// `UIFont(name: "Montserrat-Thin", size: ...)`
    static func montserratThin(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratThin, size: size)
    }

    /// `UIFont(name: "Montserrat-ThinItalic", size: ...)`
    static func montserratThinItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratThinItalic, size: size)
    }

    /// `UIFont(name: "Philosopher-Bold", size: ...)`
    static func philosopherBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: philosopherBold, size: size)
    }

    /// `UIFont(name: "Philosopher-BoldItalic", size: ...)`
    static func philosopherBoldItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: philosopherBoldItalic, size: size)
    }

    /// `UIFont(name: "Philosopher-Italic", size: ...)`
    static func philosopherItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: philosopherItalic, size: size)
    }

    /// `UIFont(name: "Philosopher-Regular", size: ...)`
    static func philosopherRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: philosopherRegular, size: size)
    }

    static func validate() throws {
      if R.font.montserratRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-Regular' could not be loaded, is 'Montserrat-Regular.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.montserratThin(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-Thin' could not be loaded, is 'Montserrat-VariableFont_wght.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.montserratThinItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-ThinItalic' could not be loaded, is 'Montserrat-Italic-VariableFont_wght.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.philosopherBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Philosopher-Bold' could not be loaded, is 'Philosopher-Bold.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.philosopherBoldItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Philosopher-BoldItalic' could not be loaded, is 'Philosopher-BoldItalic.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.philosopherItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Philosopher-Italic' could not be loaded, is 'Philosopher-Italic.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.philosopherRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Philosopher-Regular' could not be loaded, is 'Philosopher-Regular.ttf' added to the UIAppFonts array in this targets Info.plist?") }
    }

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 1 images.
  struct image {
    /// Image `wineBackground`.
    static let wineBackground = Rswift.ImageResource(bundle: R.hostingBundle, name: "wineBackground")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "wineBackground", bundle: ..., traitCollection: ...)`
    static func wineBackground(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.wineBackground, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
