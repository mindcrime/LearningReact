'use strict';

// const e = React.createElement;

class LikeButton2 extends React.Component {
  constructor(props) {
    super(props);
    this.state = { liked: false };
  }

  render() {
    if (this.state.liked) {
      return 'You liked comment number ' + this.props.commentID;
    }
    
    /* 
    return e(
      'button',
      { onClick: () => this.setState({ liked: true }) },
      'Like'
    );
    */
    
    return (
  		  <button onClick={() => this.setState({ liked: true })}>
  		    Like
  		  </button>
  		);
    
    
  }
}

// Find all DOM containers, and render Like buttons into them.
document.querySelectorAll('.like_button_container')
  .forEach(domContainer => {
    // Read the comment ID from a data-* attribute.
    const commentID = parseInt(domContainer.dataset.commentid, 10);
    
    /* 
    ReactDOM.render(
      e(LikeButton2, { commentID: commentID }),
      domContainer
    );
    */
    
    ReactDOM.render(
    	      <LikeButton2 commentID={commentID} />,
    	      domContainer
    	    );
  });