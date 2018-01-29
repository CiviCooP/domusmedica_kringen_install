<?php
/**
 * @file
 * domusmedica_kringsetup.features.inc
 */

/**
 * Implements hook_node_info().
 */
function domusmedica_kringsetup_node_info() {
  $items = array(
    'vergaderstuk_ken_' => array(
      'name' => t('Vergaderstuk(ken)'),
      'base' => 'node_content',
      'description' => '',
      'has_title' => '1',
      'title_label' => t('Titel'),
      'help' => '',
    ),
  );
  drupal_alter('node_info', $items);
  return $items;
}
