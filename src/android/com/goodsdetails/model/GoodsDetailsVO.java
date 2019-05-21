package android.com.goodsdetails.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import android.com.goods.model.GoodsVO;
import android.com.goodsorder.model.GoodsOrderVO;

@Entity()
@Table(name="GOODSDETAILS")
public class GoodsDetailsVO implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private transient GoodsOrderVO goodsOrderVO;
	private GoodsVO goodsVO;
	private Integer goodAmount;
	private Float goodScore;
	private String goodRate;
	
	
	@Id
	@ManyToOne
	@JoinColumn(name = "GOODORDERID")
	public GoodsOrderVO getGoodsOrderVO() {
		return goodsOrderVO;
	}
	public void setGoodsOrderVO(GoodsOrderVO goodsOrderVO) {
		this.goodsOrderVO = goodsOrderVO;
	}
	@Id
	@ManyToOne
	@JoinColumn(name = "GOODID")
	public GoodsVO getGoodsVO() {
		return goodsVO;
	}
	public void setGoodsVO(GoodsVO goodsVO) {
		this.goodsVO = goodsVO;
	}
	
	public Integer getGoodAmount() {
		return goodAmount;
	}
	public void setGoodAmount(Integer goodAmount) {
		this.goodAmount = goodAmount;
	}
	public Float getGoodScore() {
		return goodScore;
	}
	public void setGoodScore(Float goodScore) {
		this.goodScore = goodScore;
	}
	public String getGoodRate() {
		return goodRate;
	}
	public void setGoodRate(String goodRate) {
		this.goodRate = goodRate;
	}
}
