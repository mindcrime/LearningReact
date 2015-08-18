<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
    	<title>Hello React</title>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.13.3/react.js"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.13.3/JSXTransformer.js"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/marked/0.3.2/marked.min.js"></script>
		
	</head>
	<body>
	
		
	
		<div id="content">
			<h1>Welcome to React!</h1>
		</div>
   		<script type="text/jsx">


				var data = [
  						{author: "Pete Hunt", text: "This is one comment"},
  						{author: "Jordan Walke", text: "This is *another* comment"},
						{author: "Phillip Rhodes", text: "Wake up, Neo" }
					];



				// tutorial1.js
				var CommentBox = React.createClass({
				  render: function() {
   					 return (
      					<div className="commentBox">
        					<h1>Comments</h1>
        					 <CommentList data={this.props.data} />
        					<CommentForm />
      					</div>
    					);
  					}
				});

				// tutorial2.js
				var CommentList = React.createClass({
  				render: function() {

				    var commentNodes = this.props.data.map(function (comment) {
      					return (
        					<Comment author={comment.author}>
          					{comment.text}
        					</Comment>
      					);
    				});

    				return (
      					<div className="commentList">
        					{commentNodes}
      					</div>
    					);
  					}
				});

				var CommentForm = React.createClass({
  				render: function() {
    			return (
      					<div className="commentForm">
        					Hello, world! I am a CommentForm.
      					</div>
    					);
  					}	
				});


				// tutorial4.js
				var Comment = React.createClass({
  				render: function() {
				
				var rawMarkup = marked(this.props.children.toString(), {sanitize: true});
    			return (
     				 	<div className="comment">
        					<h2 className="commentAuthor">
          						{this.props.author}
        					</h2>
        					<span dangerouslySetInnerHTML={{__html: rawMarkup}} />
      					</div>
    					);
  					}
				});


				React.render(
  						 <CommentBox data={data} />,
						document.getElementById('content')
					);

    	</script>
		
	</body>
</html>
