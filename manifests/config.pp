class nginx::config(
        String $config_dir              = $::nginx::params::config_dir,
        String $ensure           = $::nginx::params::config_ensure,
        String $mode             = $::nginx::params::config_mode,
        String $owner            = $::nginx::params::config_owner,
        String $group            = $::nginx::params::config_group,
        String $confd            = $::nginx::params::config_confd,
        String $log_dir          = $::nginx::params::config_log_dir,
        String $pid_file         = $::nginx::params::config_pid_file,
        Optional[String] $config_vdir_enable = $::nginx::params::config_vdir_enable,
	String $process_user	 = $::nginx::config_process_user,
	String $docroot		 = $::nginx::docroot,
) {
	file { 'nginx_conf': 
		ensure => $ensure,
		path   => "${config_dir}/nginx.conf",
		mode   => $mode,
		owner  => $owner,
		group  => $group,	
		contents => template("${module_name}/conf.d/nginx.erb"),		
	}
}
