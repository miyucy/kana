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
    Kana.kana('Ａｂｃ　ｘｙＺ　０12３','a',:utf8).should == 'Abc　xyZ　0123'
  end

  it "オプション'k'によって全角カタカナを半角カタカナに変換できること" do
    Kana.kana('アーヲ','k',:utf8).should == 'ｱｰｦ'
  end

  it "オプション'h'によって全角ひらがなを半角カタカナに変換できること" do
    Kana.kana('あぁん','h',:utf8).should == 'ｱｧﾝ'
  end

  it "mb_convert_kana(a)と同じ変換をすること" do
    $KCODE = 'u' if RUBY_VERSION < '1.9.1'
    raw = File.read('spec/data/raw.txt')
    Kana.kana(raw, 'a').split(//).zip(File.read('spec/data/a.txt').split(//)).each do |got,except|
      got.should == except
    end
  end

  it "mb_convert_kana(A)と同じ変換をすること" do
    $KCODE = 'u' if RUBY_VERSION < '1.9.1'
    raw = File.read('spec/data/raw.txt')
    Kana.kana(raw, 'A').split(//).zip(File.read('spec/data/l-a.txt').split(//)).each do |got,except|
      got.should == except
    end
  end

  it "mb_convert_kana(c)と同じ変換をすること" do
    $KCODE = 'u' if RUBY_VERSION < '1.9.1'
    raw = File.read('spec/data/raw.txt')
    Kana.kana(raw, 'c').split(//).zip(File.read('spec/data/c.txt').split(//)).each do |got,except|
      got.should == except
    end
  end

  it "mb_convert_kana(C)と同じ変換をすること" do
    $KCODE = 'u' if RUBY_VERSION < '1.9.1'
    raw = File.read('spec/data/raw.txt')
    Kana.kana(raw, 'C').split(//).zip(File.read('spec/data/l-c.txt').split(//)).each do |got,except|
      got.should == except
    end
  end

  it "mb_convert_kana(h)と同じ変換をすること" do
    $KCODE = 'u' if RUBY_VERSION < '1.9.1'
    raw = File.read('spec/data/raw.txt')
    Kana.kana(raw, 'h').split(//).zip(File.read('spec/data/h.txt').split(//)).each do |got,except|
      got.should == except
    end
  end

  it "mb_convert_kana(H)と同じ変換をすること" do
    $KCODE = 'u' if RUBY_VERSION < '1.9.1'
    raw = File.read('spec/data/raw.txt')
    Kana.kana(raw, 'H').split(//).zip(File.read('spec/data/l-h.txt').split(//)).each do |got,except|
      got.should == except
    end
  end

  it "mb_convert_kana(HV)と同じ変換をすること" do
    $KCODE = 'u' if RUBY_VERSION < '1.9.1'
    raw = File.read('spec/data/raw.txt')
    Kana.kana(raw, 'HV').split(//).zip(File.read('spec/data/l-hv.txt').split(//)).each do |got,except|
      got.should == except
    end
  end

  it "mb_convert_kana(k)と同じ変換をすること" do
    $KCODE = 'u' if RUBY_VERSION < '1.9.1'
    raw = File.read('spec/data/raw.txt')
    Kana.kana(raw, 'k').split(//).zip(File.read('spec/data/k.txt').split(//)).each do |got,except|
      got.should == except
    end
  end

  it "mb_convert_kana(K)と同じ変換をすること" do
    $KCODE = 'u' if RUBY_VERSION < '1.9.1'
    raw = File.read('spec/data/raw.txt')
    Kana.kana(raw, 'K').split(//).zip(File.read('spec/data/l-k.txt').split(//)).each do |got,except|
      got.should == except
    end
  end

  it "mb_convert_kana(KV)と同じ変換をすること" do
    $KCODE = 'u' if RUBY_VERSION < '1.9.1'
    raw = File.read('spec/data/raw.txt')
    Kana.kana(raw, 'KV').split(//).zip(File.read('spec/data/l-kv.txt').split(//)).each do |got,except|
      got.should == except
    end
  end

  it "mb_convert_kana(ask)と同じ変換をすること" do
    $KCODE = 'u' if RUBY_VERSION < '1.9.1'
    raw = File.read('spec/data/raw.txt')
    Kana.kana(raw, 'ask').split(//).zip(File.read('spec/data/ask.txt').split(//)).each do |got,except|
      got.should == except
    end
  end

  it "mb_convert_kana(ASK)と同じ変換をすること" do
    $KCODE = 'u' if RUBY_VERSION < '1.9.1'
    raw = File.read('spec/data/raw.txt')
    Kana.kana(raw, 'ASK').split(//).zip(File.read('spec/data/l-ask.txt').split(//)).each do |got,except|
      got.should == except
    end
  end

  it "mb_convert_kana(ASKV)と同じ変換をすること" do
    $KCODE = 'u' if RUBY_VERSION < '1.9.1'
    raw = File.read('spec/data/raw.txt')
    Kana.kana(raw, 'ASKV').split(//).zip(File.read('spec/data/l-askv.txt').split(//)).each do |got,except|
      got.should == except
    end
  end

  it "mb_convert_kana(rns)と同じ変換をすること" do
    $KCODE = 'u' if RUBY_VERSION < '1.9.1'
    raw = File.read('spec/data/raw.txt')
    Kana.kana(raw, 'rns').split(//).zip(File.read('spec/data/rns.txt').split(//)).each do |got,except|
      got.should == except
    end
  end

  it "mb_convert_kana(RNS)と同じ変換をすること" do
    $KCODE = 'u' if RUBY_VERSION < '1.9.1'
    raw = File.read('spec/data/raw.txt')
    Kana.kana(raw, 'RNS').split(//).zip(File.read('spec/data/l-rns.txt').split(//)).each do |got,except|
      got.should == except
    end
  end
end

describe "String" do
  describe "kana" do
    it "'０'を'0'に変換できること" do
      '０'.kana('n').should == '0'
    end
  end
end
