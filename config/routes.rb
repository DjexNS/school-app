RailsDevisePundit::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

	#get '/schools' => 'schools#index', as: :schools
	#get '/schools/new' => 'schools#new', as: :new_school
	#post 'schools' => 'schools#create'
	#get 'schools/:id' => 'schools#show', as: :school
	#get 'schools/:id/edit' => 'schools#edit', as: :edit_school
	#patch '/schools/:id' => 'schools#update'
	#delete '/schools/:id' => 'schools#destroy'

	get 'schools/:id/generate' => 'schools#generate', as: :generate_pupils
	get 'schools/:id/distribute' => 'pupils#distribute', as: :distribute_pupils

	#get 'schools/:id/pupils' => 'pupils#index', as: :pupils
	#get 'schools/:id/pupils/new' => 'pupils#new', as: :new_pupils
	#post 'schools/:id/pupils' => 'pupils#create'
	#get 'schools/:id/pupils/:id' => 'pupils#show', as: :pupil
	#get 'schools/:id/pupils/:id/edit' => 'pupils#edit', as: :edit_pupil
	#patch '/schools/:id/pupils/:id' => 'pupils#update'
	#delete '/pupils/:id' => 'pupils#destroy'

	resources :schools do
		resources :pupils
	end

	resources :schools do
		resources :classrooms
	end

end
