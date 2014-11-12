Rails.application.routes.draw do

  ## STUDENTS ROUTES

  get 'students', to: "students#index", as: 'students'

  get 'students/new', to: "students#new", as: 'new_student'

  get 'students/:id', to: "students#show", as: 'student'

  get 'students/:id/edit', to: "students#edit", as: 'edit_student'

  post 'students', to: "students#create"

  patch 'students/:id', to: "students#update"

  delete 'students/:id', to: "students#destroy"

  ## COURSES ROUTES
  get 'courses', to: "courses#index", as: 'courses'

  get 'courses/new', to: "courses#new", as: 'new_course'

  get 'courses/:id', to: "courses#show", as: 'course'

  get 'courses/:id/edit', to: "courses#edit", as: 'edit_course'

  post 'courses', to: "courses#create"

  patch 'courses/:id', to: "courses#update"

  delete 'courses/:id', to: "courses#destroy"

end
