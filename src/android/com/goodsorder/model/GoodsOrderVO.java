package android.com.goodsorder.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import android.com.goodsdetails.model.GoodsDetailsVO;
import android.com.member.model.MemberVO;
@Entity
@Table(name = "GOODSORDER")
public class GoodsOrderVO implements Serializable{

	private static final long serialVersionUID = 1L;
	private String goodOrderId;
	private String memId;
	private Integer goodTotalPrice;
	private Timestamp goodDate;
	private String buyerName;
	private String buyerAddress;
	private String buyerPhone;
	private Integer goodOrdStatus;
	private Set<GoodsDetailsVO> goodsDetailsVOs;
	
	
	@Id
	@GenericGenerator(name = "goodsorder", strategy = "generator.MyGenerator")
	@GeneratedValue(generator = "goodsorder")
	public String getGoodOrderId() {
		return goodOrderId;
	}
	public void setGoodOrderId(String goodOrderId) {
		this.goodOrderId = goodOrderId;
	}
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public Integer getGoodTotalPrice() {
		return goodTotalPrice;
	}
	public void setGoodTotalPrice(Integer goodTotalPrice) {
		this.goodTotalPrice = goodTotalPrice;
	}
	
	
	public Timestamp getGoodDate() {
		return goodDate;
	}
	public void setGoodDate(Timestamp goodDate) {
		this.goodDate = goodDate;
	}
	public String getBuyerName() {
		return buyerName;
	}
	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}
	public String getBuyerAddress() {
		return buyerAddress;
	}
	public void setBuyerAddress(String buyerAddress) {
		this.buyerAddress = buyerAddress;
	}
	public String getBuyerPhone() {
		return buyerPhone;
	}
	public void setBuyerPhone(String buyerPhone) {
		this.buyerPhone = buyerPhone;
	}
	public Integer getGoodOrdStatus() {
		return goodOrdStatus;
	}
	public void setGoodOrdStatus(Integer goodOrdStatus) {
		this.goodOrdStatus = goodOrdStatus;
	}
	
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER, mappedBy="goodsOrderVO")
	public Set<GoodsDetailsVO> getGoodsDetailsVOs() {
		return goodsDetailsVOs;
	}
	public void setGoodsDetailsVOs(Set<GoodsDetailsVO> goodsDetailsVOs) {
		this.goodsDetailsVOs = goodsDetailsVOs;
	}
	
	
	
	
}
