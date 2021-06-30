API
取得所有課程
	output:
		Course *

取得某課程資料
	input:
		Course id
	output:
		Course *
		Department name

取得某課程Ref
	input:
		Course id
	output:
		Reference *

輸入”系”跟”領域”來取得課程
	input:
		Field id
		Department id
	output:
		Course id

取得所有”系”
	output:
		Department *
	
取得所有”領域”
	output:
		Field *

course
	get
		./course
		response:
			[{
				"id":{id},
				"name":{name},
				"description":{desc},
				"level":{level},
				"dname":{dname}
			}]

		./course/{cid}
		response:
			[{
				"id":{id},
				"name":{name},
				"description":{desc},
				"level":{level},
				"dname":{dname}
			}]

		./course/{fid}/{did}
		response:
			[{
				"cid":{cid}
			}]
	post

	patch
	
	delete

reference
	get
		./reference/{cid}
		response:
			[{
				"id":{id},
				"name":{name},
				"type":{type},
				"link":{link},
				"description":{desc}
			}]
	post

	patch
	
	delete
	
department
	get
		./department/{id}
		response:
			[{
				"id":{id},
				"name":{name}
			}]
	post

	patch
	
	delete

field
	get
		./field/{id}
		response:
			[{
				"id":{id},
				"name":{name}
			}]
	post

	patch
	
	delete