MB =  1024*1024

limits = {
  RLIMIT_CORE: [0, 0],
  RLIMIT_NPROC: [1, 4],
  RLIMIT_NOFILE: [25, 30],
  RLIMIT_CPU: [10, 20],
  RLIMIT_DATA: [8*MB, 10*MB],
  RLIMIT_FSIZE: [1*MB, 1.5*MB]
}


[
  :RLIMIT_CORE,   # disable core dumps
  :RLIMIT_NPROC,  # EAGAIN  - num processes
  :RLIMIT_NOFILE, # EMFILE  - file descriptors
  :RLIMIT_CPU,    # SIGXCPU - CPU time
  :RLIMIT_DATA,   # ENOMEM  - data (heap)
  :RLIMIT_FSIZE   # SIGXFSZ - file size
].each do |limit_type|
  Process.setrlimit(Process.const_get(limit_type), *limits[limit_type])
end

exec("phantomjs inf.js")
