Chef cookbook to install honeytail
==================================

[![OSS Lifecycle](https://img.shields.io/osslifecycle/honeycombio/chef-honeytail)](https://github.com/honeycombio/home/blob/main/honeycomb-oss-lifecycle-and-practices.md)

**STATUS: this project has been archived.** See https://github.com/honeycombio/home/blob/main/honeycomb-oss-lifecycle-and-practices.md

For more details on honeytail, see the [Honeycomb docs](https://docs.honeycomb.io)


Usage
-----

To successfully use this cookbook, there are a few things you should do in the
wrapping cookbook.

Specify your Honeycomb details in attributes:

* `default['honeytail']['parser']` - a string - run `honeytail --list` for a list of valid values
* `default['honeytail']['writekey']` - a string - your Honeycomb [team key](https://ui.honeycomb.io/account)
* `default['honeytail']['dataset']` - a string - the name of the dataset to use
* `default['honeytail']['logfiles']` - a list of strings - the files to tail

Make sure the `honeytail` user has read access to your log files. The easiest
way to do this is to add the `honeytail` user to a group that has read access to
the logs or make the logs world readable. As an example, if the log file you want to use is mode `640` with ownership
`www:adm`, the following would let the `honeytail` user read it:

```
group 'adm' do
  action :modify
  members 'honeytail'
  append true
end
```

