package holos

#Test: {
	kind: "Test"
	metadata: name:      string
	metadata: namespace: string
	spec: #TestSpec
}

#TestSpec: {
	optionalA?: string
	optionalB?: string
} & ({
	exclusiveA: string
} | {
	exclusiveB: string
})
