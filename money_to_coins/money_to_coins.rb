def money_to_coins(amount)
  penny = [50,20,10,5,2,1]
  monets = [2,1]
  monets_penny = amount.split('.')
  @returnsp=[]
  @returns =[]
  @returnsm=[]
  #i have only coins
  if monets_penny[1] == nil
    return_penny(monets_penny,penny,0)
  end
  #i have coins and monets
  if monets_penny[1] != nil
    return_coins_money(monets_penny,monets,penny)
  end
  print_money(amount).to_s
end

def return_coins_money(monets_penny,monets,penny)
  monets_penny[0] = monets_penny[0].gsub("£","")
  return_penny(monets_penny,penny,1)
  @returns = []
  split_amount_of(monets,monets_penny[0].to_i)
  @returnsm = @returns
end

def return_penny(monets_penny,penny,iterator)
  monets_penny[iterator].chomp('p')
  split_amount_of(penny,monets_penny[iterator].to_i)
  @returnsp = @returns 
end

def mixed?(amount)
  amount.include?(".")
end

def prepare_print(array)
  tmp = Hash.new(0)
  array.each {|v| tmp[v] += 1 }
  tmp = tmp.sort_by {|k,v| k}
end

def mur (array,monets =false)
  b = prepare_print(array)
  output = ""
  b.each do |k, v|
    output +=  (monets ?  "#{v}x#{k}p " : " #{v}x£#{k}")
  end
  output.chomp(' ')
end

def print_money(amount)
  output = ""
  output += mur(@returnsp,true)
  output += mur(@returnsm) if mixed?(amount)
  output
end

def split_amount_of(money_template,money)
  return if money <= 0
  money_template.each_with_index {|key,value| 
  if money - key >= 0
    @returns << key
    return split_amount_of(money_template, money - key)
  end
  }
  @returns
end
