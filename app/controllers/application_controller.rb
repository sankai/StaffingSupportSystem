require 'csv'
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  
  # デバッグ用kinukakeダミー
  def run2 (command, *params)
    
    # コマンドはアプリケーションディレクトリのSHELL配下の前提
    command = 'SHELL/' + command
    
    # コマンドの編集
    params.each do | param |
      command = command + ' ' + param.to_s    
    end 
    
    res = nil
    
    # コマンドの実行
    Open3.popen3(command) {|i, o, e, t|
      i.close
      
      # エラー出力に何か出力されていたら例外を生成する
      error_message = e.read
      if error_message.length > 0 
        raise error_message
      end
      res = o.read
      }
    
    puts res
    
    return res
  end

  
  
end
