<?php
/**
 * @file
 * domusmedica_kringsetup.features.user_role.inc
 */

/**
 * Implements hook_user_default_roles().
 */
function domusmedica_kringsetup_user_default_roles() {
  $roles = array();

  // Exported role: administrator.
  $roles['administrator'] = array(
    'name' => 'administrator',
    'weight' => 4,
  );

  // Exported role: medewerker.
  $roles['medewerker'] = array(
    'name' => 'medewerker',
    'weight' => 3,
  );

  return $roles;
}
