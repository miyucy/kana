#!/usr/bin/ruby -wKU
# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'nkf'

describe "Kana" do
  it "オプション'n'によって '０'を'0'に変換できること" do
    Kana.kana('０','n').should == '0'
  end

  it "オプション'r'によって 'ａ'を'a'に変換できること" do
    Kana.kana('ａ','r').should == 'a'
  end

  it "オプション'r'によって 'Ａ'を'A'に変換できること" do
    Kana.kana('Ａ','r').should == 'A'
  end

  it "'a'を変換しないこと" do
    Kana.kana('a','r').should == 'a'
  end

  it "オプション'k'によって'ア'を'ｱ'に変換できること" do
    Kana.kana('ア','k',:utf8).should == 'ｱ'
  end

  it "'０ａＡアa'を'0aAｱa'に変換できること" do
    Kana.kana('０ａＡアa','nrk',:utf8).should == '0aAｱa'
  end

  it "EUC-JPの'０ａＡアa'をEUC-JPの'0aAｱa'に変換できること" do
    if RUBY_VERSION >= '1.9.1'
      Kana.kana('０ａＡアa'.encode(Encoding::EUC_JP),'nrk').should == '0aAｱa'.encode(Encoding::EUC_JP)
    else
      Kana.kana(NKF.nkf('-m0xWe', '０ａＡアa'),'nrk').should == NKF.nkf('-m0xWe', '0aAｱa')
    end
  end

  it "オプション's'によって全角スペースを半角スペースに変換できること" do
    Kana.kana('　', 's').should == ' '
  end

  it "オプション'a'によって全角英数字を半角英数字に変換できること" do
    Kana.kana('Ａｂｃ ｘｙＺ　０12３','a',:utf8).should == 'Abc xyZ 0123'
  end

  it "オプション'k'によって全角カタカナを半角カタカナに変換できること" do
    Kana.kana('アーヲ','k',:utf8).should == 'ｱｰｦ'
  end

  it "オプション'h'によって全角ひらがなを半角カタカナに変換できること" do
    Kana.kana('あぁん','h',:utf8).should == 'ｱｧﾝ'
  end
end

describe "String" do
  describe "kana" do
    it "'０'を'0'に変換できること" do
      '０'.kana('n').should == '0'
    end
  end
end
