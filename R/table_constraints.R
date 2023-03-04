# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' Primary key and foreign key constraints encode relationships between fields
#' in tables.
#' 
#' Primary and foreign keys are informational only and are not enforced. Foreign
#' keys must reference a primary key in another table. This primary key is the
#' parent constraint of the foreign key and the table this primary key is on is
#' the parent table of the foreign key. Similarly, the foreign key is the child
#' constraint of its referenced primary key; the table of the foreign key is the
#' child table of the primary key.
#' 
#' You can declare primary keys and foreign keys as part of the table
#' specification during table creation. You can also add or drop constraints on
#' existing tables.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=table_constraints_create]{create} \tab Create a table constraint.\cr
#'  \link[=table_constraints_delete]{delete} \tab Delete a table constraint.\cr
#' }
#'
#' @rdname table_constraints
#' @export
table_constraints <- list()

#' Create a table constraint.
#' 
#' Creates a new table constraint.
#' 
#' For the table constraint creation to succeed, the user must satisfy both of
#' these conditions: - the user must have the **USE_CATALOG** privilege on the
#' table's parent catalog, the **USE_SCHEMA** privilege on the table's parent
#' schema, and be the owner of the table. - if the new constraint is a
#' __ForeignKeyConstraint__, the user must have the **USE_CATALOG** privilege on
#' the referenced parent table's catalog, the **USE_SCHEMA** privilege on the
#' referenced parent table's schema, and be the owner of the referenced parent
#' table.
#'
#' @param constraint Required. A table constraint, as defined by *one* of the following fields being set: __primary_key_constraint__, __foreign_key_constraint__, __named_table_constraint__.
#' @param full_name_arg Required. The full name of the table referenced by the constraint.
#'
#' @keywords internal
#'
#' @rdname table_constraints_create
#'
#' @aliases table_constraints_create
table_constraints_create <- function(full_name_arg, constraint) {
  body <- list(constraint = constraint, full_name_arg = full_name_arg)
  .api$do("POST", "/api/2.1/unity-catalog/constraints", body = body)
}
table_constraints$create <- table_constraints_create

#' Delete a table constraint.
#' 
#' Deletes a table constraint.
#' 
#' For the table constraint deletion to succeed, the user must satisfy both of
#' these conditions: - the user must have the **USE_CATALOG** privilege on the
#' table's parent catalog, the **USE_SCHEMA** privilege on the table's parent
#' schema, and be the owner of the table. - if __cascade__ argument is **true**,
#' the user must have the following permissions on all of the child tables: the
#' **USE_CATALOG** privilege on the table's catalog, the **USE_SCHEMA**
#' privilege on the table's schema, and be the owner of the table.
#'
#' @param cascade Required. If true, try deleting all child constraints of the current constraint.\n If false, reject this operation if the current constraint has any child constraints.
#' @param constraint_name Required. The name of the constraint to delete.
#' @param full_name Required. Full name of the table referenced by the constraint.
#'
#' @keywords internal
#'
#' @rdname table_constraints_delete
#'
#' @aliases table_constraints_delete
table_constraints_delete <- function(full_name, constraint_name, cascade) {
  query <- list(cascade = cascade, constraint_name = constraint_name)
  .api$do("DELETE", paste("/api/2.1/unity-catalog/constraints/", full_name, sep = ""),
    query = query)
}
table_constraints$delete <- table_constraints_delete

