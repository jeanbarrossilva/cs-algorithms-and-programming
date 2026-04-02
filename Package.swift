// swift-tools-version: 6.3

import PackageDescription

let package = Package(
  name: "CSAlgorithmsAndProgrammingLogic",
  platforms: [.macOS(.v15)],
  targets: [
    .executableTarget(name: "CSAlgorithmsAndProgrammingLogic"),
    .testTarget(
      name: "CSAlgorithmsAndProgrammingLogicLogicTests",
      dependencies: [.target(name: "CSAlgorithmsAndProgrammingLogic")]
    )
  ],
  swiftLanguageModes: [.v6]
)
