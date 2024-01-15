class BranchOfficesService::Create
  def initialize(client, params)
    @client = client
    @params = params
  end

  def call
    @scope = @client.branch_offices.new(@params)

    if save_result
      build_success_result
    else
      build_error_result
    end
  end

  private

  def build_branch_office
    @client.branch_offices.new(@params)
  end

  def save_result
    @scope.save
  end

  def build_success_result
    { data: @scope, status: :created }
  end

  def build_error_result
    { data: @scope.errors.as_json, status: :unprocessable_entity }
  end
end