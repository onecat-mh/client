//
// Copyright 2020 Iskandar Abudiab (iabudiab.dev)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation
import NIO
import SwiftkubeModel

public protocol NamespaceScopedResourceHandler: BaseHandler {

	func list(in namespace: NamespaceSelector, selector: ListSelector?) -> EventLoopFuture<ResourceList>

	func get(in namespace: NamespaceSelector, name: String) -> EventLoopFuture<Resource>

	func create(inNamespace namespace: String, _ resource: Resource) -> EventLoopFuture<Resource>

	func create(inNamespace namespace: String, _ block: () -> Resource) -> EventLoopFuture<Resource>

	func delete(inNamespace namespace: String, name: String) -> EventLoopFuture<Resource>
}

public extension NamespaceScopedResourceHandler {

	func list(in namespace: NamespaceSelector, selector: ListSelector? = nil) -> EventLoopFuture<ResourceList> {
		return _list(in: namespace, selector: selector)
	}

	func get(in namespace: NamespaceSelector, name: String) -> EventLoopFuture<Resource> {
		return _get(in: namespace, name: name)
	}

	func create(inNamespace namespace: String, _ resource: Resource) -> EventLoopFuture<Resource> {
		return _create(in: .namespace(namespace), resource)
	}

	func create(inNamespace namespace: String, _ block: () -> Resource) -> EventLoopFuture<Resource> {
		return _create(in: .namespace(namespace), block())
	}

	func delete(inNamespace namespace: String, name: String) -> EventLoopFuture<Resource> {
		return _delete(in: .namespace(namespace), name: name)
	}
}
