<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
    	<title>Hello React</title>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.13.3/react.js"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.13.3/JSXTransformer.js"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		
	</head>
	<body>
	
		
	
		<div id="content">
			<h1>Welcome to React!</h1>
		</div>
   		<script type="text/jsx">
				// tutorial1.js
				var CommentBox = React.createClass({
				  render: function() {
   					 return (
      					<div className="commentBox">
        					<h1>Comments</h1>
        					<CommentList />
        					<CommentForm />
      					</div>
    					);
  					}
				});

				// tutorial2.js
				var CommentList = React.createClass({
  				render: function() {
    			return (
      					<div className="commentList">
        					Hello, world! I am a CommentList.
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


				React.render(
  					<CommentBox />,document.getElementById('content'));

    	</script>
		
	</body>
</html>
