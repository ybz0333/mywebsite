package com.ybz.myWebsite.po;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SurveyExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SurveyExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andSenderNameIsNull() {
            addCriterion("sender_name is null");
            return (Criteria) this;
        }

        public Criteria andSenderNameIsNotNull() {
            addCriterion("sender_name is not null");
            return (Criteria) this;
        }

        public Criteria andSenderNameEqualTo(String value) {
            addCriterion("sender_name =", value, "senderName");
            return (Criteria) this;
        }

        public Criteria andSenderNameNotEqualTo(String value) {
            addCriterion("sender_name <>", value, "senderName");
            return (Criteria) this;
        }

        public Criteria andSenderNameGreaterThan(String value) {
            addCriterion("sender_name >", value, "senderName");
            return (Criteria) this;
        }

        public Criteria andSenderNameGreaterThanOrEqualTo(String value) {
            addCriterion("sender_name >=", value, "senderName");
            return (Criteria) this;
        }

        public Criteria andSenderNameLessThan(String value) {
            addCriterion("sender_name <", value, "senderName");
            return (Criteria) this;
        }

        public Criteria andSenderNameLessThanOrEqualTo(String value) {
            addCriterion("sender_name <=", value, "senderName");
            return (Criteria) this;
        }

        public Criteria andSenderNameLike(String value) {
            addCriterion("sender_name like", value, "senderName");
            return (Criteria) this;
        }

        public Criteria andSenderNameNotLike(String value) {
            addCriterion("sender_name not like", value, "senderName");
            return (Criteria) this;
        }

        public Criteria andSenderNameIn(List<String> values) {
            addCriterion("sender_name in", values, "senderName");
            return (Criteria) this;
        }

        public Criteria andSenderNameNotIn(List<String> values) {
            addCriterion("sender_name not in", values, "senderName");
            return (Criteria) this;
        }

        public Criteria andSenderNameBetween(String value1, String value2) {
            addCriterion("sender_name between", value1, value2, "senderName");
            return (Criteria) this;
        }

        public Criteria andSenderNameNotBetween(String value1, String value2) {
            addCriterion("sender_name not between", value1, value2, "senderName");
            return (Criteria) this;
        }

        public Criteria andSenderIPIsNull() {
            addCriterion("sender_ip is null");
            return (Criteria) this;
        }

        public Criteria andSenderIPIsNotNull() {
            addCriterion("sender_ip is not null");
            return (Criteria) this;
        }

        public Criteria andSenderIPEqualTo(String value) {
            addCriterion("sender_ip =", value, "senderIP");
            return (Criteria) this;
        }

        public Criteria andSenderIPNotEqualTo(String value) {
            addCriterion("sender_ip <>", value, "senderIP");
            return (Criteria) this;
        }

        public Criteria andSenderIPGreaterThan(String value) {
            addCriterion("sender_ip >", value, "senderIP");
            return (Criteria) this;
        }

        public Criteria andSenderIPGreaterThanOrEqualTo(String value) {
            addCriterion("sender_ip >=", value, "senderIP");
            return (Criteria) this;
        }

        public Criteria andSenderIPLessThan(String value) {
            addCriterion("sender_ip <", value, "senderIP");
            return (Criteria) this;
        }

        public Criteria andSenderIPLessThanOrEqualTo(String value) {
            addCriterion("sender_ip <=", value, "senderIP");
            return (Criteria) this;
        }

        public Criteria andSenderIPLike(String value) {
            addCriterion("sender_ip like", value, "senderIP");
            return (Criteria) this;
        }

        public Criteria andSenderIPNotLike(String value) {
            addCriterion("sender_ip not like", value, "senderIP");
            return (Criteria) this;
        }

        public Criteria andSenderIPIn(List<String> values) {
            addCriterion("sender_ip in", values, "senderIP");
            return (Criteria) this;
        }

        public Criteria andSenderIPNotIn(List<String> values) {
            addCriterion("sender_ip not in", values, "senderIP");
            return (Criteria) this;
        }

        public Criteria andSenderIPBetween(String value1, String value2) {
            addCriterion("sender_ip between", value1, value2, "senderIP");
            return (Criteria) this;
        }

        public Criteria andSenderIPNotBetween(String value1, String value2) {
            addCriterion("sender_ip not between", value1, value2, "senderIP");
            return (Criteria) this;
        }

        public Criteria andSubmitTimeIsNull() {
            addCriterion("submit_time is null");
            return (Criteria) this;
        }

        public Criteria andSubmitTimeIsNotNull() {
            addCriterion("submit_time is not null");
            return (Criteria) this;
        }

        public Criteria andSubmitTimeEqualTo(Date value) {
            addCriterion("submit_time =", value, "submitTime");
            return (Criteria) this;
        }

        public Criteria andSubmitTimeNotEqualTo(Date value) {
            addCriterion("submit_time <>", value, "submitTime");
            return (Criteria) this;
        }

        public Criteria andSubmitTimeGreaterThan(Date value) {
            addCriterion("submit_time >", value, "submitTime");
            return (Criteria) this;
        }

        public Criteria andSubmitTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("submit_time >=", value, "submitTime");
            return (Criteria) this;
        }

        public Criteria andSubmitTimeLessThan(Date value) {
            addCriterion("submit_time <", value, "submitTime");
            return (Criteria) this;
        }

        public Criteria andSubmitTimeLessThanOrEqualTo(Date value) {
            addCriterion("submit_time <=", value, "submitTime");
            return (Criteria) this;
        }

        public Criteria andSubmitTimeIn(List<Date> values) {
            addCriterion("submit_time in", values, "submitTime");
            return (Criteria) this;
        }

        public Criteria andSubmitTimeNotIn(List<Date> values) {
            addCriterion("submit_time not in", values, "submitTime");
            return (Criteria) this;
        }

        public Criteria andSubmitTimeBetween(Date value1, Date value2) {
            addCriterion("submit_time between", value1, value2, "submitTime");
            return (Criteria) this;
        }

        public Criteria andSubmitTimeNotBetween(Date value1, Date value2) {
            addCriterion("submit_time not between", value1, value2, "submitTime");
            return (Criteria) this;
        }

        public Criteria andSurveyDataIsNull() {
            addCriterion("survey_data is null");
            return (Criteria) this;
        }

        public Criteria andSurveyDataIsNotNull() {
            addCriterion("survey_data is not null");
            return (Criteria) this;
        }

        public Criteria andSurveyDataEqualTo(String value) {
            addCriterion("survey_data =", value, "surveyData");
            return (Criteria) this;
        }

        public Criteria andSurveyDataNotEqualTo(String value) {
            addCriterion("survey_data <>", value, "surveyData");
            return (Criteria) this;
        }

        public Criteria andSurveyDataGreaterThan(String value) {
            addCriterion("survey_data >", value, "surveyData");
            return (Criteria) this;
        }

        public Criteria andSurveyDataGreaterThanOrEqualTo(String value) {
            addCriterion("survey_data >=", value, "surveyData");
            return (Criteria) this;
        }

        public Criteria andSurveyDataLessThan(String value) {
            addCriterion("survey_data <", value, "surveyData");
            return (Criteria) this;
        }

        public Criteria andSurveyDataLessThanOrEqualTo(String value) {
            addCriterion("survey_data <=", value, "surveyData");
            return (Criteria) this;
        }

        public Criteria andSurveyDataLike(String value) {
            addCriterion("survey_data like", value, "surveyData");
            return (Criteria) this;
        }

        public Criteria andSurveyDataNotLike(String value) {
            addCriterion("survey_data not like", value, "surveyData");
            return (Criteria) this;
        }

        public Criteria andSurveyDataIn(List<String> values) {
            addCriterion("survey_data in", values, "surveyData");
            return (Criteria) this;
        }

        public Criteria andSurveyDataNotIn(List<String> values) {
            addCriterion("survey_data not in", values, "surveyData");
            return (Criteria) this;
        }

        public Criteria andSurveyDataBetween(String value1, String value2) {
            addCriterion("survey_data between", value1, value2, "surveyData");
            return (Criteria) this;
        }

        public Criteria andSurveyDataNotBetween(String value1, String value2) {
            addCriterion("survey_data not between", value1, value2, "surveyData");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}