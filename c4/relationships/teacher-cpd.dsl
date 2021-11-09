teacher_cpd.cpd_management -> logit_io "Writes logs to"
teacher_cpd.cpd_management -> sentry_io "Sends errors to"
teacher_cpd.cpd_management.auth -> notify.emails "Sends emails via"

teacher_cpd.ect_support -> logit_io "Writes logs to"
teacher_cpd.ect_support -> sentry_io "Sends errors to"
teacher_cpd.ect_support.auth -> notify.emails "Sends emails via"

teacher_cpd.npq_registrations -> logit_io "Writes logs to"
teacher_cpd.npq_registrations -> sentry_io "Sends errors to"
teacher_cpd.npq_registrations.auth -> notify.emails "Sends emails via"

teacher_cpd.cpd_management.trn_validation -> dqt.api.qualified_teachers "Reads from" "HTTPS TLS 1.2"
teacher_cpd.cpd_management.manage_partnerships -> gias.api.schools_information "Reads from" "HTTPS TLS 1.2"
teacher_cpd.cpd_management.manage_ecf_participants -> gias.api.schools_information "Reads from" "HTTPS TLS 1.2"
teacher_cpd.cpd_management.register -> dqt.api.qualified_teachers "Reads from" "HTTPS TLS 1.2"

teacher_cpd.prometheus -> logit_io "Queries" "HTTPS TLS 1.2"

teacher_cpd -> docker_hub.repository "Pulls new deployable components from" "HTTPS TLS 1.2"
