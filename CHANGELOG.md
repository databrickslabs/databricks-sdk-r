# Version changelog

## 0.4.0

* Regenerated from the latest OpenAPI spec ([#29](https://github.com/databrickslabs/databricks-sdk-r/pull/29)).

API Changes:

 * Changed `catalogsList()` function to require request of .
 * Changed `connectionsCreate()` function with new required argument order.
 * Changed `connectionsDelete()` function with new required argument order.
 * Changed `connectionsGet()` function with new required argument order.
 * Changed `connectionsUpdate()` function with new required argument order.
 * Changed `externalLocationsList()` function to require request of .
 * Changed `functionsCreate()` function . New request type is .
 * Changed `metastoresCreate()` function with new required argument order.
 * Removed `metastoresEnableOptimization()` function.
 * Changed `storageCredentialsList()` function to require request of .
 * Added `tablesExists()` function.
 * Changed `volumesCreate()` function with new required argument order.
 * Changed `volumesDelete()` function with new required argument order.
 * Changed `volumesRead()` function with new required argument order.
 * Changed `volumesUpdate()` function with new required argument order.
 * Added `workspaceBindingsGetBindings()` function.
 * Added `workspaceBindingsUpdateBindings()` function.
 * Removed `clusterPoliciesGetClusterPolicyPermissionLevels()` function.
 * Removed `clusterPoliciesGetClusterPolicyPermissions()` function.
 * Removed `clusterPoliciesSetClusterPolicyPermissions()` function.
 * Removed `clusterPoliciesUpdateClusterPolicyPermissions()` function.
 * Added `clusterPoliciesGetPermissionLevels()` function.
 * Added `clusterPoliciesGetPermissions()` function.
 * Added `clusterPoliciesSetPermissions()` function.
 * Added `clusterPoliciesUpdatePermissions()` function.
 * Removed `clustersGetClusterPermissionLevels()` function.
 * Removed `clustersGetClusterPermissions()` function.
 * Removed `clustersSetClusterPermissions()` function.
 * Removed `clustersUpdateClusterPermissions()` function.
 * Added `clustersGetPermissionLevels()` function.
 * Added `clustersGetPermissions()` function.
 * Added `clustersSetPermissions()` function.
 * Added `clustersUpdatePermissions()` function.
 * Removed `instancePoolsGetInstancePoolPermissionLevels()` function.
 * Removed `instancePoolsGetInstancePoolPermissions()` function.
 * Removed `instancePoolsSetInstancePoolPermissions()` function.
 * Removed `instancePoolsUpdateInstancePoolPermissions()` function.
 * Added `instancePoolsGetPermissionLevels()` function.
 * Added `instancePoolsGetPermissions()` function.
 * Added `instancePoolsSetPermissions()` function.
 * Added `instancePoolsUpdatePermissions()` function.
 * Removed `usersGetPasswordPermissionLevels()` function.
 * Removed `usersGetPasswordPermissions()` function.
 * Removed `usersSetPasswordPermissions()` function.
 * Removed `usersUpdatePasswordPermissions()` function.
 * Added `usersGetPermissionLevels()` function.
 * Added `usersGetPermissions()` function.
 * Added `usersSetPermissions()` function.
 * Added `usersUpdatePermissions()` function.
 * Changed `jobsCancelAllRuns()` function with new required argument order.
 * Removed `jobsGetJobPermissionLevels()` function.
 * Removed `jobsGetJobPermissions()` function.
 * Removed `jobsSetJobPermissions()` function.
 * Removed `jobsUpdateJobPermissions()` function.
 * Added `jobsGetPermissionLevels()` function.
 * Added `jobsGetPermissions()` function.
 * Added `jobsSetPermissions()` function.
 * Added `jobsUpdatePermissions()` function.
 * Changed `experimentsGetByName()` function to return .
 * Changed `experimentsGetExperiment()` function to return .
 * Removed `experimentsGetExperimentPermissionLevels()` function.
 * Removed `experimentsGetExperimentPermissions()` function.
 * Removed `experimentsSetExperimentPermissions()` function.
 * Removed `experimentsUpdateExperimentPermissions()` function.
 * Added `experimentsDeleteRuns()` function.
 * Added `experimentsGetPermissionLevels()` function.
 * Added `experimentsGetPermissions()` function.
 * Added `experimentsRestoreRuns()` function.
 * Added `experimentsSetPermissions()` function.
 * Added `experimentsUpdatePermissions()` function.
 * Removed `modelRegistryGetRegisteredModelPermissionLevels()` function.
 * Removed `modelRegistryGetRegisteredModelPermissions()` function.
 * Removed `modelRegistrySetRegisteredModelPermissions()` function.
 * Removed `modelRegistryUpdateRegisteredModelPermissions()` function.
 * Added `modelRegistryGetPermissionLevels()` function.
 * Added `modelRegistryGetPermissions()` function.
 * Added `modelRegistrySetPermissions()` function.
 * Added `modelRegistryUpdatePermissions()` function.
 * Removed `pipelinesGetPipelinePermissionLevels()` function.
 * Removed `pipelinesGetPipelinePermissions()` function.
 * Removed `pipelinesReset()` function.
 * Removed `pipelinesSetPipelinePermissions()` function.
 * Removed `pipelinesUpdatePipelinePermissions()` function.
 * Added `pipelinesGetPermissionLevels()` function.
 * Added `pipelinesGetPermissions()` function.
 * Added `pipelinesSetPermissions()` function.
 * Added `pipelinesUpdatePermissions()` function.
 * Removed `servingEndpointsGetServingEndpointPermissionLevels()` function.
 * Removed `servingEndpointsGetServingEndpointPermissions()` function.
 * Changed `servingEndpointsQuery()` function . New request type is .
 * Removed `servingEndpointsSetServingEndpointPermissions()` function.
 * Changed `servingEndpointsUpdateConfig()` function with new required argument order.
 * Removed `servingEndpointsUpdateServingEndpointPermissions()` function.
 * Added `servingEndpointsGetPermissionLevels()` function.
 * Added `servingEndpointsGetPermissions()` function.
 * Added `servingEndpointsPatch()` function.
 * Added `servingEndpointsPut()` function.
 * Added `servingEndpointsSetPermissions()` function.
 * Added `servingEndpointsUpdatePermissions()` function.
 * Changed `ipAccessListsCreate()` function with new required argument order.
 * Changed `ipAccessListsGet()` function . New request type is .
 * Changed `ipAccessListsList()` function to return .
 * Changed `ipAccessListsReplace()` function with new required argument order.
 * Changed `ipAccessListsUpdate()` function with new required argument order.
 * Changed `tokenManagementCreateOboToken()` function with new required argument order.
 * Changed `tokenManagementGet()` function to return .
 * Removed `tokenManagementGetTokenPermissionLevels()` function.
 * Removed `tokenManagementGetTokenPermissions()` function.
 * Removed `tokenManagementSetTokenPermissions()` function.
 * Removed `tokenManagementUpdateTokenPermissions()` function.
 * Added `tokenManagementGetPermissionLevels()` function.
 * Added `tokenManagementGetPermissions()` function.
 * Added `tokenManagementSetPermissions()` function.
 * Added `tokenManagementUpdatePermissions()` function.
 * Changed `tokensList()` function to return .
 * Changed `cleanRoomsDelete()` function with new required argument order.
 * Changed `cleanRoomsGet()` function with new required argument order.
 * Changed `cleanRoomsList()` function to require request of .
 * Changed `cleanRoomsUpdate()` function with new required argument order.
 * Changed `dashboardsCreate()` function . New request type is .
 * Added `dashboardsUpdate()` function.
 * Changed `statementExecutionExecuteStatement()` function with new required argument order.
 * Removed `warehousesGetWarehousePermissionLevels()` function.
 * Removed `warehousesGetWarehousePermissions()` function.
 * Removed `warehousesSetWarehousePermissions()` function.
 * Removed `warehousesUpdateWarehousePermissions()` function.
 * Added `warehousesGetPermissionLevels()` function.
 * Added `warehousesGetPermissions()` function.
 * Added `warehousesSetPermissions()` function.
 * Added `warehousesUpdatePermissions()` function.
 * Removed `reposGetRepoPermissionLevels()` function.
 * Removed `reposGetRepoPermissions()` function.
 * Removed `reposSetRepoPermissions()` function.
 * Removed `reposUpdateRepoPermissions()` function.
 * Added `reposGetPermissionLevels()` function.
 * Added `reposGetPermissions()` function.
 * Added `reposSetPermissions()` function.
 * Added `reposUpdatePermissions()` function.
 * Added `secretsGetSecret()` function.
 * Removed `workspaceGetWorkspaceObjectPermissionLevels()` function.
 * Removed `workspaceGetWorkspaceObjectPermissions()` function.
 * Removed `workspaceSetWorkspaceObjectPermissions()` function.
 * Removed `workspaceUpdateWorkspaceObjectPermissions()` function.
 * Added `workspaceGetPermissionLevels()` function.
 * Added `workspaceGetPermissions()` function.
 * Added `workspaceSetPermissions()` function.
 * Added `workspaceUpdatePermissions()` function.

OpenAPI SHA: 93763b0d7ae908520c229c786fff28b8fd623261, Date: 2024-03-20

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