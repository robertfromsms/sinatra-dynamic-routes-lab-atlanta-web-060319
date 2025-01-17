require_relative 'config/environment'

class App < Sinatra::Base
  get '/reversename/:name' do
  	@username = params[:name]
  	@username.reverse
  end

  get '/square/:number' do
  	@number = params[:number]
  	(@number.to_i * @number.to_i).to_s
  end

  get '/say/:number/:phrase' do
  	@number = params[:number]
  	@phrase = params[:phrase]
  	@actualphrase = @phrase.split("%20").join(" ")
  	@bucket = ""
  	@number.to_i.times do
  		@bucket = @bucket + @actualphrase
  	end
  	@bucket
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
  	@word1 = params[:word1]
  	@word2 = params[:word2]
  	@word3 = params[:word3]
  	@word4 = params[:word4]
  	@word5 = params[:word5]
  	"#{@word1} #{@word2} #{@word3} #{@word4} #{@word5}."
  end

  get '/:operation/:number1/:number2' do
  	@operation = params[:operation]
  	@number1 = params[:number1]
  	@number2 = params[:number2]

  	case @operation
  	when "add"
  		(@number1.to_i + @number2.to_i).to_s
  	when "subtract"
  		(@number1.to_i - @number2.to_i).to_s
  	when "multiply"
  		(@number1.to_i * @number2.to_i).to_s
  	when "divide"
  		(@number1.to_i / @number2.to_i).to_s
  	else
  		"input correct operation"
  	end
  end
end