import ProjectDescription

extension TargetDependency{
    public struct SPM {}
}

public extension TargetDependency.SPM{
    static let SnapKit = TargetDependency.package(product: "SnapKit")
    static let Then = TargetDependency.package(product: "Then")
    static let Alamofire = TargetDependency.package(product: "Alamofire")
    static let RxSwift = TargetDependency.package(product: "RxSwift")
    static let RxMoya = TargetDependency.package(product: "RxMoya")
    static let RxFlow = TargetDependency.package(product: "RxFlow")
    static let Gifu = TargetDependency.package(product: "Gifu")
    static let Kingfisher = TargetDependency.package(product: "Kingfisher")
    static let Inject = TargetDependency.package(product: "Inject")
    static let Swinject = TargetDependency.package(product: "Swinject")
    static let RxCocoa = TargetDependency.package(product: "RxCocoa")
    static let ReactorKit = TargetDependency.package(product: "ReactorKit")
    static let RxGesture = TargetDependency.package(product: "RxGesture")
    static let Lottie = TargetDependency.package(product: "Lottie")
    static let ViewAnimator = TargetDependency.package(product: "ViewAnimator")
    static let Quick = TargetDependency.package(product: "Quick")
    static let Nimble = TargetDependency.package(product: "Nimble")
    static let Tabman = TargetDependency.package(product: "Tabman")
    static let SwinjectAutoregistration = TargetDependency.package(product: "SwinjectAutoregistration")
}

public extension Package {
    static let SnapKit = Package.remote(
        url: "https://github.com/SnapKit/SnapKit.git",
        requirement: .upToNextMajor(from: "5.6.0"))
    
    static let Then = Package.remote(
        url: "https://github.com/devxoul/Then.git",
        requirement: .upToNextMajor(from: "3.0.0"))
    
    static let Alamofire = Package.remote(
        url: "https://github.com/Alamofire/Alamofire",
        requirement: .upToNextMajor(from: "5.6.2"))
    
    static let Moya = Package.remote(
        url: "https://github.com/Moya/Moya",
        requirement: .upToNextMajor(from: "15.0.0"))
    
    static let RxSwift = Package.remote(
        url: "https://github.com/ReactiveX/RxSwift",
        requirement: .upToNextMajor(from: "6.5.0"))
    
    static let RxFlow = Package.remote(
        url: "https://github.com/RxSwiftCommunity/RxFlow",
        requirement: .upToNextMajor(from: "2.13.0"))
    
    static let Gifu = Package.remote(
        url: "https://github.com/kaishin/Gifu",
        requirement: .upToNextMajor(from: "3.4"))
    
    static let Kingfisher = Package.remote(
        url: "https://github.com/onevcat/Kingfisher.git",
        requirement: .upToNextMajor(from: "7.6.2"))
    
    static let Inject = Package.remote(
        url: "https://github.com/krzysztofzablocki/Inject",
        requirement: .upToNextMajor(from: "1.2.3"))
    
    static let Swinject = Package.remote(
        url: "https://github.com/Swinject/Swinject",
        requirement: .upToNextMajor(from: "2.8.3"))
    
    static let ReactorKit = Package.remote(
        url: "https://github.com/ReactorKit/ReactorKit",
        requirement: .upToNextMajor(from: "3.2.0"))
    
    static let RxGesture = Package.remote(
        url: "https://github.com/RxSwiftCommunity/RxGesture.git",
        requirement: .upToNextMajor(from: "4.0.4")
    )
    
    static let Lottie = Package.remote(
        url: "https://github.com/airbnb/lottie-ios.git",
        requirement: .upToNextMajor(from: "4.2.0")
    )
    
    static let ViewAnimator = Package.remote(
        url: "https://github.com/marcosgriselli/ViewAnimator.git",
        requirement: .upToNextMajor(from: "3.1.0")
    )
    
    static let Quick = Package.remote(
        url: "https://github.com/Quick/Quick.git",
        requirement: .upToNextMajor(from: "7.0.0")
    )
    
    static let Nimble = Package.remote(
        url: "https://github.com/Quick/Nimble.git",
        requirement: .upToNextMajor(from: "12.0.0")
    )
    
    static let Tabman = Package.remote(
        url: "https://github.com/uias/Tabman.git",
        requirement: .upToNextMajor(from: "3.0.1")
    )
    
    static let SwinjectAutoregistration = Package.remote(
        url: "https://github.com/Swinject/SwinjectAutoregistration",
        requirement: .upToNextMajor(from: "2.8.3"))
}

