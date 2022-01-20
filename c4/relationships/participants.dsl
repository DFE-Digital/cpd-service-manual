nqt -> ect_support.rails.auth "Authorised by" "HTTPS TLS 1.2"
nqt -> ect_support.rails.learning_materials "Uses" "HTTPS TLS 1.2"
nqt -> gsuite.mail "Requests support" "HTTPS TLS 1.2"

cip_ect -> ect_support.rails.auth "Authorised by" "HTTPS TLS 1.2"
cip_ect -> ect_support.rails.learning_materials "Uses" "HTTPS TLS 1.2"
cip_ect -> gsuite.mail "Requests support" "HTTPS TLS 1.2"

cip_mentor -> ect_support.rails.auth "Authorised by" "HTTPS TLS 1.2"
cip_mentor -> ect_support.rails.learning_materials "Uses" "HTTPS TLS 1.2"
cip_mentor -> gsuite.mail "Requests support" "HTTPS TLS 1.2"

fip_ect -> cpd_management.rails.auth "Authorised by" "HTTPS TLS 1.2"
fip_ect -> cpd_management.rails.register "Uses" "HTTPS TLS 1.2"
fip_ect -> lead_provider_portal "Uses"
fip_ect -> gsuite.mail "Requests support" "HTTPS TLS 1.2"

fip_mentor -> cpd_management.rails.auth "Authorised by" "HTTPS TLS 1.2"
fip_mentor -> cpd_management.rails.register "Uses" "HTTPS TLS 1.2"
fip_mentor -> lead_provider_portal "Uses"
fip_mentor -> gsuite.mail "Requests support" "HTTPS TLS 1.2"

npq_participant -> npq_registrations.rails.auth "Authorised by" "HTTPS TLS 1.2"
npq_participant -> npq_registrations.rails.register "Uses" "HTTPS TLS 1.2"
npq_participant -> lead_provider_portal "Uses"
npq_participant -> gsuite.mail "Requests support" "HTTPS TLS 1.2"
