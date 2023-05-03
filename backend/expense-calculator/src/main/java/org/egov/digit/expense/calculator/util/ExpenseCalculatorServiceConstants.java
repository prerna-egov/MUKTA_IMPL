package org.egov.digit.expense.calculator.util;

public class ExpenseCalculatorServiceConstants {
    public static final String MASTER_TENANTS = "tenants";
    public static final String TENANT_FILTER_CODE = "$.*.code";
    public static final String MDMS_TENANT_MODULE_NAME = "tenant";
    public static final String MDMS_RESP_CONSTANT = "$.MdmsRes.";
    public static final String JSON_PATH_FOR_TENANTS_VERIFICATION = MDMS_RESP_CONSTANT + MDMS_TENANT_MODULE_NAME + "." + MASTER_TENANTS + ".*";
    public static final String MUSTER_ROLL_ID_JSON_PATH = "$.musterRolls.*.id";
    public static final String WAGE_SEEKER_SKILLS = "WageSeekerSkills";
    public static final String MDMS_COMMON_ACTIVE_FILTER ="$.*.[?(@.active==true)]";
    public static final String MDMS_COMMON_MASTERS ="common-masters";
    public static final String JSON_PATH_FOR_WAGE_SEEKERS_SKILLS = MDMS_RESP_CONSTANT+MDMS_COMMON_MASTERS + "." + WAGE_SEEKER_SKILLS;


}