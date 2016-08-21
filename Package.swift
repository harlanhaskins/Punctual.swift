import PackageDescription

let package = Package(
    name: "Punctual",
    dependencies: [
      .Package(url: "https://github.com/typelift/SwiftCheck.git", versions: Version(0,6,0)..<Version(1,0,0))
    ]
)
