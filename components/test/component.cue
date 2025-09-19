package holos

holos: Component.BuildPlan
Component: #Kubernetes & {Resources: Test: test: #Test & {
	metadata: namespace: "test"
	spec: exclusiveA:    ""
}}
