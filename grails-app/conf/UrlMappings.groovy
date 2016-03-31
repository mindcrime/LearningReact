class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		"/index2"(controller:"home", action:"index2")
		"500"(view:'/error')
	}
}
