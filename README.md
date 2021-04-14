[![Puppet Forge](https://img.shields.io/puppetforge/v/katello/qpid.svg)](https://forge.puppetlabs.com/katello/qpid)
[![Build Status](https://travis-ci.org/theforeman/puppet-qpid.svg?branch=master)](https://travis-ci.org/theforeman/puppet-qpid)

#### Table of Contents

1. [Overview](#overview)
2. [What qpid affects](#what-qpid-affects)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module is designed to install and configure Qpid servers, clients, and dispatch routers for communication across a message bus.

## Supported Versions

The following versions of the qpid-cpp and qpid-dispatch are supported by this module

 * qpid-dispatch 1.1.0+
 * qpid-cpp 1.35+

## What qpid affects

* Installs and configures a Qpid server, client, or dispatch router

## Usage

See the top of each manifest for the parameters that each takes.

## Reference

* [Qpid Documentation](https://qpid.apache.org/documentation.html)

## Limitations

Tested on:

* EL7 (RHEL 7, CentOS 7, etc)

## Development

See the CONTRIBUTING guide for steps on how to make a change and get it accepted upstream.
