package com.ybz.myWebsite.po;

import java.util.Date;

public class Survey {
    private Integer id;

    private String senderName;

    private String senderIP;

    private Date submitTime;

    private String surveyData;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSenderName() {
        return senderName;
    }

    public void setSenderName(String senderName) {
        this.senderName = senderName == null ? null : senderName.trim();
    }

    public String getSenderIP() {
        return senderIP;
    }

    public void setSenderIP(String senderIP) {
        this.senderIP = senderIP == null ? null : senderIP.trim();
    }

    public Date getSubmitTime() {
        return submitTime;
    }

    public void setSubmitTime(Date submitTime) {
        this.submitTime = submitTime;
    }

    public String getSurveyData() {
        return surveyData;
    }

    public void setSurveyData(String surveyData) {
        this.surveyData = surveyData == null ? null : surveyData.trim();
    }

	@Override
	public String toString() {
		return "Survey [id=" + id + ", senderName=" + senderName
				+ ", senderIP=" + senderIP + ", submitTime=" + submitTime
				+ ", surveyData=" + surveyData + "]";
	}
}