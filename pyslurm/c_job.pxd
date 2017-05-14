# c_job.pxd
#
from libc.stdint cimport uint8_t, uint16_t, uint32_t, uint64_t
from libc.stdint cimport int32_t
from posix.types cimport pid_t, time_t
from .slurm_common cimport dynamic_plugin_data_t

cdef extern from "slurm/slurm.h" nogil:
    enum:
        NICE_OFFSET
        HIGHEST_DIMENSIONS

    ctypedef struct job_resources_t:
        pass

    ctypedef struct slurm_job_info_t:
        char *account
        char *admin_comment
        char *alloc_node
        uint32_t alloc_sid
        void *array_bitmap
        uint32_t array_job_id
        uint32_t array_task_id
        uint32_t array_max_tasks
        char *array_task_str
        uint32_t assoc_id
        uint16_t batch_flag
        char *batch_host
        char *batch_script
        uint32_t bitflags
        uint16_t boards_per_node
        char *burst_buffer
        char *burst_buffer_state
        char *command
        char *comment
        uint16_t contiguous
        uint16_t core_spec
        uint16_t cores_per_socket
        double billable_tres
        uint16_t cpus_per_task
        uint32_t cpu_freq_min
        uint32_t cpu_freq_max
        uint32_t cpu_freq_gov
        time_t deadline
        uint32_t delay_boot
        char *dependency
        uint32_t derived_ec
        time_t eligible_time
        time_t end_time
        char *exc_nodes
        int32_t *exc_node_inx
        uint32_t exit_code
        char *features
        char *fed_origin_str
        uint64_t fed_siblings
        char *fed_siblings_str
        char *gres
        uint32_t gres_detail_cnt
        char **gres_detail_str
        uint32_t group_id
        uint32_t job_id
        job_resources_t *job_resrcs
        uint32_t job_state
        char *licenses
        uint32_t max_cpus
        uint32_t max_nodes
        char *mcs_label
        char *name
        char *network
        char *nodes
        uint32_t nice
        int32_t *node_inx
        uint16_t ntasks_per_core
        uint16_t ntasks_per_node
        uint16_t ntasks_per_socket
        uint16_t ntasks_per_board
        uint32_t num_cpus
        uint32_t num_nodes
        uint32_t num_tasks
        char *partition
        uint64_t pn_min_memory
        uint16_t pn_min_cpus
        uint32_t pn_min_tmp_disk
        uint8_t power_flags
        time_t preempt_time
        time_t pre_sus_time
        uint32_t priority
        uint32_t profile
        char *qos
        uint8_t reboot
        char *req_nodes
        int32_t *req_node_inx
        uint32_t req_switch
        uint16_t requeue
        time_t resize_time
        uint16_t restart_cnt
        char *resv_name
        char *sched_nodes
        dynamic_plugin_data_t *select_jobinfo
        uint16_t shared
        uint16_t show_flags
        uint16_t sockets_per_board
        uint16_t sockets_per_node
        time_t start_time
        uint16_t start_protocol_ver
        char *state_desc
        uint16_t state_reason
        char *std_err
        char *std_in
        char *std_out
        time_t submit_time
        time_t suspend_time
        uint32_t time_limit
        uint32_t time_min
        uint16_t threads_per_core
        char *tres_req_str
        char *tres_alloc_str
        uint32_t user_id
        uint32_t wait4switch
        char *wckey
        char *work_dir

    ctypedef slurm_job_info_t job_info_t

    ctypedef struct job_info_msg_t:
        time_t last_update
        uint32_t record_count
        slurm_job_info_t *job_array

    enum job_state_reason:
        WAIT_NO_REASON
        WAIT_PRIORITY
        WAIT_DEPENDENCY
        WAIT_RESOURCES
        WAIT_PART_NODE_LIMIT
        WAIT_PART_TIME_LIMIT
        WAIT_PART_DOWN
        WAIT_PART_INACTIVE
        WAIT_HELD
        WAIT_TIME
        WAIT_LICENSES
        WAIT_ASSOC_JOB_LIMIT
        WAIT_ASSOC_RESOURCE_LIMIT
        WAIT_ASSOC_TIME_LIMIT
        WAIT_RESERVATION
        WAIT_NODE_NOT_AVAIL
        WAIT_HELD_USER
        WAIT_FRONT_END
        FAIL_DOWN_PARTITION
        FAIL_DOWN_NODE
        FAIL_BAD_CONSTRAINTS
        FAIL_SYSTEM
        FAIL_LAUNCH
        FAIL_EXIT_CODE
        FAIL_TIMEOUT
        FAIL_INACTIVE_LIMIT
        FAIL_ACCOUNT
        FAIL_QOS
        WAIT_QOS_THRES
        WAIT_QOS_JOB_LIMIT
        WAIT_QOS_RESOURCE_LIMIT
        WAIT_QOS_TIME_LIMIT
        WAIT_POWER_NOT_AVAIL
        WAIT_POWER_RESERVED
        WAIT_BLOCK_MAX_ERR
        WAIT_BLOCK_D_ACTION
        WAIT_CLEANING
        WAIT_PROLOG
        WAIT_QOS
        WAIT_ACCOUNT
        WAIT_DEP_INVALID
        WAIT_QOS_GRP_CPU
        WAIT_QOS_GRP_CPU_MIN
        WAIT_QOS_GRP_CPU_RUN_MIN
        WAIT_QOS_GRP_JOB
        WAIT_QOS_GRP_MEM
        WAIT_QOS_GRP_NODE
        WAIT_QOS_GRP_SUB_JOB
        WAIT_QOS_GRP_WALL
        WAIT_QOS_MAX_CPU_PER_JOB
        WAIT_QOS_MAX_CPU_MINS_PER_JOB
        WAIT_QOS_MAX_NODE_PER_JOB
        WAIT_QOS_MAX_WALL_PER_JOB
        WAIT_QOS_MAX_CPU_PER_USER
        WAIT_QOS_MAX_JOB_PER_USER
        WAIT_QOS_MAX_NODE_PER_USER
        WAIT_QOS_MAX_SUB_JOB
        WAIT_QOS_MIN_CPU
        WAIT_ASSOC_GRP_CPU
        WAIT_ASSOC_GRP_CPU_MIN
        WAIT_ASSOC_GRP_CPU_RUN_MIN
        WAIT_ASSOC_GRP_JOB
        WAIT_ASSOC_GRP_MEM
        WAIT_ASSOC_GRP_NODE
        WAIT_ASSOC_GRP_SUB_JOB
        WAIT_ASSOC_GRP_WALL
        WAIT_ASSOC_MAX_JOBS
        WAIT_ASSOC_MAX_CPU_PER_JOB
        WAIT_ASSOC_MAX_CPU_MINS_PER_JOB
        WAIT_ASSOC_MAX_NODE_PER_JOB
        WAIT_ASSOC_MAX_WALL_PER_JOB
        WAIT_ASSOC_MAX_SUB_JOB
        WAIT_MAX_REQUEUE
        WAIT_ARRAY_TASK_LIMIT
        WAIT_BURST_BUFFER_RESOURCE
        WAIT_BURST_BUFFER_STAGING
        FAIL_BURST_BUFFER_OP
        WAIT_POWER_NOT_AVAIL
        WAIT_POWER_RESERVED
        WAIT_ASSOC_GRP_UNK
        WAIT_ASSOC_GRP_UNK_MIN
        WAIT_ASSOC_GRP_UNK_RUN_MIN
        WAIT_ASSOC_MAX_UNK_PER_JOB
        WAIT_ASSOC_MAX_UNK_PER_NODE
        WAIT_ASSOC_MAX_UNK_MINS_PER_JOB
        WAIT_ASSOC_MAX_CPU_PER_NODE
        WAIT_ASSOC_GRP_MEM_MIN
        WAIT_ASSOC_GRP_MEM_RUN_MIN
        WAIT_ASSOC_MAX_MEM_PER_JOB
        WAIT_ASSOC_MAX_MEM_PER_NODE
        WAIT_ASSOC_MAX_MEM_MINS_PER_JOB
        WAIT_ASSOC_GRP_NODE_MIN
        WAIT_ASSOC_GRP_NODE_RUN_MIN
        WAIT_ASSOC_MAX_NODE_MINS_PER_JOB
        WAIT_ASSOC_GRP_ENERGY
        WAIT_ASSOC_GRP_ENERGY_MIN
        WAIT_ASSOC_GRP_ENERGY_RUN_MIN
        WAIT_ASSOC_MAX_ENERGY_PER_JOB
        WAIT_ASSOC_MAX_ENERGY_PER_NODE
        WAIT_ASSOC_MAX_ENERGY_MINS_PER_JOB
        WAIT_ASSOC_GRP_GRES
        WAIT_ASSOC_GRP_GRES_MIN
        WAIT_ASSOC_GRP_GRES_RUN_MIN
        WAIT_ASSOC_MAX_GRES_PER_JOB
        WAIT_ASSOC_MAX_GRES_PER_NODE
        WAIT_ASSOC_MAX_GRES_MINS_PER_JOB
        WAIT_ASSOC_GRP_LIC
        WAIT_ASSOC_GRP_LIC_MIN
        WAIT_ASSOC_GRP_LIC_RUN_MIN
        WAIT_ASSOC_MAX_LIC_PER_JOB
        WAIT_ASSOC_MAX_LIC_MINS_PER_JOB
        WAIT_ASSOC_GRP_BB
        WAIT_ASSOC_GRP_BB_MIN
        WAIT_ASSOC_GRP_BB_RUN_MIN
        WAIT_ASSOC_MAX_BB_PER_JOB
        WAIT_ASSOC_MAX_BB_PER_NODE
        WAIT_ASSOC_MAX_BB_MINS_PER_JOB
        WAIT_QOS_GRP_UNK
        WAIT_QOS_GRP_UNK_MIN
        WAIT_QOS_GRP_UNK_RUN_MIN
        WAIT_QOS_MAX_UNK_PER_JOB
        WAIT_QOS_MAX_UNK_PER_NODE
        WAIT_QOS_MAX_UNK_PER_USER
        WAIT_QOS_MAX_UNK_MINS_PER_JOB
        WAIT_QOS_MIN_UNK
        WAIT_QOS_MAX_CPU_PER_NODE
        WAIT_QOS_GRP_MEM_MIN
        WAIT_QOS_GRP_MEM_RUN_MIN
        WAIT_QOS_MAX_MEM_MINS_PER_JOB
        WAIT_QOS_MAX_MEM_PER_JOB
        WAIT_QOS_MAX_MEM_PER_NODE
        WAIT_QOS_MAX_MEM_PER_USER
        WAIT_QOS_MIN_MEM
        WAIT_QOS_GRP_ENERGY
        WAIT_QOS_GRP_ENERGY_MIN
        WAIT_QOS_GRP_ENERGY_RUN_MIN
        WAIT_QOS_MAX_ENERGY_PER_JOB
        WAIT_QOS_MAX_ENERGY_PER_NODE
        WAIT_QOS_MAX_ENERGY_PER_USER
        WAIT_QOS_MAX_ENERGY_MINS_PER_JOB
        WAIT_QOS_MIN_ENERGY
        WAIT_QOS_GRP_NODE_MIN
        WAIT_QOS_GRP_NODE_RUN_MIN
        WAIT_QOS_MAX_NODE_MINS_PER_JOB
        WAIT_QOS_MIN_NODE
        WAIT_QOS_GRP_GRES
        WAIT_QOS_GRP_GRES_MIN
        WAIT_QOS_GRP_GRES_RUN_MIN
        WAIT_QOS_MAX_GRES_PER_JOB
        WAIT_QOS_MAX_GRES_PER_NODE
        WAIT_QOS_MAX_GRES_PER_USER
        WAIT_QOS_MAX_GRES_MINS_PER_JOB
        WAIT_QOS_MIN_GRES
        WAIT_QOS_GRP_LIC
        WAIT_QOS_GRP_LIC_MIN
        WAIT_QOS_GRP_LIC_RUN_MIN
        WAIT_QOS_MAX_LIC_PER_JOB
        WAIT_QOS_MAX_LIC_PER_USER
        WAIT_QOS_MAX_LIC_MINS_PER_JOB
        WAIT_QOS_MIN_LIC
        WAIT_QOS_GRP_BB
        WAIT_QOS_GRP_BB_MIN
        WAIT_QOS_GRP_BB_RUN_MIN
        WAIT_QOS_MAX_BB_PER_JOB
        WAIT_QOS_MAX_BB_PER_NODE
        WAIT_QOS_MAX_BB_PER_USER
        WAIT_QOS_MAX_BB_MINS_PER_JOB
        WAIT_QOS_MIN_BB
        FAIL_DEADLINE
        WAIT_QOS_MAX_BB_PER_ACCT
        WAIT_QOS_MAX_CPU_PER_ACCT
        WAIT_QOS_MAX_ENERGY_PER_ACCT
        WAIT_QOS_MAX_GRES_PER_ACCT
        WAIT_QOS_MAX_NODE_PER_ACCT
        WAIT_QOS_MAX_LIC_PER_ACCT
        WAIT_QOS_MAX_MEM_PER_ACCT
        WAIT_QOS_MAX_UNK_PER_ACCT
        WAIT_QOS_MAX_JOB_PER_ACCT
        WAIT_QOS_MAX_SUB_JOB_PER_ACCT
        WAIT_PART_CONFIG
        WAIT_ACCOUNT_POLICY
        WAIT_FED_JOB_LOCK
        FAIL_OOM

    enum select_jobdata_type:
        SELECT_JOBDATA_GEOMETRY
        SELECT_JOBDATA_ROTATE
        SELECT_JOBDATA_CONN_TYPE
        SELECT_JOBDATA_BLOCK_ID
        SELECT_JOBDATA_NODES
        SELECT_JOBDATA_IONODES
        SELECT_JOBDATA_NODE_CNT
        SELECT_JOBDATA_ALTERED
        SELECT_JOBDATA_BLRTS_IMAGE
        SELECT_JOBDATA_LINUX_IMAGE
        SELECT_JOBDATA_MLOADER_IMAGE
        SELECT_JOBDATA_RAMDISK_IMAGE
        SELECT_JOBDATA_REBOOT
        SELECT_JOBDATA_RESV_ID
        SELECT_JOBDATA_PAGG_ID
        SELECT_JOBDATA_PTR
        SELECT_JOBDATA_BLOCK_PTR
        SELECT_JOBDATA_DIM_CNT
        SELECT_JOBDATA_BLOCK_NODE_CNT
        SELECT_JOBDATA_START_LOC
        SELECT_JOBDATA_USER_NAME
        SELECT_JOBDATA_CONFIRMED
        SELECT_JOBDATA_CLEANING
        SELECT_JOBDATA_NETWORK

    enum: CORE_SPEC_THREAD

    enum:
        KILL_INV_DEP
        NO_KILL_INV_DEP

    enum job_states:
        JOB_PENDING
        JOB_RUNNING
        JOB_SUSPENDED
        JOB_COMPLETE
        JOB_CANCELLED
        JOB_FAILED
        JOB_TIMEOUT
        JOB_NODE_FAIL
        JOB_PREEMPTED
        JOB_BOOT_FAIL
        JOB_DEADLINE
        JOB_OOM
        JOB_END

    enum:
        JOB_STATE_BASE
        JOB_RECONFIG_FAIL
        JOB_REVOKED
        JOB_REQUEUE_FED

    ctypedef struct job_desc_msg_t:
        char *account
        char *acctg_freq
        char *admin_comment
        char *alloc_node
        uint16_t alloc_resp_port
        uint32_t alloc_sid
        uint32_t argc
        char **argv
        char *array_inx
        void *array_bitmap
        time_t begin_time
        uint32_t bitflags
        char *burst_buffer
        uint16_t ckpt_interval
        char *ckpt_dir
        char *clusters
        char *comment
        uint16_t contiguous
        uint16_t core_spec
        char *cpu_bind
        uint16_t cpu_bind_type
        uint32_t cpu_freq_min
        uint32_t cpu_freq_max
        uint32_t cpu_freq_gov
        time_t deadline
        uint32_t delay_boot
        char *dependency
        time_t end_time
        char **environment
        uint32_t env_size
        char *exc_nodes
        char *features
        uint64_t fed_siblings
        char *gres
        uint32_t group_id
        uint32_t group_number
        uint16_t immediate
        uint32_t job_id
        char * job_id_str
        uint16_t kill_on_node_fail
        char *licenses
        uint16_t mail_type
        char *mail_user
        char *mcs_label
        char *mem_bind
        uint16_t mem_bind_type
        char *name
        char *network
        uint32_t nice
        uint32_t numpack
        uint32_t num_tasks
        uint8_t open_mode
        uint16_t other_port
        uint8_t overcommit
        uint32_t pack_leader
        char *partition
        char **pelog_env
        uint32_t pelog_env_size
        uint16_t plane_size
        uint8_t power_flags
        uint32_t priority
        uint32_t profile
        char *qos
        uint16_t reboot
        char *resp_host
        uint16_t restart_cnt
        uint8_t resv_port
        char *req_nodes
        uint16_t requeue
        char *reservation
        char *script
        uint16_t shared
        char **spank_job_env
        uint32_t spank_job_env_size
        uint32_t task_dist
        uint32_t time_limit
        uint32_t time_min
        uint32_t user_id
        uint16_t wait_all_nodes
        uint16_t warn_flags
        uint16_t warn_signal
        uint16_t warn_time
        char *work_dir
        # job constraints
        uint16_t cpus_per_task
        uint32_t min_cpus
        uint32_t max_cpus
        uint32_t min_nodes
        uint32_t max_nodes
        uint16_t boards_per_node
        uint16_t sockets_per_board
        uint16_t sockets_per_node
        uint16_t cores_per_socket
        uint16_t threads_per_core
        uint16_t ntasks_per_node
        uint16_t ntasks_per_socket
        uint16_t ntasks_per_core
        uint16_t ntasks_per_board
        uint16_t pn_min_cpus
        uint64_t pn_min_memory
        uint32_t pn_min_tmp_disk
        # The following parameters are only meaningful on a Blue Gene
        # system at present. Some will be of value on other system. Don't remove these
        # they are needed for LCRM and others that can't talk to the opaque data type
        # select_jobinfo.
        uint16_t geometry[HIGHEST_DIMENSIONS]
        uint16_t conn_type[HIGHEST_DIMENSIONS]
        uint16_t rotate
        char *blrtsimage
        char *linuximage
        char *mloaderimage
        char *ramdiskimage
        # End of Blue Gene specific values
        uint32_t req_switch
        dynamic_plugin_data_t *select_jobinfo
        char *std_err
        char *std_in
        char *std_out
        uint64_t *tres_req_cnt
        uint32_t wait4switch
        char *wckey

    ctypedef struct resource_allocation_response_msg_t:
        char *account
        uint32_t job_id
        char *alias_list
        uint32_t cpu_freq_min
        uint32_t cpu_freq_max
        uint32_t cpu_freq_gov
        uint16_t *cpus_per_node
        uint32_t *cpu_count_reps
        uint32_t env_size
        char **environment
        uint32_t error_code
        slurm_addr_t *node_addr
        uint32_t node_cnt
        char *node_list
        uint16_t ntasks_per_board
        uint16_t ntasks_per_core
        uint16_t ntasks_per_socket
        uint32_t num_cpu_groups
        char *partition
        uint64_t pn_min_memory
        char *qos
        char *resv_name
        dynamic_plugin_data_t *select_jobinfo

    ctypedef struct submit_response_msg_t:
        uint32_t job_id
        uint32_t step_id
        uint32_t error_code

    int slurm_load_job(job_info_msg_t **resp, uint32_t job_id,
                       uint16_t show_flags)

    int slurm_load_jobs(time_t update_time,
                        job_info_msg_t **job_info_msg_pptr,
                        uint16_t show_flags)

    int slurm_load_job_user(job_info_msg_t **job_info_msg_pptr,
                            uint32_t user_id, uint16_t show_flags)

    int slurm_get_select_jobinfo(dynamic_plugin_data_t *jobinfo,
                                 select_jobdata_type data_type,
                                 void *data)

    int slurm_pid2jobid(pid_t job_pid, uint32_t *job_id_ptr)
    void slurm_free_job_info_msg(job_info_msg_t *job_buffer_ptr)
    void slurm_get_job_stderr(char *buf, int buf_size, job_info_t *job_ptr)
    void slurm_get_job_stdin(char *buf, int buf_size, job_info_t *job_ptr)
    void slurm_get_job_stdout(char *buf, int buf_size, job_info_t *job_ptr)
    uint32_t slurm_xlate_job_id(char *job_id_str)
    long slurm_get_rem_time(uint32_t jobid)
    int slurm_kill_job(uint32_t job_id, uint16_t signal, uint16_t flags)
    int slurm_notify_job(uint32_t job_id, char *message)
    int slurm_get_end_time(uint32_t jobid, time_t *end_time_ptr)

    int slurm_job_cpus_allocated_on_node(job_resources_t *job_resrcs_ptr,
                                         const char *node_name)

    void slurm_init_job_desc_msg(job_desc_msg_t *job_desc_msg)

    int slurm_allocate_resources(job_desc_msg_t *job_desc_msg,
                                 resource_allocation_response_msg_t **job_alloc_resp_msg)

    resource_allocation_response_msg_t *slurm_allocate_resources_blocking(
        const job_desc_msg_t *user_req,
        time_t timeout,
        void (*pending_callback)(uint32_t job_id)
    )

    void slurm_free_resource_allocation_response_msg(
        resource_allocation_response_msg_t *msg
    )

    int slurm_submit_batch_job(job_desc_msg_t *job_desc_msg,
        submit_response_msg_t **slurm_alloc_msg
    )

    void slurm_free_submit_response_response_msg(submit_response_msg_t *msg)
    int slurm_update_job(job_desc_msg_t *job_msg)

#
# Job declarations outside of slurm.h
#

# src/common/slurm_protocol_api.h
cdef extern uint16_t slurm_get_track_wckey()
cdef extern char *slurm_job_reason_string(job_state_reason inx)
cdef extern char *slurm_job_state_string(uint32_t inx)

# src/common/slurm_protocol_defs.c
cdef extern char *slurm_job_share_string(uint16_t shared)

#cdef extern int select_g_select_jobinfo_get(dynamic_plugin_data_t *jobinfo,
#                                            select_jobdata_type data_type,
#                                            void *data)


#
# Defined job states
#
cdef inline IS_JOB_PENDING(job_info_t _X):
    return (_X.job_state & JOB_STATE_BASE) == JOB_PENDING

cdef inline IS_JOB_SUSPENDED(job_info_t _X):
    return (_X.job_state & JOB_STATE_BASE) == JOB_SUSPENDED

cdef inline IS_JOB_RUNNING(job_info_t _X):
    return (_X.job_state & JOB_STATE_BASE) == JOB_RUNNING