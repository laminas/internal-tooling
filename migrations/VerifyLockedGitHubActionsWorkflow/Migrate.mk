_GHA_MIGRATION_DIRECTORY := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
GHA_LOCKFILE_WORKFLOW := .github/workflows/verify-github-actions-lockfile.yml

ifeq ("$(wildcard $(GHA_LOCKFILE_WORKFLOW))","")

HELP += $(call MK_HELP,'install-gha-lock-verification-workflow','Install a workflow to verify the lockfile for GitHub Actions')

install-gha-lock-verification-workflow: $(GHA_LOCKFILE_WORKFLOW)
	@echo "" > /dev/null
.PHONY: install-gha-lock-verification-workflow

# Install the default workflow for rector in CI
$(GHA_LOCKFILE_WORKFLOW):
	cp $(_GHA_MIGRATION_DIRECTORY)workflow.yml $(GHA_LOCKFILE_WORKFLOW)


endif # ! Workflow file exists
