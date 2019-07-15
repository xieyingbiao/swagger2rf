*** Settings ***
Resource          keywords.robot
Library           String
Library           Collections
Library           RequestsLibrary
Library           OperatingSystem
*** Keywords ***
批量删除推广配置
	[Arguments]	${spread_id_list_variable}	${x-token_headers}	${x-user-id_headers}	${x-username_headers}		
	[Documentation]	 *作者：谢应彪
	...	时间：2019-05-20 11:49:26
	...	x-token	string	token
	...	x-user-id	string	user-id
	...	x-username	string	username
	...	spread_id_list	array	必填，推广 id
	...	spread_id_list	array	必填，推广 id
	...		
	&{dic}    Get Variables
	@{list}    Get Variables
	${headers}    	拼装header参数    	${list}    &{dic}
	Set To Dictionary    ${headers}    Content-type=application/json
	${data}    拼装json参数    ${list}    &{dic}
	${url}    Set Variable    /spread/omc/delete
	${resp}=    Post Request    ${omc_url_alias}   ${url}    data=${data}    headers=${headers}
	[Return]    ${resp}
设置黑白名单
	[Arguments]	${id_variable}	${list_type_variable}	${black_list_variable}	${white_list_variable}	${id_variable}	${list_type_variable}	${x-token_headers}	${x-user-id_headers}	${x-username_headers}		
	[Documentation]	 *作者：谢应彪
	...	时间：2019-05-20 11:49:26
	...	x-token	string	token
	...	x-user-id	string	user-id
	...	x-username	string	username
	...	id	string	id
	...	list_type	string	list_type
	...	black_list	array	必填，完全按照填写更新
	...	white_list	array	必填，完全按照填写更新
	...	id	string	
	...	list_type	string	必填，黑白名单对应的主体，behavior-行为,spread-推广
	...	list_type	string	必填，黑白名单对应的主体，behavior-行为,spread-推广
	...		
	&{dic}    Get Variables
	@{list}    Get Variables
	${headers}    	拼装header参数    	${list}    &{dic}
	Set To Dictionary    ${headers}    Content-type=application/json
	${data}    拼装json参数    ${list}    &{dic}
	${url}    Set Variable    /spread/omc/v2/id_list_form/store
	${resp}=    Post Request    ${omc_url_alias}   ${url}    data=${data}    headers=${headers}
	[Return]    ${resp}
推广入口批量排序
	[Arguments]	${sort_request_list_variable}	${x-token_headers}	${x-user-id_headers}	${x-username_headers}		
	[Documentation]	 *作者：谢应彪
	...	时间：2019-05-20 11:49:26
	...	x-token	string	token
	...	x-user-id	string	user-id
	...	x-username	string	username
	...	sort_request_list	array	排序请示
	...	sort_request_list	array	排序请示
	...		
	&{dic}    Get Variables
	@{list}    Get Variables
	${headers}    	拼装header参数    	${list}    &{dic}
	Set To Dictionary    ${headers}    Content-type=application/json
	${data}    拼装json参数    ${list}    &{dic}
	${url}    Set Variable    /spread/omc/entrance_sort
	${resp}=    Post Request    ${omc_url_alias}   ${url}    data=${data}    headers=${headers}
	[Return]    ${resp}
添加或更新推广配置关联的行为开关
	[Arguments]	${area_variable}	${creator_variable}	${flags_variable}	${id_variable}	${title_variable}	${x-token_headers}	${x-user-id_headers}	${x-username_headers}		
	[Documentation]	 *作者：谢应彪
	...	时间：2019-05-20 11:49:26
	...	x-token	string	token
	...	x-user-id	string	user-id
	...	x-username	string	username
	...	area	array	必填，推广区域，全国传10，精确到市，传市的地区码，市是4位地区码
	...	creator	string	不填，返回值，创建者名
	...	flags	string	必填，推广开关，字符串，只要前端自己认识，随便填啥
	...	id	string	
	...	title	string	
	...	title	string	
	...		
	&{dic}    Get Variables
	@{list}    Get Variables
	${headers}    	拼装header参数    	${list}    &{dic}
	Set To Dictionary    ${headers}    Content-type=application/json
	${data}    拼装json参数    ${list}    &{dic}
	${url}    Set Variable    /spread/omc/v2/behavior/store
	${resp}=    Post Request    ${omc_url_alias}   ${url}    data=${data}    headers=${headers}
	[Return]    ${resp}
查询推广配置入口列表
	[Arguments]	${page_variable}	${page_size_variable}	${spread_id_variable}	${position_id_variable}	${resource_type_variable}	${title_variable}	${x-token_headers}	${x-user-id_headers}	${x-username_headers}		
	[Documentation]	 *作者：谢应彪
	...	时间：2019-05-20 11:49:26
	...	x-token	string	token
	...	x-user-id	string	user-id
	...	x-username	string	username
	...	page	integer	页码
	...	page_size	integer	每页条数
	...	spread_id	string	推广 id
	...	position_id	string	位置 id
	...	resource_type	integer	内容类型
	...	title	string	标题，前缀匹配
	...		
	&{dic}    Get Variables
	@{list}    Get Variables
	${headers}    	拼装header参数    	${list}    &{dic}
	Set To Dictionary    ${headers}    Content-type=application/x-www-form-urlencoded
	${data}    拼装url参数    ${list}    &{dic}
	${url}    Set Variable    /spread/omc/entrance_list?${data}
	${resp}=    Get Request    ${omc_url_alias}   headers=${headers}
	[Return]    ${resp}
查询行为开关
	[Arguments]	${page_variable}	${page_size_variable}	${x-token_headers}	${x-user-id_headers}	${x-username_headers}		
	[Documentation]	 *作者：谢应彪
	...	时间：2019-05-20 11:49:26
	...	x-token	string	token
	...	x-user-id	string	user-id
	...	x-username	string	username
	...	page	string	page
	...	page_size	string	page_size
	...		
	&{dic}    Get Variables
	@{list}    Get Variables
	${headers}    	拼装header参数    	${list}    &{dic}
	Set To Dictionary    ${headers}    Content-type=application/x-www-form-urlencoded
	${data}    拼装url参数    ${list}    &{dic}
	${url}    Set Variable    /spread/omc/v2/behavior/query?${data}
	${resp}=    Get Request    ${omc_url_alias}   headers=${headers}
	[Return]    ${resp}
查询推广配置入口
	[Arguments]	${spread_id_variable}	${entrance_id_variable}	${x-token_headers}	${x-user-id_headers}	${x-username_headers}		
	[Documentation]	 *作者：谢应彪
	...	时间：2019-05-20 11:49:26
	...	x-token	string	token
	...	x-user-id	string	user-id
	...	x-username	string	username
	...	spread_id	string	推广 id
	...	entrance_id	string	推广入口 id
	...		
	&{dic}    Get Variables
	@{list}    Get Variables
	${headers}    	拼装header参数    	${list}    &{dic}
	Set To Dictionary    ${headers}    Content-type=application/x-www-form-urlencoded
	${data}    拼装url参数    ${list}    &{dic}
	${url}    Set Variable    /spread/omc/entrance_get?${data}
	${resp}=    Get Request    ${omc_url_alias}   headers=${headers}
	[Return]    ${resp}
删除行为开关
	[Arguments]	${id_variable}	${x-token_headers}	${x-user-id_headers}	${x-username_headers}		
	[Documentation]	 *作者：谢应彪
	...	时间：2019-05-20 11:49:26
	...	x-token	string	token
	...	x-user-id	string	user-id
	...	x-username	string	username
	...	id	string	id
	...		
	&{dic}    Get Variables
	@{list}    Get Variables
	${headers}    	拼装header参数    	${list}    &{dic}
	Set To Dictionary    ${headers}    Content-type=application/x-www-form-urlencoded
	${data}    拼装url参数    ${list}    &{dic}
	${url}    Set Variable    /spread/omc/v2/behavior/del?${data}
	${resp}=    Get Request    ${omc_url_alias}   headers=${headers}
	[Return]    ${resp}
获取推广列表
	[Arguments]	${page_variable}	${page_size_variable}	${start_time_variable}	${end_time_variable}	${title_variable}	${x-token_headers}	${x-user-id_headers}	${x-username_headers}		
	[Documentation]	 *作者：谢应彪
	...	时间：2019-05-20 11:49:26
	...	x-token	string	token
	...	x-user-id	string	user-id
	...	x-username	string	username
	...	page	integer	页码
	...	page_size	integer	每页条数
	...	start_time	integer	开始时间
	...	end_time	integer	结束时间
	...	title	string	标题，前缀匹配
	...		
	&{dic}    Get Variables
	@{list}    Get Variables
	${headers}    	拼装header参数    	${list}    &{dic}
	Set To Dictionary    ${headers}    Content-type=application/x-www-form-urlencoded
	${data}    拼装url参数    ${list}    &{dic}
	${url}    Set Variable    /spread/omc/list?${data}
	${resp}=    Get Request    ${omc_url_alias}   headers=${headers}
	[Return]    ${resp}
复制推广配置
	[Arguments]	${spread_id_variable}	${x-token_headers}	${x-user-id_headers}	${x-username_headers}		
	[Documentation]	 *作者：谢应彪
	...	时间：2019-05-20 11:49:26
	...	x-token	string	token
	...	x-user-id	string	user-id
	...	x-username	string	username
	...	spread_id	string	推广 id
	...		
	&{dic}    Get Variables
	@{list}    Get Variables
	${headers}    	拼装header参数    	${list}    &{dic}
	Set To Dictionary    ${headers}    Content-type=application/x-www-form-urlencoded
	${data}    拼装url参数    ${list}    &{dic}
	${url}    Set Variable    /spread/omc/duplication?${data}
	${resp}=    Get Request    ${omc_url_alias}   headers=${headers}
	[Return]    ${resp}
删除黑白名单
	[Arguments]	${id_variable}	${list_type_variable}	${x-token_headers}	${x-user-id_headers}	${x-username_headers}		
	[Documentation]	 *作者：谢应彪
	...	时间：2019-05-20 11:49:26
	...	x-token	string	token
	...	x-user-id	string	user-id
	...	x-username	string	username
	...	id	string	id
	...	list_type	string	list_type
	...		
	&{dic}    Get Variables
	@{list}    Get Variables
	${headers}    	拼装header参数    	${list}    &{dic}
	Set To Dictionary    ${headers}    Content-type=application/x-www-form-urlencoded
	${data}    拼装url参数    ${list}    &{dic}
	${url}    Set Variable    /spread/omc/v2/id_list_form/del?${data}
	${resp}=    Get Request    ${omc_url_alias}   headers=${headers}
	[Return]    ${resp}
设置黑白名单
	[Arguments]	${id_variable}	${list_type_variable}	${x-token_headers}	${x-user-id_headers}	${x-username_headers}		
	[Documentation]	 *作者：谢应彪
	...	时间：2019-05-20 11:49:26
	...	x-token	string	token
	...	x-user-id	string	user-id
	...	x-username	string	username
	...	id	string	id
	...	list_type	string	list_type
	...		
	&{dic}    Get Variables
	@{list}    Get Variables
	${headers}    	拼装header参数    	${list}    &{dic}
	Set To Dictionary    ${headers}    Content-type=application/x-www-form-urlencoded
	${data}    拼装url参数    ${list}    &{dic}
	${url}    Set Variable    /spread/omc/v2/id_list_form/get?${data}
	${resp}=    Get Request    ${omc_url_alias}   headers=${headers}
	[Return]    ${resp}
开启、关闭推广配置
	[Arguments]	${spread_id_list_variable}	${status_variable}	${x-token_headers}	${x-user-id_headers}	${x-username_headers}		
	[Documentation]	 *作者：谢应彪
	...	时间：2019-05-20 11:49:26
	...	x-token	string	token
	...	x-user-id	string	user-id
	...	x-username	string	username
	...	spread_id_list	array	必填，推广 id
	...	status	integer	1:正常，2:下架
	...	status	integer	1:正常，2:下架
	...		
	&{dic}    Get Variables
	@{list}    Get Variables
	${headers}    	拼装header参数    	${list}    &{dic}
	Set To Dictionary    ${headers}    Content-type=application/json
	${data}    拼装json参数    ${list}    &{dic}
	${url}    Set Variable    /spread/omc/update_switch_status
	${resp}=    Post Request    ${omc_url_alias}   ${url}    data=${data}    headers=${headers}
	[Return]    ${resp}
客户端启动初始化接口
	[Arguments]	${env_content_variable}		
	[Documentation]	 *作者：谢应彪
	...	时间：2019-05-20 11:49:26
	...	env_content	array	环境
	...	env_content	array	环境
	...		
	&{dic}    Get Variables
	@{list}    Get Variables
	${headers}    	拼装header参数    	${list}    &{dic}
	Set To Dictionary    ${headers}    Content-type=application/json
	${data}    拼装json参数    ${list}    &{dic}
	${url}    Set Variable    /spread/client/launch
	${resp}=    Post Request    ${omc_url_alias}   ${url}    data=${data}    headers=${headers}
	[Return]    ${resp}
按活动id查询活动详情
	[Arguments]	${activity_id_variable}	${activity_type_variable}	${spread_id_variable}	${x-token_headers}	${x-user-id_headers}	${x-username_headers}		
	[Documentation]	 *作者：谢应彪
	...	时间：2019-05-20 11:49:26
	...	x-token	string	token
	...	x-user-id	string	user-id
	...	x-username	string	username
	...	activity_id	string	活动 id
	...	activity_type	integer	活动类型，1:悬赏活动，2:转盘活动
	...	spread_id	string	推广 id
	...		
	&{dic}    Get Variables
	@{list}    Get Variables
	${headers}    	拼装header参数    	${list}    &{dic}
	Set To Dictionary    ${headers}    Content-type=application/x-www-form-urlencoded
	${data}    拼装url参数    ${list}    &{dic}
	${url}    Set Variable    /spread/omc/entrance_get_activity_detail?${data}
	${resp}=    Get Request    ${omc_url_alias}   headers=${headers}
	[Return]    ${resp}
添加或修改推广配置入口
	[Arguments]	${title_variable}	${position_id_variable}	${label_variable}	${content_variable}	${entrance_id_variable}	${resource_content_variable}	${spread_id_variable}	${img_url_variable}	${resource_type_variable}	${desc_variable}	${x-token_headers}	${x-user-id_headers}	${x-username_headers}		
	[Documentation]	 *作者：谢应彪
	...	时间：2019-05-20 11:49:26
	...	x-token	string	token
	...	x-user-id	string	user-id
	...	x-username	string	username
	...	title	string	必填，入口名称
	...	position_id	string	必填，入口位置 id
	...	label	array	标签
	...	content	string	活动内容
	...	entrance_id	string	必填，入口 id 
	...	resource_content		必填，内容结构
	...	spread_id	string	必填，推广 id 
	...	img_url	string	必填，入口图片
	...	resource_type	integer	必填，内容类型 image = 1;url = 2; app = 3;activity = 4; 
	...	desc	string	入口简介
	...	desc	string	入口简介
	...		
	&{dic}    Get Variables
	@{list}    Get Variables
	${headers}    	拼装header参数    	${list}    &{dic}
	Set To Dictionary    ${headers}    Content-type=application/json
	${data}    拼装json参数    ${list}    &{dic}
	${url}    Set Variable    /spread/omc/entrance_replace
	${resp}=    Post Request    ${omc_url_alias}   ${url}    data=${data}    headers=${headers}
	[Return]    ${resp}
按推广ID获取活动资源
	[Arguments]	${config_id_variable}	${spread_id_variable}		
	[Documentation]	 *作者：谢应彪
	...	时间：2019-05-20 11:49:26
	...	config_id	integer	配置 id
	...	spread_id	string	推广 id
	...		
	&{dic}    Get Variables
	@{list}    Get Variables
	${headers}    	拼装header参数    	${list}    &{dic}
	Set To Dictionary    ${headers}    Content-type=application/x-www-form-urlencoded
	${data}    拼装url参数    ${list}    &{dic}
	${url}    Set Variable    /spread/client/get_resource_by_spread?${data}
	${resp}=    Get Request    ${omc_url_alias}   headers=${headers}
	[Return]    ${resp}
获取推广内容
	[Arguments]	${spread_id_variable}	${x-token_headers}	${x-user-id_headers}	${x-username_headers}		
	[Documentation]	 *作者：谢应彪
	...	时间：2019-05-20 11:49:26
	...	x-token	string	token
	...	x-user-id	string	user-id
	...	x-username	string	username
	...	spread_id	string	推广 id
	...		
	&{dic}    Get Variables
	@{list}    Get Variables
	${headers}    	拼装header参数    	${list}    &{dic}
	Set To Dictionary    ${headers}    Content-type=application/x-www-form-urlencoded
	${data}    拼装url参数    ${list}    &{dic}
	${url}    Set Variable    /spread/omc/get?${data}
	${resp}=    Get Request    ${omc_url_alias}   headers=${headers}
	[Return]    ${resp}
批量删除推广配置入口
	[Arguments]	${entrance_id_list_variable}	${spread_id_variable}	${x-token_headers}	${x-user-id_headers}	${x-username_headers}		
	[Documentation]	 *作者：谢应彪
	...	时间：2019-05-20 11:49:26
	...	x-token	string	token
	...	x-user-id	string	user-id
	...	x-username	string	username
	...	entrance_id_list	array	必填，推广入口 id
	...	spread_id	string	必填，推广id
	...	spread_id	string	必填，推广id
	...		
	&{dic}    Get Variables
	@{list}    Get Variables
	${headers}    	拼装header参数    	${list}    &{dic}
	Set To Dictionary    ${headers}    Content-type=application/json
	${data}    拼装json参数    ${list}    &{dic}
	${url}    Set Variable    /spread/omc/entrance_delete
	${resp}=    Post Request    ${omc_url_alias}   ${url}    data=${data}    headers=${headers}
	[Return]    ${resp}
获取特殊资源
	[Arguments]	${config_id_variable}	${type_variable}		
	[Documentation]	 *作者：谢应彪
	...	时间：2019-05-20 11:49:26
	...	config_id	string	配置 id
	...	type	integer	0:商城，1:资讯
	...		
	&{dic}    Get Variables
	@{list}    Get Variables
	${headers}    	拼装header参数    	${list}    &{dic}
	Set To Dictionary    ${headers}    Content-type=application/x-www-form-urlencoded
	${data}    拼装url参数    ${list}    &{dic}
	${url}    Set Variable    /spread/client/get_special_resource?${data}
	${resp}=    Get Request    ${omc_url_alias}   headers=${headers}
	[Return]    ${resp}
获取行为开关
	[Arguments]	${id_variable}	${x-token_headers}	${x-user-id_headers}	${x-username_headers}		
	[Documentation]	 *作者：谢应彪
	...	时间：2019-05-20 11:49:26
	...	x-token	string	token
	...	x-user-id	string	user-id
	...	x-username	string	username
	...	id	string	id
	...		
	&{dic}    Get Variables
	@{list}    Get Variables
	${headers}    	拼装header参数    	${list}    &{dic}
	Set To Dictionary    ${headers}    Content-type=application/x-www-form-urlencoded
	${data}    拼装url参数    ${list}    &{dic}
	${url}    Set Variable    /spread/omc/v2/behavior/get?${data}
	${resp}=    Get Request    ${omc_url_alias}   headers=${headers}
	[Return]    ${resp}
批量按位置获取资源
	[Arguments]	${position_id_list_variable}	${config_id_variable}		
	[Documentation]	 *作者：谢应彪
	...	时间：2019-05-20 11:49:26
	...	position_id_list	array	位置 id列表，必填 ，悬浮图标，floating_box_top_left:悬浮图标左上,floating_box_top_right:悬浮图标右上,floating_box_bottom_left:悬浮图标左下,floating_box_bottom_right:悬浮图标右下；首页 index_top:首页上部,index_bottom:首页下部
	...	config_id	integer	配置 id
	...	config_id	integer	配置 id
	...		
	&{dic}    Get Variables
	@{list}    Get Variables
	${headers}    	拼装header参数    	${list}    &{dic}
	Set To Dictionary    ${headers}    Content-type=application/json
	${data}    拼装json参数    ${list}    &{dic}
	${url}    Set Variable    /spread/client/get_resource_by_position
	${resp}=    Post Request    ${omc_url_alias}   ${url}    data=${data}    headers=${headers}
	[Return]    ${resp}
添加或修改推广配置
	[Arguments]	${start_time_variable}	${area_variable}	${end_time_variable}	${spread_id_variable}	${title_variable}	${x-token_headers}	${x-user-id_headers}	${x-username_headers}		
	[Documentation]	 *作者：谢应彪
	...	时间：2019-05-20 11:49:26
	...	x-token	string	token
	...	x-user-id	string	user-id
	...	x-username	string	username
	...	start_time	integer	生效时间
	...	area	array	必填，推广区域，全国传10，精确到市，传市的地区码，市是4位地区码
	...	end_time	integer	结束时间
	...	spread_id	string	必填，推广 id
	...	title	string	必填，标题
	...	title	string	必填，标题
	...		
	&{dic}    Get Variables
	@{list}    Get Variables
	${headers}    	拼装header参数    	${list}    &{dic}
	Set To Dictionary    ${headers}    Content-type=application/json
	${data}    拼装json参数    ${list}    &{dic}
	${url}    Set Variable    /spread/omc/replace
	${resp}=    Post Request    ${omc_url_alias}   ${url}    data=${data}    headers=${headers}
	[Return]    ${resp}