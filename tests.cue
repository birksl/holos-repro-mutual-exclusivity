package holos

expectSuccess: #Test & {
	kind: "Test"
	metadata: name:      "test"
	metadata: namespace: "test"
	spec: exclusiveA:    ""
}

expectFailure: #Test & {
	kind: "Test"
	metadata: name:      "test"
	metadata: namespace: "test"
	spec: exclusiveA:    ""
	spec: exclusiveB:    ""
}
