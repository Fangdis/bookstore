package com.zjnu.fd.bookstore.po;

public class Order {
    private Integer id;

    private Integer addressid;

    private String shopids;

    private Float totalprice;

    private String purchasemeg;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAddressid() {
        return addressid;
    }

    public void setAddressid(Integer addressid) {
        this.addressid = addressid;
    }

    public String getShopids() {
        return shopids;
    }

    public void setShopids(String shopids) {
        this.shopids = shopids == null ? null : shopids.trim();
    }

    public Float getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(Float totalprice) {
        this.totalprice = totalprice;
    }

    public String getPurchasemeg() {
        return purchasemeg;
    }

    public void setPurchasemeg(String purchasemeg) {
        this.purchasemeg = purchasemeg == null ? null : purchasemeg.trim();
    }
}