namespace :extract do
  # descの記述は必須
  desc "Extract Members"
  # メンバを全件抽出
  # :environment は モデルにアクセスするのに必須
  task :extract_members => :environment do
    # 処理を記述
    Member.all().each do | m |
      puts m.code + ' ' + m.name + ' ' + m.email
    end
  end
  # メンバを指定して、配下のアサインメントを全件抽出
  # :environment は モデルにアクセスするのに必須
  # 処理を記述
  task :extract_assigns, 'id'
  task :extract_assigns => :environment do |task, args|
    Member.find(args['id'].to_i).assignments.each do | a |
      # puts a.anken.customer + ' ' + a.ankan.name + ' ' + a.roleComment + ' ' + a.from + ' ' + a.to + ' ' + a.status
      puts a.anken.name + ' ' + a.anken.customer + ' ' + a.roleComment + ' ' + a.from.to_s + ' ' + a.to.to_s + ' ' + a.status
    end
  end
end
