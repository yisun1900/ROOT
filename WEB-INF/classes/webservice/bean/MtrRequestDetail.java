package webservice.bean;

import java.util.Date;
//import webservice.bean.Customer;
/**
 * Customer generated by MyEclipse Persistence Tools
 */

public class MtrRequestDetail implements java.io.Serializable {

	String mtrId;//���ϱ��
	Double mrqNum;	//Ҫ������
	String remark;  //��ע��Ϣ

	/** default constructor */
	public MtrRequestDetail() {
	}


	// Property accessors

	public String getMtrId() {
		return this.mtrId;
	}

	public void setMtrId(String mtrId) {
		this.mtrId = mtrId;
	}
	public Double getMrqNum() {
		return this.mrqNum;
	}

	public void setMrqNum(Double mrqNum) {
		this.mrqNum = mrqNum;
	}

	
	public String getRemark() {
			return this.remark;
		}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}