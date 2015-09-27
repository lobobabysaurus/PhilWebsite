
var Text = React.createClass({
    rawMarkup: function() {
        var rawMarkup = marked(this.props.children.toString(), {sanitize: true});
        return { __html: rawMarkup };
    },
    render: function () {
        return (
            <div className="text">
                <h2 className="textAuthor">
                    {this.props.author}
                </h2>
                <span dangerouslySetInnerHTML={this.rawMarkup()} />
            </div>
        );
    }
});

//List of text entries with their author
var TextList = React.createClass({
    render: function () {
        var textNodes = this.props.data.map(function (text) {
            return (
                <Text author={text.author}>
                    {text.text}
                </Text>
            );
        });
        return(
            <div className="textList">
                {textNodes}
            </div>
        );
    }
});

//Form for submitting new text
var TextForm = React.createClass({
    handleSubmit: function(e){
        e.preventDefault();
        var author = React.findDOMNode(this.refs.author).value.trim();
        var text = React.findDOMNode(this.refs.text).value.trim();
        if(!text || !author) {
            return;
        }
        this.props.onTextSubmit({author: author, text: text});
        React.findDOMNode(this.refs.author).value = '';
        React.findDOMNode(this.refs.text).value = '';
        return;
    },
    render: function () {
        return (
            <form className="textForm" onSubmit={this.handleSubmit}>
                <input type="text" placeholder="Your name" ref="author"/>
                <input type="text" placeholder="Say Something ..." ref="text"/>
                <input type="submit" value="Post" />
            </form>
        );
    }
});

//Box to hold various text
var TextBox = React.createClass({
    loadCommentsFromServer: function() {
        $.ajax({
            url: this.props.url,
            dataType: 'json',
            cache: false,
            success: function (data) {
                this.setState({data: data})
            }.bind(this),
            error: function (xhr, status, err) {
                console.error(this.props.url, status, err.toString());
            }.bind(this)
        });
    },
    handleTextSubmit: function(text) {
        this.setState({data: this.state.data.push(text)});
        $.ajax({
            url: this.props.url,
            dataType: 'json',
            type: 'POST',
            data: text,
            success: function(data) {
                console.log(data);
                this.setState({data: data});
            }.bind(this),
            error: function (xhr, status, err) {
                console.error(this.props.url, status, err.toString());
            }.bind(this)
        });
    },
    getInitialState: function() {
        return {data: []};
    },
    componentDidMount: function() {
        this.loadCommentsFromServer();
        setInterval(this.loadCommentsFromServer, this.props.pollInterval);
    },
    render: function () {
        return (
            <div className="textBox">
                <h1>Text of React TextBox</h1>
                <TextList data={this.state.data} />
                <TextForm onTextSubmit={this.handleTextSubmit} />
            </div>
        );
    }
});

//Render data to the page
$(document).ready( function () {
    React.render(<TextBox url="/api" pollInterval={2000}/>, document.getElementById("content"));
});
