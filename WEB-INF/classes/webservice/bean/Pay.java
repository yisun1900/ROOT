
package webservice.bean;

import java.util.Date;
//import webservice.bean.Customer;
/**
 * Customer generated by MyEclipse Persistence Tools
 */

public class Pay implements java.io.Serializable {

	// Fields


	
	private String id;//�տ����
	private String contractId  ;  //��ͬ���
	private Double amont;// �տ���
	private Date payTime;// �տ�����
	private String payType;// ���ʽ
	private String billNo;// Ʊ�ݱ��
	private String payForUse;// ������;
	private String remark;// ��ע��Ϣ
	private String person;// ¼����
	private Date time;// ¼��ʱ��

	// Constructors

	/** default constructor */
	public Pay() {
	}

	

	

	// Property accessors
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getContractId() {
		return this.contractId;
	}

	public void setContractId(String contractId) {
		this.contractId = contractId;
	}

	public Date getPayTime() {
		return this.payTime;
	}

	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}

	public String getPayType() {
		return this.payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}
	public String getPayForUse() {
		return this.payForUse;
	}

	public void setPayForUse(String payForUse) {
		this.payForUse = payForUse;
	}
	public String getBillNo() {
		return this.billNo;
	}

	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}

	public Double getAmont() {
		return this.amont;
	}

	public void setAmont(Double amont) {
		this.amont = amont;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getPerson() {
		return this.person;
	}

	public void setPerson(String person) {
		this.person = person;
	}

	public Date getTime() {
		return this.time;
	}

	public void setTime(Date time) {
		this.time = time;
	}
	
}