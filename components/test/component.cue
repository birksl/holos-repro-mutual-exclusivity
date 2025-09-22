package holos

holos: Component.BuildPlan
Component: #Kubernetes & {Resources: Test: test: {
	metadata: namespace: "test"
	spec: exclusiveA:    ""
}}
