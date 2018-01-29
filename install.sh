#!/bin/sh
echo 'Installing a new Domus Medica Instance'
echo '*)    download and enable drupal modules \n\n'

drush en entity --yes
drush en entity_token --yes
drush en libraries --yes
drush en masquerade --yes
# clone moet onder andere naam gedownload worden als geinstalleerd
# vandaar de onderstaande twee lijnen
drush dl node_clone --yes
drush en clone --yes
drush en entity_token --yes
drush en module_filter --yes
drush en webform --yes
drush en webform_civicrm --yes
drush en ctools --yes
drush en date --yes
drush en date_popup --yes
drush en date_repeat --yes
drush en calendar --yes
drush en imce --yes
drush en wysiwyg --yes
drush en imce_wysiwyg --yes
drush en options_element --yes
drush en l10n_update --yes
drush en views --yes
drush en views_ui --yes
drush en content_access --yes
drush en uuid --yes
drush en addressfield --yes
drush en viewreference --yes
drush en webform_calculator --yes
drush en webform_layout --yes
drush en webform_matrix_component --yes

drush en civi_bartik -y
# onderstaande maakt civi_bartik gelijk het admin thema
# voor CiviCRM
drush vset civicrmtheme_theme_admin civi_bartik

echo '\n\n'
echo '*)   create roles and add permisions\n\n'

drush role-create medewerker
drush role-create lid

#hier komt de uitbreiding permissions - hieronder voorbeeld
#drush role-add-perm 'lid' 'access user contact forms'


drush role-add-perm 'lid' 'access own webform results'
drush role-add-perm 'lid' 'access own webform submissions'
drush role-add-perm 'lid' 'access user contact forms'
drush role-add-perm 'lid' 'access user profiles'
drush role-add-perm 'lid' 'change own username'
drush role-add-perm 'lid' 'edit own webform submissions'

drush role-add-perm 'medewerker' 'access all webform results'
drush role-add-perm 'medewerker' 'access CiviContribute'
drush role-add-perm 'medewerker' 'access CiviCRM'
drush role-add-perm 'medewerker' 'access CiviEvent'
drush role-add-perm 'medewerker' 'access CiviMail'
drush role-add-perm 'medewerker' 'access CiviMember'
drush role-add-perm 'medewerker' 'access CiviReport'
drush role-add-perm 'medewerker' 'access deleted contacts'
drush role-add-perm 'medewerker' 'access own webform results'
drush role-add-perm 'medewerker' 'access own webform submissions'
drush role-add-perm 'medewerker' 'access Report Criteria'
drush role-add-perm 'medewerker' 'access user profiles'
drush role-add-perm 'medewerker' 'add contacts'
drush role-add-perm 'medewerker' 'administer users'
drush role-add-perm 'medewerker' 'change own username'
drush role-add-perm 'medewerker' 'create page content'
drush role-add-perm 'medewerker' 'create vergaderstuk_ken_ content'
drush role-add-perm 'medewerker' 'delete activities'
drush role-add-perm 'medewerker' 'delete any page content'
drush role-add-perm 'medewerker' 'delete any vergaderstuk_ken_ content'
drush role-add-perm 'medewerker' 'delete contacts'
drush role-add-perm 'medewerker' 'delete in CiviEvent'
drush role-add-perm 'medewerker' 'delete in CiviMail'
drush role-add-perm 'medewerker' 'delete own page content'
drush role-add-perm 'medewerker' 'delete own vergaderstuk_ken_ content'
drush role-add-perm 'medewerker' 'edit all contacts'
drush role-add-perm 'medewerker' 'edit all events'
drush role-add-perm 'medewerker' 'edit all webform submissions'
drush role-add-perm 'medewerker' 'edit any page content'
drush role-add-perm 'medewerker' 'edit any vergaderstuk_ken_ content'
drush role-add-perm 'medewerker' 'edit contributions'
drush role-add-perm 'medewerker' 'edit event participants'
drush role-add-perm 'medewerker' 'edit groups'
drush role-add-perm 'medewerker' 'edit memberships'
drush role-add-perm 'medewerker' 'edit my contact'
drush role-add-perm 'medewerker' 'edit own page content'
drush role-add-perm 'medewerker' 'edit own vergaderstuk_ken_ content'
drush role-add-perm 'medewerker' 'edit own webform submissions'
drush role-add-perm 'medewerker' 'manage tags'
drush role-add-perm 'medewerker' 'masquerade as user'
drush role-add-perm 'medewerker' 'merge duplicate contacts'
drush role-add-perm 'medewerker' 'search content'
drush role-add-perm 'medewerker' 'use text format full_html'
drush role-add-perm 'medewerker' 'view all activities'
drush role-add-perm 'medewerker' 'view all contacts'
drush role-add-perm 'medewerker' 'view my contact'
drush role-add-perm 'medewerker' 'view public CiviMail content'


echo '\n\n'
echo '*)  download and install CiviCRM extensions\n\n'

#
# Let op: het download pad wordt hier direct genoteerd. Komt er een nieuwere versie van een extensie
# dan moet dit aangepast worden
#
drush cvapi Extension.download key="be.domusmedica.kringsetup" url="https://github.com/CiviCooP/be.domusmedica.kringsetup/archive/master.zip" install="1"
drush cvapi Extension.download key="nz.co.fuzion.csvimport" url="https://github.com/eileenmcnaughton/nz.co.fuzion.csvimport/archive/1.2.zip" install="1"
drush cvapi Extension.download key="nz.co.fuzion.omnipaymultiprocessor" url="https://github.com/eileenmcnaughton/nz.co.fuzion.omnipaymultiprocessor/archive/2.4.zip" install="1"
drush cvapi Extension.download key="org.civicoop.emailapi" url="https://github.com/CiviCooP/org.civicoop.emailapi/archive/V1.12.zip" install="1"
drush cvapi Extension.download key="org.civicrm.angularprofiles" install="1"
drush cvapi Extension.download key="org.civicrm.flexmailer" url="https://github.com/civicrm/org.civicrm.flexmailer/archive/v0.2-alpha5.zip" install="1"
drush cvapi Extension.download key="org.civicrm.shoreditch" url="https://github.com/civicrm/org.civicrm.shoreditch/archive/v0.1-alpha10-nonsafecolour.zip" install="1"
drush cvapi Extension.download key="uk.co.vedaconsulting.mosaico" url="https://download.civicrm.org/extension/uk.co.vedaconsulting.mosaico/latest/uk.co.vedaconsulting.mosaico-latest.zip" install="1"
drush cvapi Extension.download key="be.domusmedica.sync" url="https://github.com/CiviCooP/be.domusmedica.sync/archive/master.zip" install="1"

echo '\n\n'
echo '*)   enable and disable CiviCRM Compents\n\n'


echo '{"enable_components" :["CiviContribute","CiviMember","CiviMail","CiviReport","CiviEvent"] }' | drush cvapi Setting.create --in=json
#nadat de componenten aangepast zijn moet het menu opnieuw worden aangemaakt
drush cc civicrm

echo '\n\n'
echo 'Done'
