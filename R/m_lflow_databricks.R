# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' These endpoints are modified versions of the MLflow API that accept
#' additional input parameters or return additional information.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=m_lflow_databricks_get]{get} \tab Get model.\cr
#'  \link[=m_lflow_databricks_transition_stage]{transition_stage} \tab Transition a stage.\cr
#' }
#'
#' @rdname m_lflow_databricks
#' @export
m_lflow_databricks <- list()

#' Get model.
#' 
#' Get the details of a model. This is a Databricks Workspace version of the
#' [MLflow endpoint] that also returns the model's Databricks Workspace ID and
#' the permission level of the requesting user on the model.
#' 
#' [MLflow endpoint]: https://www.mlflow.org/docs/latest/rest-api.html#get-registeredmodel
#'
#' @param name Required. Name of the model.
#'
#' @keywords internal
#'
#' @rdname m_lflow_databricks_get
#'
#' @aliases m_lflow_databricks_get
m_lflow_databricks_get <- function(name, ...) {
  query <- list(name = name, ...)

  .api$do("GET", "/api/2.0/mlflow/databricks/registered-models/get", query = query)
}
m_lflow_databricks$get <- m_lflow_databricks_get

#' Transition a stage.
#' 
#' Transition a model version's stage. This is a Databricks Workspace version of
#' the [MLflow endpoint] that also accepts a comment associated with the
#' transition to be recorded.',
#' 
#' [MLflow endpoint]: https://www.mlflow.org/docs/latest/rest-api.html#transition-modelversion-stage
#'
#' @param archive_existing_versions Required. Specifies whether to archive all current model versions in the target stage.
#' @param comment User-provided comment on the action.
#' @param name Required. Name of the model.
#' @param stage Required. Target stage of the transition.
#' @param version Required. Version of the model.
#'
#' @keywords internal
#'
#' @rdname m_lflow_databricks_transition_stage
#'
#' @aliases m_lflow_databricks_transition_stage
m_lflow_databricks_transition_stage <- function(name, version, stage, archive_existing_versions,
  comment = NULL, ...) {
  body <- list(archive_existing_versions = archive_existing_versions, comment = comment,
    name = name, stage = stage, version = version, ...)

  .api$do("POST", "/api/2.0/mlflow/databricks/model-versions/transition-stage",
    body = body)
}
m_lflow_databricks$transition_stage <- m_lflow_databricks_transition_stage

