define :zprezto_user, :action => :create do 
    case params[:action] 
    when :create
        home = params[:home] ? params[:home] : "/home/#{params[:name]}"

        user params[:name] do
            shell '/bin/zsh'
        end

        git "#{home}/.zprezto" do
            repository node['zprezto-user']['repository']
            reference "master"
            action :checkout
            not_if "test -d #{home}/.zprezto"
            user params[:name]
            group params[:name]
        end

        %w{ zshenv zshrc zlogin zlogout zpreztorc }.each do |zfile|
            execute "install #{home}/#{zfile}" do
                cwd home
                command "cp -pf #{home}/.zprezto/runcoms/#{zfile} #{home}/.#{zfile}"
                not_if { ::File.exists?("#{home}/.#{zfile}")}
            end
        end  
    end    
end