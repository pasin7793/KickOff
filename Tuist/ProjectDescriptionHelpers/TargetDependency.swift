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
}

