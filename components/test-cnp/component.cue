package holos

holos: Component.BuildPlan
Component: #Kubernetes & {Resources: CiliumNetworkPolicy: test: {
	metadata: namespace: "test"
	spec: endpointSelector: {}
	spec: egress: []
}}
