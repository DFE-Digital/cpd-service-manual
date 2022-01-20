github.actions -> cip.key_vault "Reads credentials and environment config from" "HTTPS TLS 1.2"
github.actions -> docker_hub.repository "Pushes containers to" "HTTPS TLS 1.2"
github.actions -> cpd_management "Terraforms" "HTTPS TLS 1.2"
github.actions -> ect_support "Terraforms" "HTTPS TLS 1.2"
github.actions -> npq_registrations "Terraforms" "HTTPS TLS 1.2"

sentry_io.alert_manager -> slack.dfe.alerts "Pushes alerts to" "HTTPS TLS 1.2"

statuscake_io -> cpd_management.rails.health "pings" "HTTPS TLS 1.2"
statuscake_io -> ect_support.rails.health "pings" "HTTPS TLS 1.2"
statuscake_io -> npq_registrations.rails.health "pings" "HTTPS TLS 1.2"

statuscake_io -> slack.dfe.alerts "Pushes alerts to" "HTTPS TLS 1.2"

data_studio.dashboards.ecf_schools -> cpd_management.cpd_mi_db "Reads events from" "HTTPS TLS 1.2"
data_studio.dashboards.ecf_schools -> ga "Reads events from" "HTTPS TLS 1.2"
data_studio.dashboards.ecf_partnerships -> cpd_management.cpd_mi_db "Reads events from" "HTTPS TLS 1.2"
data_studio.dashboards.ecf_partnerships -> ga "Reads events from" "HTTPS TLS 1.2"
data_studio.dashboards.ecf_validations -> cpd_management.cpd_mi_db "Reads events from" "HTTPS TLS 1.2"
data_studio.dashboards.ecf_validations -> ga "Reads events from" "HTTPS TLS 1.2"
data_studio.dashboards.ecf_declarations -> cpd_management.cpd_mi_db "Reads events from" "HTTPS TLS 1.2"
data_studio.dashboards.ecf_declarations -> ga "Reads events from" "HTTPS TLS 1.2"
data_studio.dashboards.npq_validations -> cpd_management.cpd_mi_db "Reads events from" "HTTPS TLS 1.2"
data_studio.dashboards.npq_validations -> ga "Reads events from" "HTTPS TLS 1.2"
data_studio.dashboards.npq_declarations -> cpd_management.cpd_mi_db "Reads events from" "HTTPS TLS 1.2"
data_studio.dashboards.npq_declarations -> ga "Reads events from" "HTTPS TLS 1.2"


gsuite.mail -> zendesk.console "Forwards support requests" "HTTPS TLS 1.2"
