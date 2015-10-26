class CodeRepositoriesController < ApplicationController
  def entry
    params['action'] = issue_action
    CodeRepository.track(params)
  end

  private

  # We need to
  def issue_action
    request.request_parameters['action']
  end
end
