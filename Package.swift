import PackageDescription

let package = Package(
    name: "Coconut",
    dependencies: [
	.Package(url: "https://github.com/damicreabox/CGtk3.git", majorVersion: 1),
	.Package(url: "https://github.com/tadija/AEXML.git", majorVersion: 4)
    ]
)
