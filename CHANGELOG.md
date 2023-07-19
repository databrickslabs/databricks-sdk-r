# Version changelog

## 0.2.0

* Adding `@export` to Roxygen, improving visibility ([#16](https://github.com/databrickslabs/databricks-sdk-r/pull/16)).

API Changes:


OpenAPI SHA: 2ff01e4fb3c2799518dfaff00c986f6737a4a742, Date: 2023-07-19

## 0.1.0

* Work towards getting `R CMD check` passing ([#4](https://github.com/databrickslabs/databricks-sdk-r/pull/4)).
* Drop renv ([#11](https://github.com/databrickslabs/databricks-sdk-r/pull/11)).
* Drop @include ([#12](https://github.com/databrickslabs/databricks-sdk-r/pull/12)).
* Embrace R namespaces ([#13](https://github.com/databrickslabs/databricks-sdk-r/pull/13)).
* Fix `.NeedsOffsetDedupe` error ([#14](https://github.com/databrickslabs/databricks-sdk-r/pull/14)).

API Changes:

 * Removed `metastoresMaintenance()` function.
 * Added `metastoresEnableOptimization()` function.
 * Added `tablesUpdate()` function.
 * Changed `clustersGet()` function to return .

OpenAPI SHA: 0a1949ba96f71680dad30e06973eaae85b1307bb, Date: 2023-07-18

## 0.0.1

Initial rollout