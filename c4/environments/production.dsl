deploymentEnvironment "Production" {
  deploymentNode "DfE Azure" {
    deploymentNode "GIAS" "" "Azure subscription" {
      softwareSystemInstance gias
    }

    deploymentNode "TRA" "" "Azure subscription" {
      softwareSystemInstance dqt
    }

    deploymentNode "Teach CPD" "" "Azure subscription" {
      containerInstance cip.key_vault
    }
  }

  deploymentNode "Department for Education" "" "GOV UK PaaS" {
    deploymentNode "Teacher CPD" "" "Space" {
      deploymentNode "CPD Management Service" {
        deploymentNode "Docker Container" "" "Alpine Linux"  {
          containerInstance teacher_cpd.cpd_management cpd_management_group
        }

        containerInstance teacher_cpd.cpd_management_db cpd_management_group
      }

      deploymentNode "ECT Support Service" {
        deploymentNode "Docker Container" "" "Alpine Linux" {
          containerInstance teacher_cpd.ect_support
        }

        containerInstance teacher_cpd.ect_support_db
        containerInstance teacher_cpd.ect_support_materials
      }

      deploymentNode "NPQ Registrations Service" {
        deploymentNode "Docker Container" "" "Alpine Linux" {
          containerInstance teacher_cpd.npq_registrations
        }

        containerInstance teacher_cpd.npq_registrations_db
      }
    }
  }
}
