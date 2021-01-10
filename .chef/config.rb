current_dir = File.dirname(__FILE__)
log_level                	:info
log_location             	STDOUT
node_name                	"codenamephp"
client_key               	"#{current_dir}/../codenamephp.pem"
chef_server_url          	"https://api.chef.io/organizations/codenamephp"
cookbook_path            	[
                            	 "#{current_dir}/../../"
                          	]
