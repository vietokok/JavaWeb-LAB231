/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.ArrayList;

/**
 *
 * @author 84963
 */
public class Gallery {

    private int id;
    private String title;
    private String content;
    private String mainImage;
    private ArrayList<Image> listImage = new ArrayList<>();

    public Gallery() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getMainImage() {
        return mainImage;
    }

    public void setMainImage(String mainImage) {
        this.mainImage = mainImage;
    }

    public ArrayList<Image> getListImage() {
        return listImage;
    }

    public void setListImage(ArrayList<Image> listImage) {
        this.listImage = listImage;
    }
}
