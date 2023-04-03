from flask import Flask, render_template, request
import sqlite3

app = Flask(__name__)

# Define a route for the home page and the SQL query page


@app.route('/', methods=['GET', 'POST'])
def home():
    if request.method == 'POST':
        query_text = request.form['query_text']
        try:
            connection = sqlite3.connect('schema.db')
            cursor = connection.cursor()
            cursor.execute(query_text)
            results = cursor.fetchall()
            column_names = [description[0]
                            for description in cursor.description]
            connection.close()
            return render_template('index.html', results=results, column_names=column_names, query_text=query_text, error=None)
        except Exception as e:
            error = str(e)
            return render_template('index.html', results=None, column_names=None, query_text=query_text, error=error)
    else:
        return render_template('index.html', results=None, column_names=None, query_text=None, error=None)


if __name__ == '__main__':
    app.run(debug=True)
