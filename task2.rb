d  = ARGV[0].to_i
m  = ARGV[1]
y  = ARGV[2].to_i

# Массив месяцев
month = %w[января февраля марта апреля мая июня июля августа сентября октября ноября декабря]
month30 = %w[апреля июня сентября ноября]

# Определяем вискосность года и количество дней в нем
def visokosn (y1)
    if y1 % 100 == 0 && y1 % 400 == 0 then
        return [29,366]
    elsif y1 % 100 == 0 && y1 % 400 != 0 then
        return [28,365]
    elsif y1 % 4 == 0 then
        return [29,366]
    else
        return [28,365]
    end
end

def raschet(y2, m2, d2, nd, mm)
    t = Time.mktime(y2,mm.index(m2)+1,d2)
    day = t.yday
    puts nd - day
end


if d >= 1 and d <= 31 then
    if y >= 1 and y <= 2999  then
        rez = visokosn(y)
        if month.detect{|e| e == m} then
            if month30.detect{|e| e == m} then
                if d <= 30 then
                    raschet(y,m,d,rez[1],month)
                else
                    puts "error day in month"
                end
            elsif m == "февраля" then
                if d <= rez[0] then
                    raschet(y,m,d,rez[1],month)
                else
                    puts "error feb days"
                end
            else
                raschet(y,m,d,rez[1],month)
            end
        else
            puts "error in month"
        end
    else
        puts "error in year"
    end
else
    puts "error in day"
end
