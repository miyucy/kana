<?php
$s = file_get_contents('data.txt');
file_put_contents('data/raw.txt',    $s);
file_put_contents('data/rns.txt',    mb_convert_kana($s, 'rns', 'UTF-8'));
file_put_contents('data/l-rns.txt',  mb_convert_kana($s, 'RNS', 'UTF-8'));
file_put_contents('data/a.txt',      mb_convert_kana($s, 'a', 'UTF-8'));
file_put_contents('data/l-a.txt',    mb_convert_kana($s, 'A', 'UTF-8'));
file_put_contents('data/k.txt',      mb_convert_kana($s, 'k', 'UTF-8'));
file_put_contents('data/l-k.txt',    mb_convert_kana($s, 'K', 'UTF-8'));
file_put_contents('data/l-kv.txt',   mb_convert_kana($s, 'KV', 'UTF-8'));
file_put_contents('data/h.txt',      mb_convert_kana($s, 'h', 'UTF-8'));
file_put_contents('data/l-h.txt',    mb_convert_kana($s, 'H', 'UTF-8'));
file_put_contents('data/l-hv.txt',   mb_convert_kana($s, 'HV', 'UTF-8'));
file_put_contents('data/c.txt',      mb_convert_kana($s, 'c', 'UTF-8'));
file_put_contents('data/l-c.txt',    mb_convert_kana($s, 'C', 'UTF-8'));
file_put_contents('data/ask.txt',    mb_convert_kana($s, 'ask', 'UTF-8'));
file_put_contents('data/l-ask.txt',  mb_convert_kana($s, 'ASK', 'UTF-8'));
file_put_contents('data/l-askv.txt', mb_convert_kana($s, 'ASKV', 'UTF-8'));
