from flask import Flask, render_template # type: ignore

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')  # Renders the HTML page

@app.route('/about')
def about():
    return "<h2 style='text-align:center; padding-top:50px;'>This is the About page 🚧</h2>"


if __name__ == '__main__':
    app.run(debug=True)
