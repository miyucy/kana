# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'nkf'

describe "Kana" do
  it "'０'を'0'に変換できること" do
    Kana.kana('０').should == '0'
  end

  it "'ａ'を'a'に変換できること" do
    Kana.kana('ａ').should == 'a'
  end

  it "'Ａ'を'A'に変換できること" do
    Kana.kana('Ａ').should == 'A'
  end

  it "'ア'を'ｱ'に変換できること" do
    Kana.kana(NKF.nkf('-m0Ww', 'ア')).should == NKF.nkf('-m0Ww', 'ｱ')
  end

  it "'a'を変換しないこと" do
    Kana.kana('a').should == 'a'
  end

  it "'０ａＡアa'を'0aAｱa'に変換できること" do
    Kana.kana(NKF.nkf('-m0Ww', '０ａＡアa')).should == NKF.nkf('-m0Ww', '0aAｱa')
  end

  it "EUC-JPの'０ａＡアa'をEUC-JPの'0aAｱa'に変換できること" do
    Kana.kana(NKF.nkf('-m0We', '０ａＡアa')).should == NKF.nkf('-m0We', '0aAｱa')
  end

  it "オプション'r'によって全角英字を半角英字に変換できること"
  it "オプション'n'によって全角数字を半角数字に変換できること"
  it "オプション'a'によって全角英数字を半角英数字に変換できること"
  it "オプション's'によって全角スペースを半角スペースに変換できること"
  it "オプション'k'によって全角カタカナを半角カタカナに変換できること"
end

describe "String" do
  describe "kana" do
    it "'０'を'0'に変換できること" do
      '０'.kana.should == '0'
    end
  end
end
