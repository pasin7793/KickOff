import ProjectDescription
import ProjectDescriptionHelpers

let projectName = "KickOff"
let orginazationIden = "KickOff"

let project = Project.executable(
    name: projectName,
    platform: .iOS,
    packages: [
        .Then,
        .SnapKit,
        .Alamofire,
        .Moya,
        .RxSwift,
        .RxFlow,
        .Gifu,
        .Kingfisher
    ],
    product: .app,
    deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
    dependencies: [
        .SPM.Then,
        .SPM.SnapKit,
        .SPM.Alamofire,
        .SPM.RxMoya,
        .SPM.RxSwift,
        .SPM.RxFlow,
        .SPM.Gifu,
        .SPM.Kingfisher
    ]
)
