/* coding: utf-8 */
/******************************************************************************
 * prometheus_null_adapter
 *
 * Copyright 2020-, Kaede Fujisaki
 *****************************************************************************/

use std::sync::RwLock;

pub struct Context {
  pub cache: RwLock<cascara::Cache<String, String>>,
  pub db_uri: String,
}