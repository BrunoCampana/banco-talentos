class CnhsController < InheritedResources::Base

  private

    def cnh_params
      params.require(:cnh).permit()
    end

end
