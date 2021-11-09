nqt -> teacher_cpd.ect_support.auth "Authorised by" "HTTPS TLS 1.2"
nqt -> teacher_cpd.ect_support.learning_materials "Uses" "HTTPS TLS 1.2"
nqt -> gsuite.mail "Requests support" "HTTPS TLS 1.2"

cip_ect -> teacher_cpd.ect_support.auth "Authorised by" "HTTPS TLS 1.2"
cip_ect -> teacher_cpd.ect_support.learning_materials "Uses" "HTTPS TLS 1.2"
cip_ect -> gsuite.mail "Requests support" "HTTPS TLS 1.2"

cip_mentor -> teacher_cpd.ect_support.auth "Authorised by" "HTTPS TLS 1.2"
cip_mentor -> teacher_cpd.ect_support.learning_materials "Uses" "HTTPS TLS 1.2"
cip_mentor -> gsuite.mail "Requests support" "HTTPS TLS 1.2"

fip_ect -> teacher_cpd.cpd_management.auth "Authorised by" "HTTPS TLS 1.2"
fip_ect -> teacher_cpd.cpd_management.register "Uses" "HTTPS TLS 1.2"
fip_ect -> lead_provider_portal "Uses"
fip_ect -> gsuite.mail "Requests support" "HTTPS TLS 1.2"

fip_mentor -> teacher_cpd.cpd_management.auth "Authorised by" "HTTPS TLS 1.2"
fip_mentor -> teacher_cpd.cpd_management.register "Uses" "HTTPS TLS 1.2"
fip_mentor -> lead_provider_portal "Uses"
fip_mentor -> gsuite.mail "Requests support" "HTTPS TLS 1.2"

npq_participant -> teacher_cpd.npq_registrations.auth "Authorised by" "HTTPS TLS 1.2"
npq_participant -> teacher_cpd.npq_registrations.register "Uses" "HTTPS TLS 1.2"
npq_participant -> lead_provider_portal "Uses"
npq_participant -> gsuite.mail "Requests support" "HTTPS TLS 1.2"
