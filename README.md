# About

serverspec sample scripts

# How to

```bash
%
% host setting
%

[test@host serverspec]$ rake serverspec:app01
[test@host serverspec]$ rake serverspec:db01

%
% target setting
%

[test@target ~]# visudo
cust    ALL=(ALL)       NOPASSWD: ALL #add
```
