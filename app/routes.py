from flask import Blueprint, request, jsonify, render_template
from .db import get_db_connection

app_routes = Blueprint('app_routes', __name__)

@app_routes.route('/')
def home():
    """Serve the main HTML page."""
    return render_template('index.html')

@app_routes.route('/api/data', methods=['POST','GET'])
def manage_data():
    if request.method == 'POST':
        data = request.json
        name = data.get('name')
        email = data.get('email')
        phone = data.get('phone')

        if not name or not email or not phone:
            return jsonify({"error": "All fields are required"}), 400

        connection = get_db_connection()
        with connection.cursor() as cursor:
            cursor.execute("INSERT INTO records (name, email, phone) VALUES (%s, %s, %s)", (name, email, phone))
            connection.commit()
        connection.close()
        return jsonify({"message": "Record added successfully"}), 201
    elif request.method == 'GET':
        # Logic for retrieving data
        connection = get_db_connection()
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM records")
            records = cursor.fetchall()
        connection.close()
        return jsonify(records)


@app_routes.route('/api/data/<int:id>', methods=['PUT'])
def update_data(id):
    """Update an existing record."""
    data = request.json
    name = data.get('name')
    email = data.get('email')
    phone = data.get('phone')

    if not name or not email or not phone:
        return jsonify({"error": "All fields are required"}), 400

    connection = get_db_connection()
    with connection.cursor() as cursor:
        sql = "UPDATE records SET name = %s, email = %s, phone = %s WHERE id = %s"
        cursor.execute(sql, (name, email, phone, id))
        connection.commit()
    connection.close()

    return jsonify({"message": "Record updated successfully"}), 200


@app_routes.route('/api/data/<int:id>', methods=['DELETE'])
def delete_data(id):
    """Delete a record."""
    connection = get_db_connection()
    with connection.cursor() as cursor:
        sql = "DELETE FROM records WHERE id = %s"
        cursor.execute(sql, (id,))
        connection.commit()
    connection.close()

    return jsonify({"message": "Record deleted successfully"}), 200


@app_routes.route('/api/table_data', methods=['GET'])
def get_data():
    """Retrieve paginated data for DataTables."""
    draw = int(request.args.get('draw', 1))  # Draw counter for DataTables
    start = int(request.args.get('start', 0))  # Starting record index
    length = int(request.args.get('length', 10))  # Number of records per page

    connection = get_db_connection()
    with connection.cursor() as cursor:
        # Fetch total record count
        cursor.execute("SELECT COUNT(*) AS total FROM records")
        total = cursor.fetchone()['total']

        # Fetch paginated records
        sql = "SELECT * FROM records LIMIT %s OFFSET %s"
        cursor.execute(sql, (length, start))
        records = cursor.fetchall()

    connection.close()

    return jsonify({
        "draw": draw,  # Echo back the draw counter
        "recordsTotal": total,  # Total number of records in the database
        "recordsFiltered": total,  # Total number of records after filtering (same as total for now)
        "records": records,  # The paginated data
    })

