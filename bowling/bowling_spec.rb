require_relative './bowling'


describe 'Bowling scoring' do


it "1 , 1 spare and nothing more" do
    expect(score_for("1/------------------")).to eq 10
  end

  it "1 , 1 spare and nothing more" do
    expect(score_for("--------------1/----")).to eq 10
  end  

   it "1 , 1 spare and nothing more" do
    expect(score_for("------------------1/")).to eq 10
  end 
    
   it "1,1 and 2 spare and nothing more" do
    expect(score_for("--------------1/1/--")).to eq 21
  end 

  it "1 strake 1,1 and two spares" do
    expect(score_for("XX------------1/1/--")).to eq 31
  end 

   it "3 strake 1,1 and two spares" do
    expect(score_for("XXXXXX--------1/1/--")).to eq 81
  end 

   it "2 strake 1,1 and two spares" do
    expect(score_for("--XX----------1/1/--")).to eq 31
  end

  it "10 spare and nothing more" do
    expect(score_for("XXXXXXXXXXXXXXXXXXXX")).to eq 270
  end
  
  it "10 spare and nothing more" do
    expect(score_for("1/1/1/1/1/1/1/1/1/1/")).to eq 109
  end
  
  it "10 spare and nothing more" do
    expect(score_for("4/1/1/1/1/1/1/1/1/1/")).to eq 109
  end
  
  it "10 spare and nothing more" do
    expect(score_for("4/1/4/1/1/1/1/1/1/1/")).to eq 112
  end
  
  it "10 spare and nothing more" do
    expect(score_for("4/1/4/5/1/1/1/1/1/1/")).to eq 116
  end
  
  it "10 diff hits" do
    expect(score_for("51611111111111118118")).to eq 43
  end
end