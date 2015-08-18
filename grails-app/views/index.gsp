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

				// tutorial1.js
				var CommentBox = React.createClass({


					handleCommentSubmit: function(comment) {
    						
							console.log( comment );
    						$.ajax({
      							url: "http://localhost:8080/react1/comments/save",
      							dataType: 'json',
      							type: 'POST',
      							data: comment,
      							success: function(data) {
        								this.setState({data: data});
      							}.bind(this),
      							error: function(xhr, status, err) {
        							console.error(this.props.url, status, err.toString());
      							}.bind(this)
    						});

  					},

				 	getInitialState: function() {
    					return {data: []};
  				  	},
	
  					componentDidMount: function() {
    						$.ajax({
      								url: this.props.url,
      								dataType: 'json',
      								cache: false,
      								success: function(data) {
        								this.setState({data: data});
      								}.bind(this),
      								error: function(xhr, status, err) {
        								console.error(this.props.url, status, err.toString());
      							}.bind(this)
    						  });
  					},
				  render: function() {
   					 return (
      					<div className="commentBox">
        					<h1>Comments</h1>
        					<CommentList data={this.state.data} />
        					<CommentForm onCommentSubmit={this.handleCommentSubmit} />
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

				handleSubmit: function(e) {
    					e.preventDefault();
						this.props.onCommentSubmit({author: author, text: text});
    					var author = React.findDOMNode(this.refs.author).value.trim();
    					var text = React.findDOMNode(this.refs.text).value.trim();
    					if (!text || !author) {
      						return;
    					}

    					this.props.onCommentSubmit({author: author, text: text});
    					React.findDOMNode(this.refs.author).value = '';
    					React.findDOMNode(this.refs.text).value = '';
    					return;
  				},

  				render: function() {
    			return (
      						<form className="commentForm" onSubmit={this.handleSubmit}>
      					  	<input type="text" placeholder="Your name" ref="author" />
        					<input type="text" placeholder="Say something..." ref="text" />
        					<input type="submit" value="Post" />
      						</form>    					
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

				// tutorial11.js
				React.render(
  					<CommentBox url="http://localhost:8080/react1/comments/list" />,
  					document.getElementById('content')
				);

    	</script>
		
	</body>
</html>
