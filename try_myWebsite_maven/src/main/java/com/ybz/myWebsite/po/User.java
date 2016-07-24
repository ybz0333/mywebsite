package com.ybz.myWebsite.po;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1547951476769117460L;

	private Integer id;

    private String username;

    private String nickname;

    private String password;

    private Integer permission;

    private Date registtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Integer getPermission() {
        return permission;
    }

    public void setPermission(Integer permission) {
        this.permission = permission;
    }

    public Date getRegisttime() {
        return registtime;
    }

    public void setRegisttime(Date registtime) {
        this.registtime = registtime;
    }

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", nickname="
				+ nickname + ", password=" + password + ", permission="
				+ permission + ", registtime=" + registtime + "]";
	}

	// 应userMap需要，重写User的hashCode和equals方法
	@Override
	public int hashCode() {
		return id.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		if(obj == null) {
			return false;
		}
		User other = (User)obj;
		return this.id.equals(other.id);
	}
	
}