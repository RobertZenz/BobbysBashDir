#!/bin/bash


__exit_norm=0			# Normal completion
__exit_perm=1 			# Operation not permitted 
__exit_noent=2 			# No such file or directory 
__exit_srch=3 			# No such process 
__exit_intr=4 			# Interrupted system call 
__exit_io=5 			# I/O error 
__exit_nxio=6 			# No such device or address 
__exit_2big=7 			# Argument list too long 
__exit_noexec=8 		# Exec format error 
__exit_badf=9 			# Bad file number 
__exit_child=10 		# No child processes 
__exit_again=11 		# Try again 
__exit_nomem=12 		# Out of memory 
__exit_acces=13 		# Permission denied 
__exit_fault=14 		# Bad address 
__exit_notblk=15 		# Block device required 
__exit_busy=16 			# Device or resource busy 
__exit_exist=17 		# File exists 
__exit_xdev=18 			# Cross-device link 
__exit_nodev=19 		# No such device 
__exit_notdir=20 		# Not a directory 
__exit_isdir=21 		# Is a directory 
__exit_inval=22 		# Invalid argument 
__exit_nfile=23 		# File table overflow 
__exit_mfile=24 		# Too many open files 
__exit_notty=25 		# Not a typewriter 
__exit_txtbsy=26 		# Text file busy 
__exit_fbig=27 			# File too large 
__exit_nospc=28 		# No space left on device 
__exit_spipe=29 		# Illegal seek 
__exit_rofs=30 			# Read-only file system 
__exit_mlink=31 		# Too many links 
__exit_pipe=32 			# Broken pipe 
__exit_dom=33 			# Math argument out of domain of func 
__exit_range=34 		# Math result not representable 
__exit_deadlk=35 		# Resource deadlock would occur 
__exit_nametoolong=36 	# File name too long 
__exit_nolck=37 		# No record locks available 
__exit_nosys=38 		# Function not implemented 
__exit_notempty=39	 	# Directory not empty 
__exit_loop=40 			# Too many symbolic links encountered 
__exit_wouldblock=__exit_again	# Operation would block 
__exit_nomsg=42 		# No message of desired type 
__exit_idrm=43 			# Identifier removed 
__exit_chrng=44 		# Channel number out of range 
__exit_l2nsync=45 		# Level 2 not synchronized 
__exit_l3hlt=46 		# Level 3 halted 
__exit_l3rst=47 		# Level 3 reset 
__exit_lnrng=48 		# Link number out of range 
__exit_unatch=49 		# Protocol driver not attached 
__exit_nocsi=50 		# No CSI structure available 
__exit_l2hlt=51 		# Level 2 halted 
__exit_bade=52 			# Invalid exchange 
__exit_badr=53 			# Invalid request descriptor 
__exit_xfull=54 		# Exchange full 
__exit_noano=55 		# No anode 
__exit_badrqc=56 		# Invalid request code 
__exit_badslt=57 		# Invalid slot 
__exit_deadlock=__exit_deadlk
__exit_bfont=59 		# Bad font file format 
__exit_nostr=60 		# Device not a stream 
__exit_nodata=61 		# No data available 
__exit_time=62 			# Timer expired 
__exit_nosr=63 			# Out of streams resources 
__exit_nonet=64 		# Machine is not on the network 
__exit_nopkg=65 		# Package not installed 
__exit_remote=66 		# Object is remote 
__exit_nolink=67 		# Link has been severed 
__exit_adv=68 			# Advertise error 
__exit_srmnt=69 		# Srmount error 
__exit_comm=70 			# Communication error on send 
__exit_proto=71 		# Protocol error 
__exit_multihop=72 		# Multihop attempted 
__exit_dotdot=73 		# RFS specific error 
__exit_badmsg=74 		# Not a data message 
__exit_overflow=75 		# Value too large for defined data type 
__exit_notuniq=76 		# Name not unique on network 
__exit_badfd=77 		# File descriptor in bad state 
__exit_remchg=78 		# Remote address changed 
__exit_libacc=79 		# Can not access a needed shared library 
__exit_libbad=80 		# Accessing a corrupted shared library 
__exit_libscn=81 		# .lib section in a.out corrupted 
__exit_libmax=82 		# Attempting to link in too many shared libraries 
__exit_libexec=83 		# Cannot exec a shared library directly 
__exit_ilseq=84 		# Illegal byte sequence 
__exit_restart=85 		# Interrupted system call should be restarted 
__exit_strpipe=86 		# Streams pipe error 
__exit_users=87 		# Too many users 
__exit_notsock=88 		# Socket operation on non-socket 
__exit_destaddrreq=89 	# Destination address required 
__exit_msgsize=90 		# Message too long 
__exit_prototype=91 	# Protocol wrong type for socket 
__exit_noprotoopt=92 	# Protocol not available 
__exit_protonosupport=93	# Protocol not supported 
__exit_socktnosupport=94	# Socket type not supported 
__exit_opnotsupp=95 	# Operation not supported on transport endpoint 
__exit_pfnosupport=96 	# Protocol family not supported 
__exit_afnosupport=97 	# Address family not supported by protocol 
__exit_addrinuse=98 	# Address already in use 
__exit_addrnotavail=99 	# Cannot assign requested address 
__exit_netdown=100		# Network is down 
__exit_netunreach=101	# Network is unreachable 
__exit_netreset=102		# Network dropped connection because of reset 
__exit_connaborted=103	# Software caused connection abort 
__exit_connreset=104	# Connection reset by peer 
__exit_nobufs=105		# No buffer space available 
__exit_isconn=106		# Transport endpoint is already connected 
__exit_notconn=107		# Transport endpoint is not connected 
__exit_shutdown=108		# Cannot send after transport endpoint shutdown 
__exit_toomanyrefs=109	# Too many references: cannot splice 
__exit_timedout=110		# Connection timed out 
__exit_connrefused=111	# Connection refused 
__exit_hostdown=112		# Host is down 
__exit_hostunreach=113	# No route to host 
__exit_already=114		# Operation already in progress 
__exit_inprogress=115	# Operation now in progress 
__exit_stale=116		# Stale NFS file handle 
__exit_uclean=117		# Structure needs cleaning 
__exit_notnam=118		# Not a XENIX named type file 
__exit_navail=119		# No XENIX semaphores available 
__exit_isnam=120		# Is a named type file 
__exit_remoteio=121		# Remote I/O error 
__exit_dquot=122		# Quota exceeded 
__exit_nomedium=123		# No medium found 
__exit_mediumtype=124	# Wrong medium type 
__exit_canceled=125		# Operation Canceled 
__exit_nokey=126		# Required key not available 
__exit_keyexpired=127	# Key has expired 
__exit_keyrevoked=128	# Key has been revoked 
__exit_keyrejected=129	# Key was rejected by service 

