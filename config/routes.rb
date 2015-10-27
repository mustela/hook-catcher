Rails.application.routes.draw do
  post 'issues' => 'code_repositories#entry'
  post 'tickets' => 'tickets#entry'
end
