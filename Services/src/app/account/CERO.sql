SELECT INNERPART.*, 
       Substr(status_remday, 1, 1)       AS       COMPLETE, 
       Substr(status_remday, Instr(status_remday, '|', 1) + 1)       AS       DAYS_REMAINING 
FROM   
(
  		SELECT sqc.cpnt_typ_id AS cpntTypeID, 
               sqc.cpnt_id AS cpntID, 
               sqc.rev_dte AS revDate, 
               sqc.compl_dte AS complDate, 
               sqc.cmpl_stat_id AS cmplStatID, 
               sqc.req_dte AS reqDate, 
               cpt.cpnt_title AS cpntTtile, 
               cpt.rtyp_id, 
               cpt.dmn_id, 
               cpt.del_mth_id, 
               cpt.cpnt_src_id, 
               cpt.notactive, 
               cpt.safety_rel, 
               cpt.create_dte, 
               cpt.rev_num AS cpntRevNum, 
               cpt.reviser, 
               cpt.apprvr, 
               cpt.apprvd, 
               cpt.apprvl_dte, 
               cpt.min_enrl, 
               cpt.max_enrl, 
               cpt.cpnt_len, 
               cpt.prep_len, 
               cpt.les_plan, 
               cpt.contact, 
               cpt.credit_hrs, 
               cpt.cpe_hrs, 
               cpt.contact_hrs, 
               cpt.stud_mats, 
               cpt.inst_mats, 
               cpt.cpnt_desc, 
               cpt.tgt_audnc, 
               cpt.comments, 
               cpt.grade_opt, 
               cpt.enrl_threshold_days, 
               cpt.shipping_required, 
               cpt.auto_fill_enrl, 
               cpt.waitlist_remdr_sent, 
               cpt.auto_competency, 
               cpt.cpnt_classification, 
               cpt.chgbck_method, 
               cpt.catalog_sku, 
               cpt.schedule_can_override_price, 
               cpt.production_ready, 
               cpt.cpnt_goals, 
               cpt.self_record_lrngevt, 
               cpt.sub_record_lrngevt, 
               cpt.tap_def_id, 
               cpt.approval_reqd, 
               cpt.init_period_type_id, 
               cpt.init_number, 
               cpt.init_basis_type_id, 
               cpt.retrng_period_type_id, 
               cpt.retrng_number, 
               cpt.retrng_basis_type_id, 
               cpt.rating, 
               cpt.self_enrl, 
               cpt.user_req_enabled, 
               cpt.user_can_waitlist, 
               cpt.cpnt_key, 
               cpt.register_online, 
               cpt.esig_enabled, 
               cs.cmpl_stat_desc AS cmplStatDesc, 
               s.fname, 
               s.lname, 
               s.mi, 
               s.person_id_external AS studID, 
               s.lname AS lastName, 
               s.fname AS firstName, 
               s.mi AS middleName, 
               s.emp_stat_id, 
               s.emp_typ_id, 
               s.jl_id, 
               s.jp_id, 
               s.target_jp_id, 
               s.job_title, 
               s.dmn_id AS DMN_ID_1, 
               s.org_id, 
               s.region_id, 
               s.co_id, 
               Decode(s.notactive, 'Y', 'N', 'N', 'Y') AS studActive, 
               s.addr, 
               s.city, 
               s.state, 
               s.postal, 
               s.cntry, 
               s.super, 
               s.coach_stud_id, 
               s.hire_dte, 
               s.term_dte, 
               s.email_addr, 
               s.resume_locn, 
               s.comments AS COMMENTS_1, 
               s.shipping_name, 
               s.shipping_contact_name, 
               s.shipping_addr, 
               s.shipping_addr1, 
               s.shipping_city, 
               s.shipping_state, 
               s.shipping_postal, 
               s.shipping_cntry, 
               s.shipping_phon_num, 
               s.shipping_fax_num, 
               s.shipping_email_addr, 
               s.stud_pswd, 
               s.pin, 
               s.pin_date, 
               s.encrypted, 
               s.has_access, 
               s.billing_name, 
               s.billing_contact_name, 
               s.billing_addr, 
               s.billing_addr1, 
               s.billing_city, 
               s.billing_state, 
               s.billing_postal, 
               s.billing_cntry, 
               s.billing_phon_num, 
               s.billing_fax_num, 
               s.billing_email_addr, 
               s.self_registration, 
               s.self_registration_date, 
               s.access_to_org_fin_act, 
               s.notify_dev_plan_item_add, 
               s.notify_dev_plan_item_mod, 
               s.notify_dev_plan_item_remove, 
               s.notify_when_sub_item_complete, 
               s.notify_when_sub_item_failure, 
               s.LOCKED, 
               s.password_exp_date, 
               s.security_question, 
               s.security_answer, 
               s.role_id, 
               s.image_id, 
               s.gender, 
               s.past_service, 
               s.lst_unlock_tstmp, 
               s.manage_sub_sp, 
               s.manage_own_sp, 
			   Nvl(userPref.preferred_timezone, pkg_state.Get_default_timezone()) AS preferred_timezone, 
				sq.qual_id AS qualID, 
				sq.assgn_dte AS assignDate, 
				sq.qual_id_root AS qualIDRoot, 
				q.qual_title AS qualTitle, 
				q.dmn_id AS qualDomain, 
                q.qual_typ_id AS qualTypeID, 
                q.notactive AS  qualNotActive, 
                q.create_dte AS qualCreateDate, 
                q.qual_desc AS qualDesc, 
                q.force_incomplete AS qualForceIncomplete, 
                q.basis_date AS qualBasisDate, 
                q.esig_enabled AS qualEsigEnabled, 
                pkg_student.Get_delm_stud_qual_stat_rmday (sq.stud_id, sq.qual_id, sq.qual_id_root) AS status_remday, 
                sup.person_id_external AS manager_ID, 
                sup.lname AS manager_lastName, 
                sup.fname AS manager_firstName, 
                sup.mi AS manager_middleName, 
                b.jl_id AS JobLocation, 
                c.org_id AS ORGID 

		FROM  

        pa_stud_qual_cpnt sqc, 
		pv_course cpt, 
		pa_cmpl_stat cs, 
		pa_student s, 
		pa_student sup, 
		pa_job_loc b, 
		pa_org c, 
		pa_user_preference userPref, 
		pa_qual q, 

                (SELECT sq.stud_id, 
                        sq.qual_id, 
                        sq.assgn_dte, 
                        sq.qual_id_root, 
                        Row_number() 
                        over ( 
                            PARTITION BY sq.stud_id, sq.qual_id 
                            ORDER BY sq.assgn_dte) rnum 
                            FROM
                                (SELECT sq.stud_id, 

                                                s.jl_id, 
                                                s.org_id, 
                                                s.region_id, 
                                                sq.qual_id, 
                                                sq.assgn_dte, 
                                                sq.qual_id       AS       qual_id_root 
                                        FROM   pa_stud_qual sq, 
                                                pa_student s 
                                        WHERE  1 = 1 
                                        /** and sq.stud_id in [UserSearch] */ 
                                        /** and sq.qual_id in [CurriculumSearch] */ 
                                ) sq
                )  sq 
                
                WHERE  sqc.stud_id (+) = sq.stud_id 
                AND sqc.qual_id (+) = sq.qual_id 
                AND sqc.qual_id_root(+) = sq.qual_id_root 
                AND sqc.cpnt_typ_id = cpt.cpnt_typ_id (+) 
                AND sqc.cpnt_id = cpt.cpnt_id (+) 
                AND sqc.rev_dte = cpt.rev_dte (+) 
                AND sqc.cmpl_stat_id = cs.cmpl_stat_id (+) 
                AND s.stud_id = sq.stud_id 
                /** and s.notactive = [UserStatus]*/ 
                AND s.stud_id = userPref.user_id(+) 
                AND s.super = sup.stud_id 
                AND s.jl_id = b.jl_id 
                AND s.org_id = c.org_id 
                AND userPref.user_type(+) = 'S' 
                AND sq.rnum = 1 
                AND sq.qual_id = q.qual_id 
                /** and [security:pa_student s]*/ 

) INNERPART 
/** and s.org_id in [OrganizationSearch] */ 
/** and s.jl_id in [JobLocationSearch] */ 
ORDER  BY studid 