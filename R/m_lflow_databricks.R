# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Get model.
#' 
#' Get the details of a model. This is a Databricks Workspace version of the
#' [MLflow endpoint] that also returns the model's Databricks Workspace ID and
#' the permission level of the requesting user on the model.
#' 
#' [MLflow endpoint]: https://www.mlflow.org/docs/latest/rest-api.html#get-registeredmodel
#'
#' @param name Name of the model.
m_lflow_databricks_get <- function(name, ...) {
    query <- list(
        name = name, ...)
    
    .api$do("GET", "/api/2.0/mlflow/databricks/registered-models/get", query = query)
}

#' Transition a stage.
#' 
#' Transition a model version's stage. This is a Databricks Workspace version of
#' the [MLflow endpoint] that also accepts a comment associated with the
#' transition to be recorded.",
#' 
#' [MLflow endpoint]: https://www.mlflow.org/docs/latest/rest-api.html#transition-modelversion-stage
#'
#' @param archive_existing_versions Specifies whether to archive all current model versions in the target stage.
#' @param comment User-provided comment on the action.
#' @param name Name of the model.
#' @param stage Target stage of the transition.
#' @param version Version of the model.
m_lflow_databricks_transition_stage <- function(name, version, stage, archive_existing_versions, comment = NULL, 
    ...) {
    body <- list(
        archive_existing_versions = archive_existing_versions, 
        comment = comment, 
        name = name, 
        stage = stage, 
        version = version, ...)
    
    .api$do("POST", "/api/2.0/mlflow/databricks/model-versions/transition-stage", body = body)
}













