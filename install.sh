#!/bin/sh
echo 'Installing a new Domus Medica Instance'
echo 'I)    download and enable drupal modules \n\n'

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
drush en calendar --yes
drush en date --yes
drush en date_popup --yes
drush en date_repeat --yes
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

echo '\n\n'
echo 'II)   create roles and add permisions\n\n'

drush role-create medewerker
drush role-create lid

#hier komt de uitbreiding permissions - hieronder voorbeeld
#drush role-add-perm 'lid' 'access user contact forms'

echo '\n\n'
echo 'III)  download and install CiviCRM extensions\n\n'

#
# Let op: het download pad wordt hier direct genoteerd. Komt er een nieuwere versie van een extensie
# dan moet dit aangepast worden
#
drush cvapi Extension.download key="be.domusmedica.kringsetup" url="https://github.com/CiviCooP/be.domusmedica.kringsetup/archive/v0.2.zip" install="1"
drush cvapi Extension.download key="nz.co.fuzion.csvimport" url="https://github.com/eileenmcnaughton/nz.co.fuzion.csvimport/archive/1.2.zip" install="1"
drush cvapi Extension.download key="nz.co.fuzion.omnipaymultiprocessor" url="https://github.com/eileenmcnaughton/nz.co.fuzion.omnipaymultiprocessor/archive/2.4.zip" install="1"
drush cvapi Extension.download key="org.civicoop.emailapi" url="https://github.com/CiviCooP/org.civicoop.emailapi/archive/V1.12.zip" install="1"
drush cvapi Extension.download key="org.civicrm.angularprofiles" install="1"
drush cvapi Extension.download key="org.civicrm.flexmailer" url="https://github.com/civicrm/org.civicrm.flexmailer/archive/v0.2-alpha5.zip" install="1"
drush cvapi Extension.download key="org.civicrm.shoreditch" url="https://github.com/civicrm/org.civicrm.shoreditch/archive/v0.1-alpha10-nonsafecolour.zip" install="1"
drush cvapi Extension.download key="uk.co.vedaconsulting.mosaico" url="https://download.civicrm.org/extension/uk.co.vedaconsulting.mosaico/latest/uk.co.vedaconsulting.mosaico-latest.zip" install="1"
drush cvapi Extension.download key="be.domusmedica.sync" url="https://github.com/CiviCooP/be.domusmedica.sync/archive/v0.1.zip" install="1"

echo '\n\n'
echo 'IV)   enable and disable CiviCRM Compents\n\n'


echo '{"enable_components" :["CiviContribute","CiviMember","CiviMail","CiviReport","CiviEvent"] }' | drush cvapi Setting.create --in=json    
#nadat de componenten aangepast zijn moet het menu opnieuw worden aangemaakt
drush cc civicrm

echo '\n\n'
echo 'Done'