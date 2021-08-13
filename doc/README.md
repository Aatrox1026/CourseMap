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
				"cid":{cid}
			}]

			
	post
		./course
		require:
			{
				"name":{name},
				"description":{desc},
				"level":{level},
				"dname":{dname}
			}
		response:
			{insert_id}


	patch
		./course/{id}					//only send values that are modified
		require:
			{
				"name":{name},			(optional)
				"description":{desc},	(optional)
				"level":{level},		(optional)
				"dname":{dname}			(optional)
			}
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
				"description":{desc},
				"language":{lang},
				"price":{price},
				"hours":{hours}
			}]


	post
		./reference
		require:
			{
				"name":{name},
				"type":{type},
				"link":{link},
				"description":{desc},
				"language":{lang},
				"price":{price},
				"hours":{hours}
			}


	patch
		./reference/{id}				//only send values that are modified
		require:
			{
				"name":{name},			(optional)
				"type":{type},			(optional)
				"link":{link},			(optional)
				"description":{desc}	(optional)
				"language":{lang},		(optional)
				"price":{price},		(optional)
				"hours":{hours}			(optional)
			}


	delete
		./reference/{id}
		response:
			delete successfully


	
department
	get
		./department
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
		./field/{id}
		response:
			[{
				"id":{id},
				"name":{name}
			}]


	post


	patch
	

	delete



mappingFDC
	get


	post
		./mappingFDC
		require:
			{
				"fid":{fid},
				"did":{did},
				"cid":{cid}
			}
		response:
			{insert_id}

		
	patch
		./mappingFDC/{id}		//only send values that are modified
		require:
			{
				"fid":{fid},	(optional)
				"did":{did},	(optional)
				"cid":{cid}		(optional)
			}
		response:
			update successfully


	delete
		./mappingFDC/{id}
		response:
			delete successfully



mappingCR
	get


	post
		./mappingCR
		require:
			{
				"cid":{cid},
				"rid":{rid}
			}
		response:
			{insert_id}

		
	patch
		./mappingCR/{id}		//only send values that are modified
		require:
			{
				"cid":{cid},	(optional)
				"rid":{rid},	(optional)
			}
		response:
			update successfully


	delete
		./mappingCR/{id}
		response:
			delete successfully



user
	get
		./user/{id}
		response:
			[{
				"id":{id},
				"name":{name},
				"passwd":{passwd},
				"privilege":{privilege}
			}]


	post
		./user/create
		require:
			{
				"name":{name},
				"passwd":{passwd},
				"privilege":{privilege}
			}
		response:
			{insert_id}
		
		./user/login
		require:
			{
				"name":{name},
				"passwd":{passwd}
			}
		response:
			{token}


	patch
		./user/{id}						//only send values that are modified
		require:
			{
				"name":{name},			(optional)
				"passwd":{passwd},		(optional)
				"privilege":{privilege}	(optional)
			}
		response:
			"update successfully"


	delete
		./user/{id}
		response:
			"delete successfully"