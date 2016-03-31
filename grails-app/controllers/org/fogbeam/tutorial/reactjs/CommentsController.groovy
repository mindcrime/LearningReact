package org.fogbeam.tutorial.reactjs

class CommentsController 
{
	static List<String> initialComments = new ArrayList<String>()
	
	static
	{
		initialComments.add( """{"author": "Pete Hunt", "text":"This is one comment"}""");
		initialComments.add( """{"author":"Jordan Walke", "text":"This is *another* comment"}""")
		initialComments.add( """{"author":"Phillip Rhodes", "text":"Wake up, Neo" }""");
		initialComments.add( """{"author":"Morpheus", "text":"Take the Red Pill" }""");	
	}
	
	
	def list =
	{
		
		println "Client requested comments list!";
		
		
		// TODO: switch this out to use a Builder instead of building up
		// this string by hand like this.
		
		println "How many comments? " + initialComments.size();
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
