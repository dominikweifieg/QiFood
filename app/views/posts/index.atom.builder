atom_feed(:language => I18n.locale, :schema_date => 2009) do |feed|
  if @user
    feed.title t('post.atom.title_user', :user_name => @user.login)
    feed.author do |author|
      author.name("#{@user.first_name} #{@user.name}")
    end
  else
    feed.title t('post.atom.title')
  end
  if @posts.first
    feed.updated  @posts.first.created_at
  else
    feed.updated Time.now - 1.year
  end
  
  for post in @posts
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(post.body, :type => 'html')
      entry.author do |author|
        author.name("#{post.user.first_name} #{post.user.name}")
      end
    end
  end
end
    