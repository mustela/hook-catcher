class CodeRepositoriesController < ApplicationController
  def entry
    params['action'] = issue_action
    CodeRepository.track(params)
  end

  private

  # We need this because the action is being overriden by rails
  def issue_action
    request.request_parameters['action']
  end

  def verify_signature(payload_body)
    signature = 'sha1=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), ENV['SECRET_TOKEN'], payload_body)
    return halt 500, "Signatures didn't match!" unless Rack::Utils.secure_compare(signature, request.env['HTTP_X_HUB_SIGNATURE'])
  end
end
