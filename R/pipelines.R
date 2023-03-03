# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create a pipeline.
#' 
#' Creates a new data processing pipeline based on the requested configuration.
#' If successful, this method returns the ID of the new pipeline.
#'
#' @param allow_duplicate_names If false, deployment will fail if name conflicts with that of another pipeline.
#' @param catalog Catalog in UC to add tables to.
#' @param channel DLT Release Channel that specifies which version to use.
#' @param clusters Cluster settings for this pipeline deployment.
#' @param configuration String-String configuration for this pipeline execution.
#' @param continuous Whether the pipeline is continuous or triggered.
#' @param development Whether the pipeline is in Development mode.
#' @param dry_run 
#' @param edition Pipeline product edition.
#' @param filters Filters on which Pipeline packages to include in the deployed graph.
#' @param id Unique identifier for this pipeline.
#' @param libraries Libraries or code needed by this deployment.
#' @param name Friendly identifier for this pipeline.
#' @param photon Whether Photon is enabled for this pipeline.
#' @param storage DBFS root directory for storing checkpoints and tables.
#' @param target Target schema (database) to add tables in this pipeline to.
#' @param trigger Which pipeline trigger to use.
databricks_pipelines_create <- function(allow_duplicate_names = NULL, 
    catalog = NULL, 
    channel = NULL, 
    clusters = NULL, 
    configuration = NULL, 
    continuous = NULL, 
    development = NULL, 
    dry_run = NULL, 
    edition = NULL, 
    filters = NULL, 
    id = NULL, 
    libraries = NULL, 
    name = NULL, 
    photon = NULL, 
    storage = NULL, 
    target = NULL, 
    trigger = NULL, 
    ...) {
    body <- list(
        allow_duplicate_names = allow_duplicate_names, 
        catalog = catalog, 
        channel = channel, 
        clusters = clusters, 
        configuration = configuration, 
        continuous = continuous, 
        development = development, 
        dry_run = dry_run, 
        edition = edition, 
        filters = filters, 
        id = id, 
        libraries = libraries, 
        name = name, 
        photon = photon, 
        storage = storage, 
        target = target, 
        trigger = trigger, ...)
    
    .api$do("POST", "/api/2.0/pipelines", body = body)
}

#' Delete a pipeline.
#' 
#' Deletes a pipeline.
#'
#' @param pipeline_id 
databricks_pipelines_delete <- function(pipeline_id, ...) {
    
    
    .api$do("DELETE", paste("/api/2.0/pipelines/", pipeline_id, sep = ""))
}

#' Get a pipeline.
#'
#' @param pipeline_id 
databricks_pipelines_get <- function(pipeline_id, ...) {
    
    
    .api$do("GET", paste("/api/2.0/pipelines/", pipeline_id, sep = ""))
}

#' Get a pipeline update.
#' 
#' Gets an update from an active pipeline.
#'
#' @param pipeline_id The ID of the pipeline.
#' @param update_id The ID of the update.
databricks_pipelines_get_update <- function(pipeline_id, update_id, ...) {
    
    
    .api$do("GET", paste("/api/2.0/pipelines/", pipeline_id, "/updates/", update_id, sep = ""))
}

#' List pipelines.
#' 
#' Lists pipelines defined in the Delta Live Tables system.
#'
#' @param filter Select a subset of results based on the specified criteria.
#' @param max_results The maximum number of entries to return in a single page.
#' @param order_by A list of strings specifying the order of results.
#' @param page_token Page token returned by previous call.
databricks_pipelines_list_pipelines <- function(filter = NULL, 
    max_results = NULL, 
    order_by = NULL, 
    page_token = NULL, 
    ...) {
    query <- list(
        filter = filter, 
        max_results = max_results, 
        order_by = order_by, 
        page_token = page_token, ...)
    
    
    
    results <- data.frame()
    while (TRUE) {
        json <- .api$do("GET", "/api/2.0/pipelines", query = query)
        if (is.null(nrow(json$statuses))) {
            break
        }
        # append this page of results to one results data.frame
        results <- dplyr::bind_rows(results, json$statuses)
        if (is.null(json$next_page_token)) {
            break
        }
        query$page_token <- json$next_page_token
    }
    return (results)
    
}

#' List pipeline updates.
#' 
#' List updates for an active pipeline.
#'
#' @param max_results Max number of entries to return in a single page.
#' @param page_token Page token returned by previous call.
#' @param pipeline_id The pipeline to return updates for.
#' @param until_update_id If present, returns updates until and including this update_id.
databricks_pipelines_list_updates <- function(pipeline_id, max_results = NULL, 
    page_token = NULL, 
    until_update_id = NULL, 
    ...) {
    query <- list(
        max_results = max_results, 
        page_token = page_token, 
        until_update_id = until_update_id, ...)
    
    .api$do("GET", paste("/api/2.0/pipelines/", pipeline_id, "/updates", , sep = ""), query = query)
}

#' Reset a pipeline.
#' 
#' Resets a pipeline.
#'
#' @param pipeline_id 
databricks_pipelines_reset <- function(pipeline_id, timeout=20, ...) {
    
    
    .api$do("POST", paste("/api/2.0/pipelines/", pipeline_id, "/reset", , sep = ""))
    started <- as.numeric(Sys.time())
    target_states <- c("RUNNING", c())
    failure_states <- c("FAILED", c())
    status_message <- 'polling...'
    attempt <- 1
    while ((started + (timeout*60)) > as.numeric(Sys.time())) {
        poll <- databricks_pipelines_get(pipeline_id = pipeline_id)
        status <- poll$state
        status_message <- poll$cause
        if (status %in% target_states) {
            return (poll)
        }
        if (status %in% failure_states) {
            msg <- paste("failed to reach RUNNING, got ", status, "-", status_message)
            rlang::abort(msg, call = rlang::caller_env())
        }
        prefix <- paste("databricks_pipelines_get(pipeline_id=", pipeline_id)
        sleep <- attempt
        if (sleep > 10) {
            # sleep 10s max per attempt
            sleep <- 10
        }
        msg <- paste(prefix, status, status_message, paste0(". Sleeping ~", sleep, "s"))
        message(msg)
        random_pause <- runif(1, min = 0.1, max = 0.5)
        Sys.sleep(sleep + random_pause)
        attempt <- attempt + 1
    }
    msg <- paste("timed out after", timeout, "minutes:", status_message)
    rlang::abort(msg, call = rlang::caller_env())
}

#' Queue a pipeline update.
#' 
#' Starts or queues a pipeline update.
#'
#' @param cause 
#' @param full_refresh If true, this update will reset all tables before running.
#' @param full_refresh_selection A list of tables to update with fullRefresh.
#' @param pipeline_id 
#' @param refresh_selection A list of tables to update without fullRefresh.
databricks_pipelines_start_update <- function(pipeline_id, cause = NULL, 
    full_refresh = NULL, 
    full_refresh_selection = NULL, 
    refresh_selection = NULL, 
    ...) {
    body <- list(
        cause = cause, 
        full_refresh = full_refresh, 
        full_refresh_selection = full_refresh_selection, 
        refresh_selection = refresh_selection, ...)
    
    .api$do("POST", paste("/api/2.0/pipelines/", pipeline_id, "/updates", , sep = ""), body = body)
}

#' Stop a pipeline.
#' 
#' Stops a pipeline.
#'
#' @param pipeline_id 
databricks_pipelines_stop <- function(pipeline_id, timeout=20, ...) {
    
    
    .api$do("POST", paste("/api/2.0/pipelines/", pipeline_id, "/stop", , sep = ""))
    started <- as.numeric(Sys.time())
    target_states <- c("IDLE", c())
    failure_states <- c("FAILED", c())
    status_message <- 'polling...'
    attempt <- 1
    while ((started + (timeout*60)) > as.numeric(Sys.time())) {
        poll <- databricks_pipelines_get(pipeline_id = pipeline_id)
        status <- poll$state
        status_message <- poll$cause
        if (status %in% target_states) {
            return (poll)
        }
        if (status %in% failure_states) {
            msg <- paste("failed to reach IDLE, got ", status, "-", status_message)
            rlang::abort(msg, call = rlang::caller_env())
        }
        prefix <- paste("databricks_pipelines_get(pipeline_id=", pipeline_id)
        sleep <- attempt
        if (sleep > 10) {
            # sleep 10s max per attempt
            sleep <- 10
        }
        msg <- paste(prefix, status, status_message, paste0(". Sleeping ~", sleep, "s"))
        message(msg)
        random_pause <- runif(1, min = 0.1, max = 0.5)
        Sys.sleep(sleep + random_pause)
        attempt <- attempt + 1
    }
    msg <- paste("timed out after", timeout, "minutes:", status_message)
    rlang::abort(msg, call = rlang::caller_env())
}

#' Edit a pipeline.
#' 
#' Updates a pipeline with the supplied configuration.
#'
#' @param allow_duplicate_names If false, deployment will fail if name has changed and conflicts the name of another pipeline.
#' @param catalog Catalog in UC to add tables to.
#' @param channel DLT Release Channel that specifies which version to use.
#' @param clusters Cluster settings for this pipeline deployment.
#' @param configuration String-String configuration for this pipeline execution.
#' @param continuous Whether the pipeline is continuous or triggered.
#' @param development Whether the pipeline is in Development mode.
#' @param edition Pipeline product edition.
#' @param expected_last_modified If present, the last-modified time of the pipeline settings before the edit.
#' @param filters Filters on which Pipeline packages to include in the deployed graph.
#' @param id Unique identifier for this pipeline.
#' @param libraries Libraries or code needed by this deployment.
#' @param name Friendly identifier for this pipeline.
#' @param photon Whether Photon is enabled for this pipeline.
#' @param pipeline_id Unique identifier for this pipeline.
#' @param storage DBFS root directory for storing checkpoints and tables.
#' @param target Target schema (database) to add tables in this pipeline to.
#' @param trigger Which pipeline trigger to use.
databricks_pipelines_update <- function(pipeline_id, allow_duplicate_names = NULL, 
    catalog = NULL, 
    channel = NULL, 
    clusters = NULL, 
    configuration = NULL, 
    continuous = NULL, 
    development = NULL, 
    edition = NULL, 
    expected_last_modified = NULL, 
    filters = NULL, 
    id = NULL, 
    libraries = NULL, 
    name = NULL, 
    photon = NULL, 
    storage = NULL, 
    target = NULL, 
    trigger = NULL, 
    ...) {
    body <- list(
        allow_duplicate_names = allow_duplicate_names, 
        catalog = catalog, 
        channel = channel, 
        clusters = clusters, 
        configuration = configuration, 
        continuous = continuous, 
        development = development, 
        edition = edition, 
        expected_last_modified = expected_last_modified, 
        filters = filters, 
        id = id, 
        libraries = libraries, 
        name = name, 
        photon = photon, 
        pipeline_id = pipeline_id, 
        storage = storage, 
        target = target, 
        trigger = trigger, ...)
    
    .api$do("PUT", paste("/api/2.0/pipelines/", pipeline_id, sep = ""), body = body)
}













