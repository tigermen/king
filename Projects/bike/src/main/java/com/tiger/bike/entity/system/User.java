package com.tiger.bike.entity.system;
/**
 *	用户信息 
 */
public class User {
	private Integer id;//主键
	private String usercode;//登录账号
	private String nickname;//昵称
	private String password;//密码
	private String email;//邮件
	private String phone;//手机号
	private String qqacc;//QQ账号
	private String sinaacc;//新浪账号
	private String wechatacc;//微信号
	private String remark;//备注
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsercode() {
		return usercode;
	}
	public void setUsercode(String usercode) {
		this.usercode = usercode;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getQqacc() {
		return qqacc;
	}
	public void setQqacc(String qqacc) {
		this.qqacc = qqacc;
	}
	public String getSinaacc() {
		return sinaacc;
	}
	public void setSinaacc(String sinaacc) {
		this.sinaacc = sinaacc;
	}
	public String getWechatacc() {
		return wechatacc;
	}
	public void setWechatacc(String wechatacc) {
		this.wechatacc = wechatacc;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
