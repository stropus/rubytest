num  = ARGV[0]
from = ARGV[1].to_i
to   = ARGV[2].to_i

# Допустимый алфавит символов для систем счисления
scale = "0123456789abcdefghijklmnopqrstuvwxyz"

def test_arg (alf,nn1,st,en)
    i = 0
    flag1 = true
    while i < nn1.length do
        flag1 = flag1 && alf[st,en].include?(nn1[i])
        i += 1
    end
    return flag1
end

def perevod (num, scale, from, to)
    p = 0
    i = 0
    while i < num.length do
        p = p * from + scale.index(num[i])
        i += 1
    end
    k = 99
    l = 0
    j = 0
    buf = Array.new(100)
    while (1) do
        j = p % to
        buf[k] = scale[j]
        k -= 1
        l += 1
        p = p / to
        break if p == 0
    end
    rezult = buf.join("")
    return rezult
end

#Проверяем, чтобы первый аргумент - число в некой системе счисления содержал только символы из набора scale
fl1 = test_arg(scale,num,0,36)
#Проверяем, чтобы первый аргумент - число в некой системе счисления содержал только символы из набора для данной системы счисления
fl2 = test_arg(scale,num,0,from)
n10 = perevod(num, scale, from, 10).to_i

if fl1 && fl2 then
    if n10 >= 0 and n10 <= 10000 then
        if from >= 2 and to <= 36 then
            if to >= 2 then
                if from == to then # системы счисления одинаковы
                    puts num
                elsif n10 == 0 # 0 в любой системе счисления 0
                    puts num
                else
                    # считаем
                    rezult = perevod(num, scale, from, to)
                    puts rezult
                end
            end
        end
    end
end
