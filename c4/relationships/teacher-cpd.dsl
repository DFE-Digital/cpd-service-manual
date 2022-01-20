cpd_management -> logit_io "Writes logs to"
cpd_management -> sentry_io "Sends errors to"
cpd_management.rails.auth -> notify.emails "Sends emails via"

ect_support -> logit_io "Writes logs to"
ect_support -> sentry_io "Sends errors to"
ect_support.rails.auth -> notify.emails "Sends emails via"

npq_registrations -> logit_io "Writes logs to"
npq_registrations -> sentry_io "Sends errors to"
npq_registrations.rails.auth -> notify.emails "Sends emails via"

cpd_management.rails.trn_validation -> dqt.api.qualified_teachers "Reads from" "HTTPS TLS 1.2"
cpd_management.rails.manage_partnerships -> gias.api.schools_information "Reads from" "HTTPS TLS 1.2"
cpd_management.rails.manage_ecf_participants -> gias.api.schools_information "Reads from" "HTTPS TLS 1.2"
cpd_management.rails.register -> dqt.api.qualified_teachers "Reads from" "HTTPS TLS 1.2"

prometheus -> logit_io "Queries" "HTTPS TLS 1.2"

cpd_management -> docker_hub.repository "Pulls new deployable components from" "HTTPS TLS 1.2"
ect_support -> docker_hub.repository "Pulls new deployable components from" "HTTPS TLS 1.2"
npq_registrations -> docker_hub.repository "Pulls new deployable components from" "HTTPS TLS 1.2"
