Install the charts to prepare for testing.
The test is not against helm template.
It is against a installation.

* `helm install local-test-hook .`
* `kubectl get pod`
* `helm test local-test-hook`
* `helm test local-test-hook --hide-notes`

After changing the test files, we need to release again.
```shell
helm upgrade local-test-hook test-hook
# then run the test again
helm test local-test-hook --hide-notes
```
