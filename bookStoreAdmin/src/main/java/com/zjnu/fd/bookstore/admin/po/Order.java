package com.zjnu.fd.bookstore.admin.po;

public class Order {
    private Integer id;

    private Integer addressId;

    private Float totalPrice;

    private String purchaseMsg;

    private Integer status;

    private String oderNumber;

    private String addTime;

    private Integer userId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public Float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getPurchaseMsg() {
        return purchaseMsg;
    }

    public void setPurchaseMsg(String purchaseMsg) {
        this.purchaseMsg = purchaseMsg == null ? null : purchaseMsg.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getOderNumber() {
        return oderNumber;
    }

    public void setOderNumber(String oderNumber) {
        this.oderNumber = oderNumber == null ? null : oderNumber.trim();
    }

    public String getAddTime() {
        return addTime;
    }

    public void setAddTime(String addTime) {
        this.addTime = addTime == null ? null : addTime.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}