# Refactoring
[Приведение в порядок портянки](http://www.cyberforum.ru/ruby/thread1798638.html)

Всем снова привет.

Написал небольшую утилиту для подсчета штрафных санкций в зависимости от уровня KPI.
Но в одном месте получилась длинная портянка, от которой болят глаза, но как её уменьшить не могу придумать.

Буду рад помощи, подсказкам и критике здешних мастеров руби.

```ruby
if (0...100).include?($kpi.to_i) and ($client == '1' or $client == '2') ; $prckpn = 20 ; $prckpv = 18.57
    elsif (0...100).include?($kpi.to_i) and ($client == '3' or $client == '5') ; $prckpn = 10 ; $prckpv = 8.57
    elsif (0...100).include?($kpi.to_i) and $client == '4' ; $prckpn = 50 ; $prckpv = 42.8
     elsif (100...200).include?($kpi.to_i) and ($client == '1' or $client == '2') ; $prckpn = 18.57 ; $prckpv = 17.14
     elsif (100...200).include?($kpi.to_i) and ($client == '3' or $cleint == '5') ; $prckpn = 8.57 ; $prckpv = 7.14
     elsif (100...200).include?($kpi.to_i) and $client == '4' ; $prckpn = 42.8 ; $prckpv = 35.7
      elsif (200...300).include?($kpi.to_i) and ($client == '1' or $client == '2') ; $prckpn = 17.14 ; $prckpv = 15.71
      elsif (200...300).include?($kpi.to_i) and ($client == '3' or $client == '5') ; $prckpn = 7.14 ; $prckpv = 5.71
      elsif (200...300).include?($kpi.to_i) and $client == '4' ; $prckpn = 35.7 ; $prckpv = 28.6
       elsif (300...400).include?($kpi.to_i) and ($client == '1' or $client == '2') ; $prckpn = 15.71 ; $prckpv = 14.28
       elsif (300...400).include?($kpi.to_i) and ($client == '3' or $client == '5') ; $prckpn = 5.71 ; $prckpv = 4.28
       elsif (300...400).include?($kpi.to_i) and $client == '4' ; $prckpn = 28.6 ; $prckpv = 21.5
        elsif (400...500).include?($kpi.to_i) and ($client == '1' or $client == '2') ; $prckpn = 14.28 ; $prckpv = 12.85
        elsif (400...500).include?($kpi.to_i) and ($client == '3' or $client == '5') ; $prckpn = 4.28 ; $prckpv = 2.85
        elsif (400...500).include?($kpi.to_i) and $client == '4' ; $prckpn = 21.5 ; $prckpv = 14.38
         elsif (500...600).include?($kpi.to_i) and ($client == '1' or $client == '2') ; $prckpn = 12.85 ; $prckpv = 11.42
         elsif (500...600).include?($kpi.to_i) and ($client == '3' or $client == '5') ; $prckpn = 2.85 ; $prckpv = 1.42
         elsif (500...600).include?($kpi.to_i) and $client == '4' ; $prckpn = 14.38 ; $prckpv = 7.14
          elsif (600...700).include?($kpi.to_i) and ($client == '1' or $client == '2') ; $prckpn = 11.42 ; $prckpv = 0
          elsif (600...700).include?($kpi.to_i) and ($client == '3' or $client == '5') ; $prckpn = 1.42 ; $prckpv = 0
          elsif (600...700).include?($kpi.to_i) and $client == '4' ; $prckpn = 7.14 ; $prckpv = 0
```
