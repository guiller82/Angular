SELECT INNERPART.*,
  SUBSTR(status_remday, 1,1)                          AS COMPLETE,
  SUBSTR(status_remday, INSTR(status_remday,'|',1)+1) AS DAYS_REMAINING
FROM
  (SELECT sqc.CPNT_TYP_ID AS cpntTypeID ,
    sqc.CPNT_ID           AS cpntID ,
    sqc.REV_DTE           AS revDate,
    sqc.COMPL_DTE         AS complDate,
    sqc.CMPL_STAT_ID      AS cmplStatID,
    sqc.REQ_DTE           AS reqDate,
    cpt.CPNT_TITLE        AS cpntTtile,
    cpt.RTYP_ID ,
    cpt.DMN_ID ,
    cpt.DEL_MTH_ID ,
    cpt.CPNT_SRC_ID ,
    cpt.NOTACTIVE ,
    cpt.SAFETY_REL ,
    cpt.CREATE_DTE,
    cpt.REV_NUM AS cpntRevNum,
    cpt.REVISER ,
    cpt.APPRVR ,
    cpt.APPRVD ,
    cpt.APPRVL_DTE ,
    cpt.MIN_ENRL ,
    cpt.MAX_ENRL ,
    cpt.CPNT_LEN ,
    cpt.PREP_LEN ,
    cpt.LES_PLAN ,
    cpt.CONTACT ,
    cpt.CREDIT_HRS,
    cpt.CPE_HRS ,
    cpt.CONTACT_HRS ,
    cpt.STUD_MATS ,
    cpt.INST_MATS ,
    cpt.CPNT_DESC ,
    cpt.TGT_AUDNC ,
    cpt.COMMENTS ,
    cpt.GRADE_OPT ,
    cpt.ENRL_THRESHOLD_DAYS ,
    cpt.SHIPPING_REQUIRED,
    cpt.AUTO_FILL_ENRL ,
    cpt.WAITLIST_REMDR_SENT,
    cpt.AUTO_COMPETENCY ,
    cpt.CPNT_CLASSIFICATION ,
    cpt.CHGBCK_METHOD ,
    cpt.CATALOG_SKU ,
    cpt.SCHEDULE_CAN_OVERRIDE_PRICE ,
    cpt.PRODUCTION_READY,
    cpt.CPNT_GOALS ,
    cpt.SELF_RECORD_LRNGEVT ,
    cpt.SUB_RECORD_LRNGEVT ,
    cpt.TAP_DEF_ID ,
    cpt.APPROVAL_REQD ,
    cpt.INIT_PERIOD_TYPE_ID ,
    cpt.INIT_NUMBER ,
    cpt.INIT_BASIS_TYPE_ID,
    cpt.RETRNG_PERIOD_TYPE_ID ,
    cpt.RETRNG_NUMBER ,
    cpt.RETRNG_BASIS_TYPE_ID ,
    cpt.RATING ,
    cpt.SELF_ENRL ,
    cpt.USER_REQ_ENABLED ,
    cpt.USER_CAN_WAITLIST ,
    cpt.CPNT_KEY,
    cpt.REGISTER_ONLINE ,
    cpt.ESIG_ENABLED ,
    cs.CMPL_STAT_DESC AS cmplStatDesc,
    s.fname,
    s.lname,
    s.mi,
    s.PERSON_ID_EXTERNAL AS studID,
    s.LNAME   AS lastName,
    s.FNAME   AS firstName,
    s.MI      AS middleName,
    s.EMP_STAT_ID ,
    s.EMP_TYP_ID,
    s.JL_ID ,
    s.JP_ID ,
    s.TARGET_JP_ID ,
    s.JOB_TITLE ,
    s.DMN_ID AS DMN_ID_1 ,
    s.ORG_ID,
    s.REGION_ID,
    s.CO_ID ,
    DECODE(s.NOTACTIVE, 'Y','N','N','Y') AS studActive ,
    s.ADDR ,
    s.CITY ,
    s.STATE ,
    s.POSTAL ,
    s.CNTRY ,
    s.SUPER ,
    s.COACH_STUD_ID ,
    s.HIRE_DTE,
    s.TERM_DTE ,
    s.EMAIL_ADDR,
    s.RESUME_LOCN ,
    s.COMMENTS AS COMMENTS_1 ,
    s.SHIPPING_NAME ,
    s.SHIPPING_CONTACT_NAME,
    s.SHIPPING_ADDR ,
    s.SHIPPING_ADDR1 ,
    s.SHIPPING_CITY ,
    s.SHIPPING_STATE,
    s.SHIPPING_POSTAL ,
    s.SHIPPING_CNTRY ,
    s.SHIPPING_PHON_NUM ,
    s.SHIPPING_FAX_NUM ,
    s.SHIPPING_EMAIL_ADDR ,
    s.STUD_PSWD ,
    s.PIN ,
    s.PIN_DATE,
    s.ENCRYPTED ,
    s.HAS_ACCESS ,
    s.BILLING_NAME ,
    s.BILLING_CONTACT_NAME ,
    s.BILLING_ADDR ,
    s.BILLING_ADDR1 ,
    s.BILLING_CITY ,
    s.BILLING_STATE ,
    s.BILLING_POSTAL,
    s.BILLING_CNTRY ,
    s.BILLING_PHON_NUM ,
    s.BILLING_FAX_NUM ,
    s.BILLING_EMAIL_ADDR ,
    s.SELF_REGISTRATION ,
    s.SELF_REGISTRATION_DATE,
    s.ACCESS_TO_ORG_FIN_ACT ,
    s.NOTIFY_DEV_PLAN_ITEM_ADD ,
    s.NOTIFY_DEV_PLAN_ITEM_MOD ,
    s.NOTIFY_DEV_PLAN_ITEM_REMOVE ,
    s.NOTIFY_WHEN_SUB_ITEM_COMPLETE ,
    s.NOTIFY_WHEN_SUB_ITEM_FAILURE ,
    s.LOCKED ,
    s.PASSWORD_EXP_DATE,
    s.SECURITY_QUESTION ,
    s.SECURITY_ANSWER ,
    s.ROLE_ID ,
    s.IMAGE_ID ,
    s.GENDER ,
    s.PAST_SERVICE,
    s.LST_UNLOCK_TSTMP,
    s.MANAGE_SUB_SP,
    s.MANAGE_OWN_SP,
    NVL(userPref.preferred_timezone,pkg_state.get_default_timezone())                   AS preferred_timezone,
    sq.qual_id                                                                          AS qualID,
    sq.assgn_dte                                                                        AS assignDate,
    sq.qual_id_root                                                                     AS qualIDRoot,
    q.qual_title                                                                        AS qualTitle,
    q.DMN_ID                                                                            AS qualDomain,
    q.QUAL_TYP_ID                                                                       AS qualTypeID ,
    q.NOTACTIVE                                                                         AS qualNotActive ,
    q.CREATE_DTE                                                                        AS qualCreateDate,
    q.QUAL_DESC                                                                         AS qualDesc,
    q.FORCE_INCOMPLETE                                                                  AS qualForceIncomplete,
    q.BASIS_DATE                                                                        AS qualBasisDate,
    q.ESIG_ENABLED                                                                      AS qualEsigEnabled,
    pkg_student.get_delm_stud_qual_stat_rmday (sq.stud_id, sq.qual_id, sq.qual_id_root) AS status_remday,
    sup.PERSON_ID_EXTERNAL AS manager_ID,
    sup.LNAME AS manager_lastName,
    sup.FNAME AS manager_firstName,
    sup.MI AS manager_middleName
  FROM PA_STUD_QUAL_CPNT sqc,
    PV_COURSE cpt,
    PA_CMPL_STAT cs,
    pa_student s,
    pa_student sup,
    pa_user_preference userPref,
    pa_qual q,
    (SELECT sq.stud_id,
      sq.qual_id,
      sq.assgn_dte,
      sq.qual_id_root,
      row_number() over (partition BY sq.stud_id,sq.qual_id order by sq.assgn_dte) rnum
    FROM
      (SELECT sq.stud_id,
        sq.qual_id,
        sq.assgn_dte,
        sq.qual_id_root
      FROM pa_stud_qual_relation sq,
        ( SELECT sq.stud_id FROM pa_stud_qual sq WHERE 1=1
        /** and sq.stud_id in [UserSearch] */
        /** and sq.qual_id in [CurriculumSearch] */
             UNION
        SELECT sq.stud_id
        FROM pa_stud_qual_relation sq
        WHERE 1=1
          /** and sq.stud_id in [UserSearch] */
          /** and sq.qual_id in [CurriculumSearch] */
 
        ) students
      WHERE sq.stud_id = students.stud_id
      /** and sq.qual_id in [CurriculumSearch]*/
      UNION ALL
      SELECT sq.stud_id,
        sq.qual_id,
        sq.assgn_dte,
        sq.qual_id_root
      FROM pa_stud_qual_relation sq,
        pa_qual_relation qr,
        ( SELECT sq.stud_id, sq.qual_id FROM pa_stud_qual sq WHERE 1=1
        /** and sq.stud_id in [UserSearch] */
        /** and sq.qual_id in [CurriculumSearch] */
       
        UNION
        SELECT sq.stud_id,
          sq.qual_id
        FROM pa_stud_qual_relation sq
        WHERE 1=1
          /** and sq.stud_id in [UserSearch] */
          /** and sq.qual_id in [CurriculumSearch] */
         
        ) students
      WHERE sq.stud_id     = students.stud_id
      AND qr.qual_id_child = sq.qual_id
      AND students.qual_id = qr.qual_id_parent
        /** and qr.qual_id_parent in [CurriculumSearch]*/
      ) sq
    ) sq
  WHERE sqc.STUD_ID (+)   = sq.stud_id
  AND sqc.QUAL_ID (+)     = sq.qual_id
  AND sqc.QUAL_ID_ROOT(+) = sq.qual_id_root
  AND sqc.CPNT_TYP_ID     = cpt.CPNT_TYP_ID (+)
  AND sqc.CPNT_ID         = cpt.CPNT_ID (+)
  AND sqc.REV_DTE         = cpt.REV_DTE (+)
  AND sqc.CMPL_STAT_ID    = cs.CMPL_STAT_ID (+)
  AND s.stud_id           = sq.stud_id
    /** and s.notactive  = [UserStatus]*/
  AND s.stud_id             = userPref.user_id(+)
  AND s.super=sup.stud_id
  AND userPref.user_type(+) = 'S'
  AND sq.rnum               = 1
  AND sq.qual_id            = q.qual_id
    /** and [security:pa_student s]*/
  ) INNERPART
ORDER BY studID
