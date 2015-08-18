package org.fogbeam.tutorial.reactjs

class CommentsController 
{
	static List<String> initialComments = new ArrayList<String>()
	
	static
	{
		initialComments.add( """{"author": "Pete Hunt", "text":"This is one comment"}""");
		initialComments.add( """{"author":"Jordan Walker", "text":"This is *another* comment"}""")
		initialComments.add( """{"author":"Phillip Rhodes", "text":"Wake up, Neo" }""");	
	}
	
	
	def list =
	{
		
		println "Client requested comments list!";
		
		
		// TODO: switch this out to use a Builder instead of building up
		// this string by hand like this.
		String commentsString = initialComments.join(",");
		
		render( text: "[" + commentsString +"]",
				contentType: "application/json" );
	}
	
	def save =
	{
		println "Client submitted new comment!";
		
		println "params:\n ${params}";
		
		
		
		List<String> comments = new ArrayList<String>();
		comments.addAll( initialComments );
		
		comments.add( "{\"author\":\"${params.author}\", \"text\":\"${params.text}\"}" );
		
		// TODO: switch this out to use a Builder instead of building up
		// this string by hand like this.
		
		String temp = comments.join( "," );
		String returnVal = "[" + temp + "]";
		
		render( text:returnVal,
				contentType: "application/json" );
	}
	
}
