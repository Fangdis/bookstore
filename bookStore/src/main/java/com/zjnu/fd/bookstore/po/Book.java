package com.zjnu.fd.bookstore.po;

public class Book {
    private Integer id;

    private String name;

    private String author;

    private String publish;

    private String publishtime;

    private Float price;

    private Float discount;

    private Integer total;

    private Integer nowtotal;

    private String deliveryunit;

    private String isbn;

    private String edition;

    private String productnumber;

    private String bookpackage;

    private String format;

    private String paper;

    private Integer pages;

    private String booklanguage;

    private String introduction;

    private String authorinduce;

    private String producefeature;

    private String feature;

    private String kind;

    private String minkind;

    private String cover;

    private String picture;

    private Integer bookType;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public String getPublish() {
        return publish;
    }

    public void setPublish(String publish) {
        this.publish = publish == null ? null : publish.trim();
    }

    public String getPublishtime() {
        return publishtime;
    }

    public void setPublishtime(String publishtime) {
        this.publishtime = publishtime == null ? null : publishtime.trim();
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Float getDiscount() {
        return discount;
    }

    public void setDiscount(Float discount) {
        this.discount = discount;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Integer getNowtotal() {
        return nowtotal;
    }

    public void setNowtotal(Integer nowtotal) {
        this.nowtotal = nowtotal;
    }

    public String getDeliveryunit() {
        return deliveryunit;
    }

    public void setDeliveryunit(String deliveryunit) {
        this.deliveryunit = deliveryunit == null ? null : deliveryunit.trim();
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn == null ? null : isbn.trim();
    }

    public String getEdition() {
        return edition;
    }

    public void setEdition(String edition) {
        this.edition = edition == null ? null : edition.trim();
    }

    public String getProductnumber() {
        return productnumber;
    }

    public void setProductnumber(String productnumber) {
        this.productnumber = productnumber == null ? null : productnumber.trim();
    }

    public String getBookpackage() {
        return bookpackage;
    }

    public void setBookpackage(String bookpackage) {
        this.bookpackage = bookpackage == null ? null : bookpackage.trim();
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format == null ? null : format.trim();
    }

    public String getPaper() {
        return paper;
    }

    public void setPaper(String paper) {
        this.paper = paper == null ? null : paper.trim();
    }

    public Integer getPages() {
        return pages;
    }

    public void setPages(Integer pages) {
        this.pages = pages;
    }

    public String getBooklanguage() {
        return booklanguage;
    }

    public void setBooklanguage(String booklanguage) {
        this.booklanguage = booklanguage == null ? null : booklanguage.trim();
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }

    public String getAuthorinduce() {
        return authorinduce;
    }

    public void setAuthorinduce(String authorinduce) {
        this.authorinduce = authorinduce == null ? null : authorinduce.trim();
    }

    public String getProducefeature() {
        return producefeature;
    }

    public void setProducefeature(String producefeature) {
        this.producefeature = producefeature == null ? null : producefeature.trim();
    }

    public String getFeature() {
        return feature;
    }

    public void setFeature(String feature) {
        this.feature = feature == null ? null : feature.trim();
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind == null ? null : kind.trim();
    }

    public String getMinkind() {
        return minkind;
    }

    public void setMinkind(String minkind) {
        this.minkind = minkind == null ? null : minkind.trim();
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover == null ? null : cover.trim();
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture == null ? null : picture.trim();
    }

    public Integer getBookType() {
        return bookType;
    }

    public void setBookType(Integer bookType) {
        this.bookType = bookType;
    }
}