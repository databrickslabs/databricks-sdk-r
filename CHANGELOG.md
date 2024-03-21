# Version changelog

## 0.3.1

* Added tokei.rs badge ([#27](https://github.com/databrickslabs/databricks-sdk-r/pull/27)).
* Fix handling of bare DATABRICKS_HOST URLs. ([#25](https://github.com/databrickslabs/databricks-sdk-r/pull/25)).


## 0.3.0

* Added github pages ([#19](https://github.com/databrickslabs/databricks-sdk-r/pull/19)).
* Added `pkgdown` website ([#20](https://github.com/databrickslabs/databricks-sdk-r/pull/20)).

API Changes:

 * Added `clusterPoliciesClusterPolicyId()` function.
 * Added `clusterPoliciesPermissionLevels()` function.
 * Added `clustersClusterId()` function.
 * Added `clustersPermissionLevels()` function.
 * Added `instancePoolsInstancePoolId()` function.
 * Added `instancePoolsPermissionLevels()` function.
 * Changed `permissionsSet()` function to start returning .
 * Changed `permissionsUpdate()` function to start returning .
 * Added `usersGetPasswordPermissionLevels()` function.
 * Added `usersGetPasswordPermissions()` function.
 * Added `usersSetPasswordPermissions()` function.
 * Added `usersUpdatePasswordPermissions()` function.
 * Added `jobsGetJobPermissionLevels()` function.
 * Added `jobsGetJobPermissions()` function.
 * Added `jobsSetJobPermissions()` function.
 * Added `jobsUpdateJobPermissions()` function.
 * Added `experimentsGetExperimentPermissionLevels()` function.
 * Added `experimentsGetExperimentPermissions()` function.
 * Added `experimentsSetExperimentPermissions()` function.
 * Added `experimentsUpdateExperimentPermissions()` function.
 * Added `modelRegistryGetRegisteredModelPermissionLevels()` function.
 * Added `modelRegistryGetRegisteredModelPermissions()` function.
 * Added `modelRegistrySetRegisteredModelPermissions()` function.
 * Added `modelRegistryUpdateRegisteredModelPermissions()` function.
 * Added `pipelinesGetPipelinePermissionLevels()` function.
 * Added `pipelinesGetPipelinePermissions()` function.
 * Added `pipelinesSetPipelinePermissions()` function.
 * Added `pipelinesUpdatePipelinePermissions()` function.
 * Added `servingEndpointsGetServingEndpointPermissionLevels()` function.
 * Added `servingEndpointsGetServingEndpointPermissions()` function.
 * Added `servingEndpointsSetServingEndpointPermissions()` function.
 * Added `servingEndpointsUpdateServingEndpointPermissions()` function.
 * Added `tokenManagementGetTokenPermissionLevels()` function.
 * Added `tokenManagementGetTokenPermissions()` function.
 * Added `tokenManagementSetTokenPermissions()` function.
 * Added `tokenManagementUpdateTokenPermissions()` function.
 * Added `warehousesGetWarehousePermissionLevels()` function.
 * Added `warehousesGetWarehousePermissions()` function.
 * Added `warehousesSetWarehousePermissions()` function.
 * Added `warehousesUpdateWarehousePermissions()` function.
 * Added `reposGetRepoPermissionLevels()` function.
 * Added `reposGetRepoPermissions()` function.
 * Added `reposSetRepoPermissions()` function.
 * Added `reposUpdateRepoPermissions()` function.
 * Added `workspacePermissionLevels()` function.
 * Added `workspaceWorkspaceObjectId()` function.

OpenAPI SHA: ae082ae8b1bcc0bd41468e5f07810054e05b3dc7, Date: 2023-08-01

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