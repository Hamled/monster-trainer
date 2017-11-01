class LogosController < ApplicationController
  def show
    @company_name = params[:company_name]

    # First find the domain for this company
    domain = ClearbitWrapper.domain_search(@company_name)

    return render_404 unless domain.present?

    # Then find the logo for that domain
    @logo_url = ClearbitWrapper.logo_search(domain)
    return render_404 unless @logo_url.present?
  end

  def search
    query = params[:query]
    return render :search unless query.present?

    redirect_to logo_path(query)
  end

  private

  def render_404
    render file: "#{Rails.root}/public/404.html" , status: :not_found
  end
end
