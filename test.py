sss={'required': True, 'in': 'body', 'description': 'List of user object', 'name': 'body', 'schema': {'items': {u'x-scope': [''], '$ref': '#/definitions/User'}, 'type': 'array'}}
print sss['schema']["items"]["$ref"]

s=None
print str(s)+'111'
