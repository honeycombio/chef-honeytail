# settings for downloading the honeytail binary
default['honeytail']['download']['URL'] = 'https://honeycomb.io/download/honeytail'
default['honeytail']['download']['version'] = '1.260'
default['honeytail']['download']['sha256_checksum'] = 'd7b9c42373f7a0c8780e96237cb6142e0e807a0e98248d332f6c50ff534b15c7'

# required settings
default['honeytail']['parser'] = ''
default['honeytail']['writekey'] = ''
default['honeytail']['dataset'] = ''
default['honeytail']['logfiles'] = ['']

# optional application settings
default['honeytail']['application_options']['sample_rate'] = 1
default['honeytail']['application_options']['num_senders'] = 10
default['honeytail']['application_options']['status_interval'] = 120
default['honeytail']['application_options']['backfill'] = false
default['honeytail']['application_options']['scrub_fields'] = []
default['honeytail']['application_options']['drop_fields'] = []
default['honeytail']['application_options']['add_fields'] = []
default['honeytail']['application_options']['request_shape'] = []
default['honeytail']['application_options']['shape_prefix'] = ''
default['honeytail']['application_options']['request_pattern'] = []
default['honeytail']['application_options']['request_parse_query'] = 'whitelist'
default['honeytail']['application_options']['request_query_keys'] = []

# tail behavior
default['honeytail']['tail_options']['read_from'] = 'last'
default['honeytail']['tail_options']['stop'] = false
default['honeytail']['tail_options']['poll'] = false
default['honeytail']['tail_options']['statefile'] = '/var/lib/honeytail/'

# extra options for the nginx parser
default['honeytail']['nginx']['config'] = ''
default['honeytail']['nginx']['log_format'] = ''

# extra options for the json parser
default['honeytail']['json']['timefield'] = ''
default['honeytail']['json']['format'] = ''

# extra options for the mysql parser
default['honeytail']['mysql']['host'] = ''
default['honeytail']['mysql']['user'] = ''
default['honeytail']['mysql']['pass'] = ''
default['honeytail']['mysql']['query_interval'] = 30

# extra options for the mongo parser
default['honeytail']['mongo']['partials'] = ''

# any additional flags to pass, eg debug etc.
default['honeytail']['additional_flags'] = []
