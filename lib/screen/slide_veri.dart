import 'package:flutter/material.dart';

class SliderModel{

  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath,this.title,this.desc});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

}


List<SliderModel> getSlides(){

  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("Ev kadınlarımızın yemeklerini sunmaları için bir platform düşün");
  sliderModel.setTitle("Ev Kadınları......");
  sliderModel.setImageAssetPath("assets/images/yemek.gif");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("Öğrencilerin hem ders sunmaları hemde staj bulmaları için bir platform düşün");
  sliderModel.setTitle("Öğrenciler......");
  sliderModel.setImageAssetPath("assets/images/egt.gif");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("asd.");
  sliderModel.setTitle("merhaaba");
  sliderModel.setImageAssetPath("assets/images/services.gif");
  slides.add(sliderModel);

  //4
  sliderModel.setDesc("İşçi ve İşvereni hızlı ve anlaşmalı şekilde bir araya getirmek için bir platform düşün.\n Senin İçin Senin İşin");
  sliderModel.setTitle("İşçi ve İşveren");
  sliderModel.setImageAssetPath("assets/images/is.gif");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}