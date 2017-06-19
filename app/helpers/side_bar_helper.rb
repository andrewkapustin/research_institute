module SideBarHelper
  def side_bar_items(ru)
    result = []
    result << {
      :name => 'Сслыка без детей',
      :icon => 'list',
      :controller => :welcome,
      :action => :index
    }
    result << {
      :name => 'Администрирование',
      :icon => 'users',
      :children => [
      {:name => 'Пользователи',
       :controller => :users, :action => :index,
       :icon => 'users',
       :class => 'long'},
      {:name => 'Добавление',
       :controller => :users, :action => :new_by_admin,
       :icon => 'user-plus'},
      {:name => 'Роли',
       :controller => :roles, :action => :index,
       :icon => 'align-center',
       :class => 'long'},
    ]}
    result << {
      :name => 'НИИ',
      :icon => 'search-plus',
      :children => [
      {:name => 'Сотрудники',
       :controller => :employees, :action => :index,
       :icon => 'binoculars'},
      {:name => 'Поиск сотрудников',
       :controller => :employees, :action => :search,
       :icon => 'search'},
      {:name => 'Проекты',
       :controller => :projects, :action => :index,
       :icon => 'search',
       :class => 'long'}
    ]}
    result
  end

  def is_open?(ctr, act)
    case ctr.to_s
    when 'users', 'roles'
      ctr.to_s == controller_name.to_s
    else
      false
    end
  end
end
