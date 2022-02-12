user = User.seed do |s|
  s.id = 1
  s.code = 'newburu'
  s.name = 'にゅ〜ぶる'
end
Location.seed do |l|
  l.id = 1
  l.user = user[0]
  # 姫路城を登録
  l.latitude = 34.8396294982227
  l.longitude = 134.69393688407868
end
