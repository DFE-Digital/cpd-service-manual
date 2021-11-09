github.actions -> cip.key_vault "Reads credentials and environment config from" "HTTPS TLS 1.2"
github.actions -> docker_hub.repository "Pushes containers to" "HTTPS TLS 1.2"
github.actions -> teacher_cpd "Terraforms" "HTTPS TLS 1.2"

sentry_io.alert_manager -> slack.dfe.alerts "Pushes alerts to" "HTTPS TLS 1.2"

statuscake_io -> teacher_cpd.cpd_management.health "pings" "HTTPS TLS 1.2"
statuscake_io -> teacher_cpd.ect_support.health "pings" "HTTPS TLS 1.2"
statuscake_io -> teacher_cpd.npq_registrations.health "pings" "HTTPS TLS 1.2"

statuscake_io -> slack.dfe.alerts "Pushes alerts to" "HTTPS TLS 1.2"

data_studio.dashboards.ecf_schools -> teacher_cpd.cpd_mi_db "Reads events from" "HTTPS TLS 1.2"
data_studio.dashboards.ecf_schools -> ga "Reads events from" "HTTPS TLS 1.2"
data_studio.dashboards.ecf_partnerships -> teacher_cpd.cpd_mi_db "Reads events from" "HTTPS TLS 1.2"
data_studio.dashboards.ecf_partnerships -> ga "Reads events from" "HTTPS TLS 1.2"
data_studio.dashboards.ecf_validations -> teacher_cpd.cpd_mi_db "Reads events from" "HTTPS TLS 1.2"
data_studio.dashboards.ecf_validations -> ga "Reads events from" "HTTPS TLS 1.2"
data_studio.dashboards.ecf_declarations -> teacher_cpd.cpd_mi_db "Reads events from" "HTTPS TLS 1.2"
data_studio.dashboards.ecf_declarations -> ga "Reads events from" "HTTPS TLS 1.2"
data_studio.dashboards.npq_validations -> teacher_cpd.cpd_mi_db "Reads events from" "HTTPS TLS 1.2"
data_studio.dashboards.npq_validations -> ga "Reads events from" "HTTPS TLS 1.2"
data_studio.dashboards.npq_declarations -> teacher_cpd.cpd_mi_db "Reads events from" "HTTPS TLS 1.2"
data_studio.dashboards.npq_declarations -> ga "Reads events from" "HTTPS TLS 1.2"


gsuite.mail -> zendesk.console "Forwards support requests" "HTTPS TLS 1.2"
