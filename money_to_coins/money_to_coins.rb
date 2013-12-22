PENNY = [50,20,10,5,2,1]
MONETS = [2,1]

def money_to_coins(amount)
  gived_amount = amount.split('.')
  @returnsp, @returns, @returnsm = [], [], []
  #i have only coins
  return_penny(gived_amount,0) if gived_amount[1] == nil
  #i have coins and monets
  return_coins_money(gived_amount) if gived_amount[1] != nil
  print_money(amount)
end

def return_coins_money(monets_penny)
  monets_penny[0] = monets_penny[0].gsub("£","")
  return_penny(monets_penny, 1)
  @returns = []
  split_amount_of(MONETS, monets_penny[0].to_i)
  @returnsm = @returns
end

def return_penny(monets_penny,iterator)
  monets_penny[iterator].chomp('p')
  split_amount_of(PENNY,monets_penny[iterator].to_i)
  @returnsp = @returns 
end

def mixed?(amount)
  amount.include?(".")
end

def prepare_print(data)
  tmp = Hash.new{0}
  data.each {|v| tmp[v] += 1}
  tmp = tmp.sort_by {|k,v| k}
end

def printing_template (data, monets = false)
  result, output = prepare_print(data), ""
  result.each { |key, value| output += which_template(monets,value,key) }
  output.chomp(' ')
end
 
def which_template(monets,value,key)
  return (monets ?  "#{value}x#{key}p " : " #{value}x£#{key}")
end
 
def print_money(amount)
  output = ""
  output += printing_template(@returnsp,true)
  output += printing_template(@returnsm) if mixed?(amount)
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
