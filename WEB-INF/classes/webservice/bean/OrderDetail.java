
package webservice.bean;

import java.util.Date;
//import webservice.bean.Customer;
/**
 * Customer generated by MyEclipse Persistence Tools
 */

public class OrderDetail implements java.io.Serializable {

	// Fields

	
	private String orderDetailId ;  //订单明细编号
	private String orderId;//订单编号
	private String pId;//产品编号
	private String pName;//产品名称
	private String pRemark;//产品描述
	private String pNorm;//产品规格
	private String pState;//明细状态
	private Double pWidth;//产品宽度
	private Double pDepth;//产品深度
	private Double pHeight;//产品高度
	private Double price;//单价
	private Double count;//数量
	private Double discount;//折扣
	private Double addRate;//加价系数
	private Double amount;//总金额
	private String unit;//产品单位
	private String stockType;//库存类型
	private String remark;//备注信息
	private String pType;//产品类型
	private String material;//材质名称
	private String pSn;//产品序号

	

	// Constructors

	/** default constructor */
	public OrderDetail() {
	}

	

	

	// Property accessors
	
	public String getOrderDetailId() {
		return this.orderDetailId;
	}

	public void setOrderDetailId(String orderDetailId) {
		this.orderDetailId = orderDetailId;
	}

	public String getOrderId() {
		return this.orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getPId() {
		return this.pId;
	}

	public void setPId(String pId) {
		this.pId = pId;
	}

	public String getPName() {
		return this.pName;
	}

	public void setPName(String pName) {
		this.pName = pName;
	}
	public String getPRemark() {
		return this.pRemark;
	}

	public void setPRemark(String pRemark) {
		this.pRemark = pRemark;
	}

	public String getPNorm() {
		return this.pNorm;
	}

	public void setPNorm(String pNorm) {
		this.pNorm = pNorm;
	}
	public String getPState() {
		return this.pState;
	}

	public void setPState(String pState) {
		this.pState = pState;
	}
	public Double getPWidth() {
		return this.pWidth;
	}

	public void setPWidth(Double pWidth) {
		this.pWidth = pWidth;
	}
	public Double getPDepth() {
		return this.pDepth;
	}

	public void setPDepth(Double pDepth) {
		this.pDepth = pDepth;
	}
	public Double getPHeight() {
		return this.pHeight;
	}

	public void setPHeight(Double pHeight) {
		this.pHeight = pHeight;
	}
	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getCount() {
		return this.count;
	}

	public void setCount(Double count) {
		this.count = count;
	}
	public Double getDiscount() {
		return this.discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public Double getAddRate() {
		return this.addRate;
	}

	public void setAddRate(Double addRate) {
		this.addRate = addRate;
	}
	public Double getAmount() {
		return this.amount;
	}

	public void setamount(Double amount) {
		this.amount = amount;
	}
	
	
	public String getUnit() {
		return this.unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getStockType() {
		return this.stockType;
	}

	public void setStockType(String stockType) {
		this.stockType = stockType;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getPType() {
		return this.pType;
	}

	public void setPType(String pType) {
		this.pType = pType;
	}

	public String getPSn() {
		return this.pSn;
	}

	public void setPSn(String pSn) {
		this.pSn = pSn;
	}

	public String getMaterial() {
		return this.material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}
}