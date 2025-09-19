# Mutually exclusive fields in Resource type

An incomplete disjunction occurs when a Resource definition containing mutually exclusive fields
is used as a Resource in a component.

Given a Resource definition with some mutually exclusive fields [test.cue](./test.cue)
that is added to the `#Resources` definition [resources.cue](./resources.cue) results in
the following message when using the Resource in a component:
```sh
$ holos render platform
error at internal/component/component.go:132: holos.spec.artifacts.0.generators.0.resources.Test.test.spec: incomplete value {exclusiveA:"",optionalA?:string,optionalB?:string} | {exclusiveA:"",optionalA?:string,optionalB?:string,exclusiveB:string}
holos.spec.artifacts.0.generators.0.resources.Test.test.spec: incomplete value {exclusiveA:"",optionalA?:string,optionalB?:string} | {exclusiveA:"",optionalA?:string,optionalB?:string,exclusiveB:string}
error at cli/render/render.go:89: could not render component: could not run command:
        /Users/birklewin/go/bin/holos '--log-level' 'info' '--log-format' 'console' 'render' 'component' '--write-to' 'deploy' '--inject' 'holos_component_name=test' '--inject' 'holos_component_path=components/test' './components/test'
        exit status 1
```

We see that there is an incomplete value resulting from two matching disjunctions evn though the second option
should not be allowed by the definition.
```cue
{exclusiveA:"",optionalA?:string,optionalB?:string} | {exclusiveA:"",optionalA?:string,optionalB?:string,exclusiveB:string}
```


Evaluating the example resources in [tests.cue](./tests.cue) directly results in the expected output:
```sh
$ holos cue eval -ic .
expectSuccess: {
    kind: "Test"
    metadata: {
        name:      "test"
        namespace: "test"
    }
    spec: {
        exclusiveA: ""
    }
}
expectFailure: {
    kind: "Test"
    metadata: {
        name:      "test"
        namespace: "test"
    }
    spec: _|_ // expectFailure.spec: 2 errors in empty disjunction: (and 2 more errors)
}
```

Holos version: 0.104.3
