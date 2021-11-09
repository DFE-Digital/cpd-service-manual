teacher_cpd = softwareSystem "Teacher CPD" {

  group "datastores" {
    cpd_management_db = container "CPD Management DB" "" "PostgreSQL" "Datastore"
    ect_support_db = container "ECT Support DB" "" "PostgreSQL" "Datastore"
    npq_registrations_db = container "NPQ Registrations DB" "" "PostgreSQL" "Datastore"

    ect_support_materials = container "ECT Support Materials" "" "S3" "Blobstore"

    cpd_mi_db = container "CPD MI DB" "" "PostgreSQL" "Datastore"
  }

  group "services" {

    cpd_management = container "CPD Management" "" "Ruby on Rails" "Rails" {
      group "API" {
        participants = component "Participants endpoints" "" "Restful JSON API" {
          -> cpd_management_db "Reads and Writes" "Encrypted postgreSQL connection"
        }

        declarations = component "Declarations endpoints" "" "Restful JSON API" {
          -> cpd_management_db "Reads and Writes" "Encrypted postgreSQL connection"
        }

        changes_in_circumstances = component "Changes in Circumstances endpoints" "" "Restful JSON API" {
          -> cpd_management_db "Reads and Writes" "Encrypted postgreSQL connection"
        }

        users = component "Users endpoint" "" "Restful JSON endpoint" {
          -> cpd_management_db "Reads and Writes" "Encrypted postgreSQL connection"
        }

        npq_registrations = component "NPQ Registrations endpoints" "" "Restful JSON API" {
          -> cpd_management_db "Reads and Writes" "Encrypted postgreSQL connection"
        }

        npq_acceptance = component "NPQ Acceptance endpoints" "" "Restful JSON API" {
          -> cpd_management_db "Reads and Writes" "Encrypted postgreSQL connection"
        }

        trn_validation = component "TRN Validation endpoints" "" "Restful JSON API" {
          -> cpd_management_db "Reads and Writes" "Encrypted postgreSQL connection"
        }
      }

      group "UI" {
        auth = component "Authorise" "" "GOV UK UI" {
          -> cpd_management.users "Reads from" "HTTPS TLS 1.2"
        }

        manage_partnerships = component "Manage ECF Partnerships" "" "GOV UK UI" {
          -> cpd_management_db "Uses" "Encrypted postgreSQL connection"
        }

        manage_ecf_participants = component "Manage ECF Participants" "" "GOV UK UI" {
          -> cpd_management_db "Uses" "Encrypted postgreSQL connection"
        }

        register = component "ECF Registration " "" "GOV UK UI" {
          -> cpd_management_db "Uses" "Encrypted postgreSQL connection"
        }
      }

      health = component "Healthcheck" "" "Restful JSON API"

      component "Background tasks" "" "Worker" {
        -> cpd_management_db "Reads data from" "Encrypted postgreSQL connection"
        -> cpd_mi_db "Writes MI to" "Encrypted postgreSQL connection"
      }
    }

    ect_support = container "ECT Support" "" "Ruby on Rails" "Rails" {
      auth = component "Authorise" "" "GOV UK UI" {
        -> cpd_management.users "Reads from" "HTTPS TLS 1.2"
      }

      learning_materials = component "CIP Learing Materials" "" "GOV UK UI" {
        -> ect_support_db "Reads and Writes" "Encrypted postgreSQL connection"
        -> ect_support_materials "Reads and Writes" "HTTPS TLS 1.2"

        -> cpd_management.users "Reads from" "HTTPS TLS 1.2"
      }

      health = component "Healthcheck" "" "Restful JSON API"
    }

    npq_registrations = container "NPQ Registrations" "" "Ruby on Rails" "Rails" {
      auth = component "Authorise" "" "GOV UK UI" {
        -> cpd_management.users "Reads from" "HTTPS TLS 1.2"
      }

      register = component "Register for an NPQ" "" "GOV UK UI" {
        -> npq_registrations_db "Reads and Writes" "Encrypted postgreSQL connection"

        -> cpd_management.npq_registrations "Posts to" "HTTPS TLS 1.2"
        -> cpd_management.trn_validation "Reads from" "HTTPS TLS 1.2"
      }

      health = component "Healthcheck" "" "Restful JSON API"
    }
  }

  prometheus = container "Prometheus"
}
