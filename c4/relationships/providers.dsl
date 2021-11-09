lp -> teacher_cpd.cpd_management.auth "Authorised by" "HTTPS TLS 1.2"
lp -> teacher_cpd.cpd_management.manage_partnerships "Uses" "HTTPS TLS 1.2"

lp -> slack.dfe.ambition "Requests support" "HTTPS TLS 1.2"
lp -> slack.dfe.llse "Requests support" "HTTPS TLS 1.2"
lp -> slack.dfe.tdt "Requests support" "HTTPS TLS 1.2"
lp -> slack.dfe.ucl "Requests support" "HTTPS TLS 1.2"
lp -> slack.dfe.coe "Requests support" "HTTPS TLS 1.2"
lp -> slack.dfe.teachfirst "Requests support" "HTTPS TLS 1.2"
lp -> slack.dfe.edt "Requests support" "HTTPS TLS 1.2"
lp -> gsuite.mail "Requests support" "HTTPS TLS 1.2"

dp -> gsuite.mail "Requests support" "HTTPS TLS 1.2"
ab -> gsuite.mail "Requests support" "HTTPS TLS 1.2"


# System relationships
lead_provider_portal -> teacher_cpd.cpd_management.participants "Reads" "HTTPS TLS 1.2"
lead_provider_portal -> teacher_cpd.cpd_management.declarations "Posts" "SSL HTTPS 1.2"
lead_provider_portal -> teacher_cpd.cpd_management.changes_in_circumstances "Posts" "HTTPS TLS 1.
