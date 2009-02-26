class Note < ActiveRecord::Base
  def notable
    Kernel.const_get( self.notable_type.classify ).find( self.notable_id )
  end

  def notable=( notable )
    self.notable_type = notable.class.to_s.underscore
    self.notable_id   = notable[:id]
  end
end
