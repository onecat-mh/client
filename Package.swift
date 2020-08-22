// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "SwiftkubeClient",
	products: [
		.library(
			name: "SwiftkubeClient",
			targets: ["SwiftkubeClient"]),
	],
	dependencies: [
		.package(name: "SwiftkubeModel", path: "../model"),
		.package(url: "https://github.com/swift-server/async-http-client.git", .upToNextMajor(from: "1.0.0")),
		.package(url: "https://github.com/apple/swift-log.git", .upToNextMajor(from: "1.0.0")),
		.package(url: "https://github.com/jpsim/Yams.git", .upToNextMajor(from: "2.0.0")),
	],
	targets: [
		.target(
			name: "SwiftkubeClient",
			dependencies: [
				.product(name: "SwiftkubeModel", package: "SwiftkubeModel"),
				.product(name: "AsyncHTTPClient", package: "async-http-client"),
				.product(name: "Logging", package: "swift-log"),
				.product(name: "Yams", package: "Yams")
		]),
		.testTarget(
			name: "SwiftkubeClientTests",
			dependencies: [
				"SwiftkubeClient"
		]),
	]
)