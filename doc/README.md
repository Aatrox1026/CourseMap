connection/connect.php 更改成自己的 userName跟passwd



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
		./course/{id}
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
				"id":{id}
			}]

	post
		require:
			[{
				"name":{name},
				"description":{desc},
				"level":{level},
				"dname":{dname}
			}]
		response:
			{insert_id}

	patch
		./course/{id}					//only send values that are modified
		require:
			[{
				"name":{name},			(optional)
				"description":{desc},	(optional)
				"level":{level},		(optional)
				"dname":{dname}			(optional)
			}]
		response:
			update successfully
	
	delete
		./course/{id}
		response:
			delete successfully

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
		./reference
		require:
			[{
				"name":{name},
				"type":{type},
				"link":{link},
				"description":{desc}
			}]
			
	patch
		./reference/{id}				//only send values that are modified
		require:
			[{
				"name":{name},			(optional)
				"type":{type},			(optional)
				"link":{link},			(optional)
				"description":{desc}	(optional)
			}]
	
	delete
		./reference/{id}
		response:
			delete successfully
	
department
	get
		./department
		response:
			[{
				"id":{id},
				"name":{name}
			}]

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
		./field
		response:
			[{
				"id":{id},
				"name":{name}
		./field/{id}
		
		response:
			[{
				"id":{id},
				"name":{name}
			}]
	post

	patch
	
	delete