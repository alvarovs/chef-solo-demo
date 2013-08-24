#
# Author:: Seth Chisamore (<schisamo@opscode.com>)
# Cookbook Name:: java
# Attributes:: default
#
# Copyright 2010, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# remove the deprecated Ubuntu jdk packages
default['java']['remove_deprecated_packages'] = false

# default jdk attributes
default['java']['install_flavor'] = "oracle"
default['java']['jdk_version'] = '7'
default['java']['arch'] = kernel['machine'] =~ /x86_64/ ? "x86_64" : "i586"

case platform
when "centos","redhat","fedora","scientific","amazon"
  default['java']['java_home'] = "/usr/lib/jvm/java"
when "freebsd"
  default['java']['java_home'] = "/usr/local/openjdk#{java['jdk_version']}"
when "arch"
  default['java']['java_home'] = "/usr/lib/jvm/java-#{java['jdk_version']}-openjdk"
else
  default['java']['java_home'] = "/usr/lib/jvm/default-java"
end

# if you change this to true, you can download directly from Oracle
default['java']['oracle']['accept_oracle_download_terms'] = true

# direct download paths for oracle, you have been warned!

# jdk6 attributes
# x86_64
default['java']['jdk']['6']['x86_64']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/6u37-b06/jdk-6u37-linux-x64.bin'
default['java']['jdk']['6']['x86_64']['checksum'] = '51d594cec29948bdf58918ba802a872826bc7caae3f0aada42b65eacdc14a7f4'

# i586
default['java']['jdk']['6']['i586']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/6u37-b06/jdk-6u37-linux-i586.bin'
default['java']['jdk']['6']['i586']['checksum'] = '44cc51ed452a08a3e0b4e397922832607161642e5a6e206f256af86f8fbaae90'

# jdk7 attributes
# x86_64
default['java']['jdk']['7']['x86_64']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/7u25-b15/jdk-7u25-linux-x64.tar.gz'
default['java']['jdk']['7']['x86_64']['checksum'] = '83ba05e260813f7a9140b76e3d37ea33'

# i586
default['java']['jdk']['7']['i586']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/7u25-b15/jdk-7u25-linux-i586.tar.gz'
default['java']['jdk']['7']['i586']['checksum'] = '23176d0ebf9dedd21e3150b4bb0ee776'
