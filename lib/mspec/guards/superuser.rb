require 'mspec/guards/guard'

class SuperUserGuard < SpecGuard
  def match?
    Process.euid == 0
  end
end

class Object
  def as_superuser(&block)
    SuperUserGuard.new.run_if(:as_superuser, &block)
  end
end
