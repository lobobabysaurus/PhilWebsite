
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
        )
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
        )
    }
});

//Form for submitting new text
var TextForm = React.createClass({
    render: function () {
        return (
            <div className="textForm">
            </div>
        )
    }
});

//Box to hold various text
var TextBox = React.createClass({
    render: function () {
        return (
            <div className="textBox">
                <h1>Text of React TextBox</h1>
                <TextList data={this.props.data} />
                <TextForm />
            </div>
        );
    }
});

//Basic comment text data
var data = [
    {author: "Phil Simmons", text: "Phil started learning React on 9/26"},
    {author: "Phil Simmons", text: "This is *another* text"}
];

//Render data to the page
React.render(<TextBox data={data}/>, document.getElementById("content"));