#!/usr/bin/python2.7
# -*- coding: utf-8 -*-
rf_setting='''*** Settings ***
Resource          keywords.robot
Library           String
Library           Collections
Library           RequestsLibrary
Library           OperatingSystem
*** Keywords ***'''

body_str='''	\n\t[Documentation]	 *作者：谢应彪\n\t...\t时间：%s\n%s
	&{dic}    Get Variables
	@{list}    Get Variables
	#${headers}    Create Dictionary    Content-type=application/%s
	${data}    %s    ${list}    &{dic}'''
method_url={
            "post":"\n\t${url}    Set Variable    %s%s\n\t${resp}=    Post Request    ${omc_url_alias}   ${url}    data=${data}    headers=${headers}\n",
            "delete":"\n\t${url}    Set Variable    %s%s?${data}\n\t${resp}=    DELETE Request    ${omc_url_alias}  headers=${headers}\n",
            "get":"\n\t${url}    Set Variable    %s%s?${data}\n\t${resp}=    Get Request    ${omc_url_alias}   headers=${headers}\n",
            "patch":"\n\t${url}    Set Variable    %s%s?${data}\n\t${resp}=    PATCH Request    ${omc_url_alias}   headers=${headers}\n",
            "put":"\n\t${url}    Set Variable    %s%s?${data}\n\t${resp}=    PUT Request    ${omc_url_alias}   headers=${headers}\n"
            }
body_str='''	\n\t[Documentation]	 *作者：谢应彪\n\t...\t时间：%s\n%s
	&{dic}    Get Variables
	@{list}    Get Variables
	${headers}    	拼装header参数    	${list}    &{dic}
	Set To Dictionary    ${headers}    Content-type=application/%s
	${data}    %s    ${list}    &{dic}'''
rf_end_body='\t[Return]    ${resp}'