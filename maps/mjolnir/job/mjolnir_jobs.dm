/datum/map/mjolnir
	allowed_jobs = list(
	/datum/job/captain, /datum/job/mayor, /datum/job/hos, /datum/job/komissar, /datum/job/terrep, /datum/job/terguard,
	/datum/job/engineer, /datum/job/roboticist, /datum/job/psiengi, /datum/job/engineer_trainee,
	/datum/job/officer, /datum/job/hangman, /datum/job/detective, /datum/job/secmedic,
	/datum/job/leadhunter, /datum/job/hunter, /datum/job/xenoexpert,
	/datum/job/doctor, /datum/job/healer, /datum/job/chemist,
	/datum/job/qm, /datum/job/cargo_tech, /datum/job/pilot, /datum/job/mining,
	/datum/job/chaplain, /datum/job/janitor, /datum/job/chef, /datum/job/bartender, /datum/job/farmer, /datum/job/merchant, /datum/job/scientist,
	/datum/job/assistant, /datum/job/ratcatcher, /datum/job/beggar, /datum/job/outsider)

	access_modify_region = list(
		ACCESS_REGION_SECURITY = list(access_change_ids),
		ACCESS_REGION_MEDBAY = list(access_change_ids),
		ACCESS_REGION_RESEARCH = list(access_change_ids),
		ACCESS_REGION_ENGINEERING = list(access_change_ids),
		ACCESS_REGION_COMMAND = list(access_change_ids),
		ACCESS_REGION_GENERAL = list(access_change_ids),
		ACCESS_REGION_SUPPLY = list(access_change_ids),
		ACCESS_REGION_NT = list(access_change_ids)
	)

/datum/map/mjolnir/setup_job_lists()
	for(var/job_type in allowed_jobs)
		var/datum/job/job = SSjobs.get_by_path(job_type)
		// Most species are restricted from SCG security and command roles
		if(job && (job.department_flag & COM) && job.allowed_branches.len && !(/datum/mil_branch/civilian in job.allowed_branches))
			for(var/species_name in list(SPECIES_IPC, SPECIES_SKRELL, SPECIES_UNATHI))
				var/datum/species/S = all_species[species_name]
				var/species_blacklist = species_to_job_blacklist[S.type]
				if(!species_blacklist)
					species_blacklist = list()
					species_to_job_blacklist[S.type] = species_blacklist
				species_blacklist |= job.type

// Some jobs for nabber grades defined here due to map-specific job datums.
/decl/cultural_info/culture/nabber/New()
	LAZYADD(valid_jobs, /datum/job/scientist)
	..()

/decl/cultural_info/culture/nabber/New()
	LAZYADD(valid_jobs, /datum/job/assistant)
	..()

/decl/cultural_info/culture/nabber/b/New()
	LAZYADD(valid_jobs, /datum/job/cargo_tech)
	..()

/decl/cultural_info/culture/nabber/a/New()
	LAZYADD(valid_jobs, /datum/job/engineer)
	..()

/decl/cultural_info/culture/nabber/a/plus/New()
	LAZYADD(valid_jobs, /datum/job/doctor)
	..()

/datum/job
	allowed_branches = list(
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ
	)
	required_language = LANGUAGE_HUMAN_LORD


/datum/map/mjolnir
	default_assistant_title = "Civilian"
