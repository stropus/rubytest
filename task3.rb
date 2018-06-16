t1  = ARGV[0].to_i
t2  = ARGV[1].to_i

def re (d1, tt)
    d2 = d1 % 10 # последняя цифра

    if d1 >=11 and d1 <= 14 then
        if tt == 1
            rezu = "часов"
        elsif tt == 2
            rezu = "минут"
        else
            rezu ="секунд"
        end
        return rezu
    end

    if d1 >=2 and d1 <= 4 then
        if tt == 1
            rezu = "часа"
        elsif tt == 2
            rezu = "минуты"
        else
            rezu ="секунды"
        end
        return rezu
    end

    if d2 >= 2 and d2 <= 4 then
        if tt == 1
            rezu = "часа"
        elsif tt == 2
            rezu = "минуты"
        else
            rezu ="секунды"
        end
        return rezu
    end

    if d1 == 1 or d2 == 1 then
        if tt == 1
            rezu = "час"
        elsif tt == 2
            rezu = "минута"
        else
            rezu ="секунда"
        end
        return rezu
    end

    if tt == 1
        rezu = "часов"
    elsif tt == 2
        rezu = "минут"
    else
        rezu = "секунд"
    end
    return rezu

end


if t1 >= 1 and t2 <= 100000 then
    t0 = t1 + t2
    secund = 0
    minut = 0
    hour = 0
    secund = t0 % 60   #достаем секунды
    t0 /= 60           #убиваем секунды
    minut = t0 % 60    #достаем минуты
    t0 /= 60           #убиваем минуты
    hour = t0          # получили часы
    rez = ""           #Готовим вывод на экран

    if hour != 0 then
        rez = "#{hour} " + re(hour,1) + " "
    end

    if minut != 0 then
        rez = rez + "#{minut} " + re(minut,2) + " "
    end

    if secund != 0 then
       rez = rez + "#{secund} " + re(secund,3)
    end

    puts rez #Вывод результатов
end
