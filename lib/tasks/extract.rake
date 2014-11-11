namespace :extract do
  # descの記述は必須
  desc "Extract Members"
  # :environment は モデルにアクセスするのに必須
  task :extract_members => :environment do
    # 処理を記述
    Member.all().each do | m |
      puts m.code + ' ' + m.name + ' ' + m.email
    end
  end
end
