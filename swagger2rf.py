#!/usr/bin/python2.7
# -*- coding: utf-8 -*-
import sys, json, datetime, rf_info

reload(sys)
sys.setdefaultencoding('utf-8')
from swagger_parser import SwaggerParser

nowTime = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')


def get_all_apis(swagger_file):
    parser = SwaggerParser(swagger_path=swagger_file)
    operation = parser.operation
    opdic = {}
    for k, v in operation.items():
        print k
        print v
        opdic[v[0]] = k
    specification = parser.specification
    basePath = specification.get('basePath')
    paths = specification.get('paths')
    apis = []
    for path, v in paths.items():
        api = {}
        # print path
        # print specification
        sss = specification.get('paths')[path]
        for kk, vv in sss.items():
            api['desc'] = vv['description']
            print kk, vv
        # print sss
        api['uri'] = basePath + path
        # api['desc']=opdic[basePath+path]
        for method, v1 in v.items():
            api['method'] = method
            parameters = v1.get('parameters', [])
            ps = []
            for p in parameters:
                np = {}
                if (p['name'] == 'body'):
                    print 'ppppp'
                    print p
                    if 'items' in p['schema'].keys():
                        defi = p['schema']['items']['$ref'].replace('#/definitions/', '')
                    else:
                        defi = p['schema']['$ref'].replace('#/definitions/', '')
                    definitions = specification.get('definitions').get(defi)
                    post_ps = []
                    properties = definitions.get("properties")
                    if (properties):
                        for p, p_info in properties.items():
                            post_np = {}
                            post_np['p_name'] = p
                            if 'type' in p_info.keys():
                                post_np['p_type'] = p_info['type']
                            if 'description' in p_info.keys():
                                post_np['p_des'] = p_info['description']
                            post_np['p_in'] = 'body'
                            post_ps.append(post_np)
                        ps = ps + post_ps
                else:
                    np['p_in'] = p.get("in")
                    np['p_des'] = p.get("description")
                    np['p_type'] = p.get("type")
                    np['p_name'] = p.get("name")
                ps.append(np)
            api['ps'] = ps
        apis.append(api)
    return apis


def get_rf_parameters(parameters):
    # print(parameters)
    str = ''
    str2 = ''
    str3 = "\t[Arguments]\t"
    if (len(parameters) > 0):
        str += str3
        for p in parameters:
            # print p
            if (p):
                # 获取参数名字
                api_parameter_name = p.get("p_name")
                # 获取参数描述
                api_parameter_desc = p.get("p_des")
                # 获取删除类型
                api_parameter_type = p.get("p_type")
                api_in = p.get("p_in")
                if (api_in) != 'header':
                    str += "${" + api_parameter_name + "_variable}\t"
                else:
                    str2 += "${" + api_parameter_name + "_headers}\t"
    else:
        str = ""
    return str + str2


def get_description(parameters):
    string = ''
    if (parameters):
        for p in parameters:
            if (p):
                # 获取参数名字
                api_parameter_name = str(p.get("p_name", ''))
                # 获取参数描述
                api_parameter_desc = str(p.get("p_des", ''))
                print(api_parameter_desc)
                # 获取删除类型
                api_parameter_type = str(p.get("p_type", ''))
            string += '\t...\t' + api_parameter_name + '\t' + api_parameter_type + '\t' + api_parameter_desc + '\r\n'
    return string + '\t...\t\t'


def write_api_file(file_name, swagger_file):
    apis = get_all_apis(swagger_file)
    # 根据分类创建文件
    file = open(file_name, 'w')
    # 写入设置
    file.write(rf_info.rf_setting)
    for api in apis:
        # print api
        # 获取api描述
        api_desc = api['desc']
        # print api_desc
        # 获取请求方法
        api_method = api['method']
        # print api_method
        # 获取请求路径
        api_path = api['uri']
        # print api_path
        # 获取所有的参数
        api_parameter = api['ps']
        # print api_parameter
        # print(api_obj)
        # 写入标题
        file.write('\n%s\n' % (api_desc))
        # 写入参数
        # print get_rf_parameters(api_parameter)
        file.write(get_rf_parameters(api_parameter))
        # 写入描述
        p_desc = get_description(api_parameter)
        # print p_desc
        body_strring = rf_info.body_str % (
        nowTime, p_desc, 'json', '拼装json参数') if api_method == 'post' else rf_info.body_str % (
        nowTime, p_desc, 'x-www-form-urlencoded', '拼装url参数')
        # print(api_method)
        # print (body_strring)
        file.write(body_strring)
        # #写入请求的url
        # #print(api_method)
        file.write(rf_info.method_url.get(api_method) % ('', api_path))
        # #写入结尾的信息
        file.write(rf_info.rf_end_body)

if __name__ == '__main__':
    write_api_file('test.robot', 'swagger.json')
    pass
