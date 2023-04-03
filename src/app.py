from flask import Flask, render_template, request
import sqlite3
from os.path import dirname

app = Flask(__name__)

# read SQL queries from file
with open(f'{dirname(__file__)}/schema.sql', 'r') as f:
    sql_queries = f.read()

# create new database and execute queries
connection = sqlite3.connect('schema.db')
cursor = connection.cursor()
cursor.executescript(sql_queries)
connection.commit()

# Define a route for the home page
@app.route('/', methods=['GET', 'POST'])
def home():
    query_dict = {"Total billing": """-- Query 1: Each hospital location's total amount in billing 
-- Retrieves the total billing amount for each hospital via joining the Hospital and Billing tables first (through hospital_ID)
-- It calculates the sum total value of billing_amount based on each hospital (uses SUM()) 
-- Then it joins the Patient table on hospital_ID
-- It groups the result by hospital_name (which is then displays the sum calculation and/or the function SUM())

SELECT hospital.hospital_name, SUM(billing.billing_amount) as sum_billingamount
FROM Hospital hospital
INNER JOIN Billing billing ON patient.patient_ID = billing.patient_ID
INNER JOIN Patient patient ON hospital.hospital_ID = patient.hospital_ID
GROUP BY hospital.hospital_name;"""
}
    if request.method == 'POST':
        query_text = request.form['query_text']
        try:
            connection = sqlite3.connect('schema.db')
            cursor = connection.cursor()
            cursor.execute(query_text)
            results = cursor.fetchall()
            column_names = [description[0] for description in cursor.description]
            connection.close()
            return render_template('index.html', results=results, column_names=column_names, query_text=query_text, error=None, query_dict=query_dict)
        except Exception as e:
            error = str(e)
            return render_template('index.html', results=None, column_names=None, query_text=query_text, error=error, query_dict=query_dict)
    else:
        for key, value in query_dict.items():
            query_dict[key] = value.replace("'", '"')
        return render_template('index.html', results=None, column_names=None, query_text=None, error=None, query_dict=query_dict)


if __name__ == '__main__':
    app.run(debug=True)