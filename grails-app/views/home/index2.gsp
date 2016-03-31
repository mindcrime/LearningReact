<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
    	<title>Hello React - Index2 </title>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.8/react.js"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.8/react-dom.js"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.23/browser.min.js"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/marked/0.3.5/marked.min.js"></script>

			<script type="text/babel">
				// tutorial1.js
				var CommentBox = React.createClass({
  					
					getInitialState: function() {
    					return {data: []};
  					},

					loadCommentsFromServer: function() {

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

					componentDidMount: function() {
    					this.loadCommentsFromServer();
    					setInterval(this.loadCommentsFromServer, this.props.pollInterval);
  					},
					render: function() {
    					return (
      							<div className="commentBox">
    								<h1>Comments</h1>
									<CommentList data={this.state.data} />        					
        							<CommentForm />   							 
	
      							</div>
    						);
  						}
				});


				// tutorial2.js
				var CommentList = React.createClass({
  				render: function() {
    				
						var commentNodes = this.props.data.map(function(comment) {
      						return (
        						<Comment author={comment.author} key={comment.id}>
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
	 				 	rawMarkup: function() {
    						var rawMarkup = marked(this.props.children.toString(), {sanitize: true});
    						return { __html: rawMarkup };
  						},
						render: function() {
    					return (
      						<div className="comment">
        						<h2 className="commentAuthor">
          							{this.props.author}
        						</h2>
        						<span dangerouslySetInnerHTML={this.rawMarkup()} />
     	 					</div>
    						);
  						}
					});


				ReactDOM.render( <CommentBox url="http://localhost:8080/react1/comments/list" pollInterval={2000} />, document.getElementById('content') );      				    		
			</script>


	</head>
	<body>
	
		
	
		<div id="content">
			<h1>Welcome to React - Index2!</h1>
			
		</div>
		
	</body>
</html>